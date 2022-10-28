# Data Warehousing - Design 



## Dimension Tables
* Structure that categorizes facts and measures 
* Commonly used dimensions are people, products, place and time.

### Slowly Changing dimension, SCD
A Slowly Changing Dimension (SCD) is a dimension that stores and manages both current and historical data over time in a data warehouse. Tracking the history of dimension records.

#### Type 0: Original
* Attributes never change and are assigned to attributes that have durable values or are described as 'Original'. 
* Examples: Date of Birth, Original Credit Score. 
* Type 0 applies to most date dimension attributes

#### Type 1: Overwrite
* The new data overwrites the existing data. 
    * Existing data is lost as it is not stored anywhere else. 

#### Type 2:
* Creating another dimension record
* Retains the full history of values. 
    * When the value of a chosen attribute changes, the current record is closed. 
        * New record is created with the changed data values and this new record becomes the current record. 
        * Each record contains the effective time and expiration time to identify the time period between which the record was active.
    
#### Type 3: 
* Creating a current value field
    * Stores two versions of values for certain selected level attributes. 
        * Each record stores the previous value and the current value of the selected attribute. 
            * When the value of any of the selected attributes changes, the current value is stored as the old value and the new value becomes the current value.    

#### Type 4: 
* add history table
    * keeps the current data, and an additional table is used to keep a record of some or all changes





## Fact or Product Tables 
A fact table typically has two types of columns: those that contain facts and those that are a foreign key to dimension tables.

### Measure Types
* Additive - measures that can be added across any dimension.
* Non-additive - measures that cannot be added across any dimension.
* Semi-additive - measures that can be added across some dimensions.

#### Summary Tables
A fact table might contain either detail-level facts or facts that have been aggregated 

#### Handling ratios and percentages. 
* good design rule never store percentages or ratios in fact tables but only calculate these in the data access tool. 
* store the numerator and denominator in the fact table, which then can be aggregated and the aggregated stored values can then be used for calculating the ratio or percentage in the data access tool.


#### Junction Tables aka "factless fact tables"
* Fact table that contains no measures or facts. 
* Used for modeling many-to-many relationships or for capturing timestamps of events.[1]

### Types of Fact Tables
* Transactional
A transactional table is the most basic and fundamental. The grain associated with a transactional fact table is usually specified as "one row per line in a transaction", e.g., every line on a receipt. Typically a transactional fact table holds data of the most detailed level, causing it to have a great number of dimensions associated with it.
* Periodic snapshots
The periodic snapshot, as the name implies, takes a "picture of the moment", where the moment could be any defined period of time, e.g. a performance summary of a salesman over the previous month. A periodic snapshot table is dependent on the transactional table, as it needs the detailed data held in the transactional fact table in order to deliver the chosen performance output.
* Accumulating snapshots
This type of fact table is used to show the activity of a process that has a well-defined beginning and end, e.g., the processing of an order. An order moves through specific steps until it is fully processed. As steps towards fulfilling the order are completed, the associated row in the fact table is updated. An accumulating snapshot table often has multiple date columns, each representing a milestone in the process. Therefore, it's important to have an entry in the associated date dimension that represents an unknown date, as many of the milestone dates are unknown at the time of the creation of the row.
* Temporal snapshots
By applying temporal database theory and modeling techniques the temporal snapshot fact table [3] allows to have the equivalent of daily snapshots without really having daily snapshots. It introduces the concept of time Intervals into a fact table, allowing saving a lot of space, optimizing performances while allowing the end user to have the logical equivalent of the "picture of the moment" they are interested in.




## Reference:
https://blog.devgenius.io/slowly-changing-dimensions-55645ff716be
https://www.oracle.com/webfolder/technetwork/tutorials/obe/db/10g/r2/owb/owb10gr2_gs/owb/lesson3/slowlychangingdimensions.htm
https://en.wikipedia.org/wiki/Slowly_changing_dimension
https://en.wikipedia.org/wiki/Dimension_(data_warehouse)