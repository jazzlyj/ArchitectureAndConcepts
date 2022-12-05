/************************************************************************/
/* Title: Generic SQL Recursion				                */
/* Author: Duncan Raus		Date: 19/08/2022                        */
/* Comments:        							*/
/* All SQL used is ANSI 2011 compliant SQL functions,               	*/
/* so all databases will have functional equivalents.                 	*/
/*                                                                  	*/
/* Covers lots of use cases:                                        	*/
/* 1. Data Analysis    			          	                */  
/* 2. Data Modelling		                                        */
/* 3. Data Discovery                                   			*/
/************************************************************************/
/*********************************************************************************/
/*                                                                               */
/*                      SQL RECURSION + SQL PANDAS                               */
/*                                                                               */
/*********************************************************************************/
/*
Background about the data:
Generally, Source systems clearly define DB Contraints,
For Example: 
  1. You can't submit an order without an account.
  2. You can't create an account unless it has a valid address and valid payment profile, etc... 
This represents a list of the DB Constraints which is enforced as part of Referential Integrity,
The data below intentionally doesn't have any meaningful column names (they are numeric values), 
instead we will follow the data flow through the use of:
- pk: primary key
- fk: foreign key
*/
WITH RECURSIVE METADATA AS
    (SELECT 1 AS pk, 0 as fk, 'SalesOrderDetail' as Table_Name, 1000000 as RecordCount union all
     SELECT 2 as pk, 1 as fk, 'SalesOrderHeader' as Table_Name, 100000 as RecordCount union all
     SELECT 3 as pk, 2 as fk, 'OrderType' as Table_Name, 10 as RecordCount union all
     SELECT 4 as pk, 2 as fk, 'Account' as Table_Name, 5000 as RecordCount union all
     SELECT 5 as pk, 4 as fk, 'Address' as Table_Name, 1000 as RecordCount union all
     SELECT 6 as pk, 5 as fk, 'ZipCode/PostCode' as Table_Name, 100 as RecordCount
     ) 
/*  METADATA_WITH_PANDAS                                                                                */    
/* N-TILE: Is a window function that distributes rows of an ordered partition into a pre-defined number */
/*   of roughly equal groups                                                                            */
/* In our case NTILE(5), so a group between 1 to 5                                                      */ 
/* Each line item RecordCount is converted to a percentage of the total Recotd count,                   */
/* and anything which has a percentage greater than 10%                                                 */
/* Partition By 1 ensures all the records are used as the denominator.                                  */

  , METADATA_WITH_PANDAS AS
  (select *,
          CAST(REPEAT(IF(RC.RecordCount 
                      / IF(RC.RecordCount=0,1, SUM(RC.RecordCount) OVER (PARTITION BY 1)) >= 0.1    /*0.1 = 10%    */
                    ,'=','-')  	  /* Over 10% of the data is a big table, could be a candidate for a fact table?   */
				  /* In that case lets flag the data differently, and weight it as a '=' not a '-'.*/
          , NTILE(5) OVER (ORDER BY RC.RecordCount)) AS string) AS lineage_weight
    from METADATA RC)   

/* SQL RECURSION                                                                   		        */
/* Handy to use, if has a child / parent hierarchy e.g. org chart linking managers to employees         */
 ,  RECURSE AS 
    ((
      /*Anchor Query: no ancestors i.e. in this case has no FK. */
      SELECT *, 1 as depth, concat('|', lineage_weight,'>', Table_Name) as lineage 
      FROM METADATA_WITH_PANDAS WHERE fk = 0) 
      ---------
      UNION ALL
      ---------
       /* Self join to *THIS* Recursive CTE Query */
      (SELECT M.* , R.depth+1 as depth, 
            concat(r.lineage,m.lineage_weight,'>', cast(m.Table_Name as string)) as lineage  
       FROM METADATA_WITH_PANDAS M
       JOIN RECURSE R  /*--> This is the name of this CTE, so this CTE is calling itself.*/
         ON M.FK = R.PK
      )) 

SELECT  Table_Name, /* pk, fk, recordcount, */ depth, lineage 
FROM RECURSE
ORDER BY depth, pk