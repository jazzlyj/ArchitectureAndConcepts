# Data Load Techniques

## Incremental Data Load
* Efficient; only process a subset of rows and it utilizes less resources
    * As data scales this approach becomes a must
* Various incremental load approaches:

### Source Change Detection
Use two key fields "modifiedAt" and "createdAt" datetime fields to detect changes. Pull data into the ETL pipeline that is inserted and/or changed since the last ETL run.

### Destination Change Comparison
If the source does not support the Source Change Detection, then fall back to a source-to-destination comparison. Compare the source data to the destination to determine which are new or modified rows. This method of change detection requires a row-by-row comparison to differentiate unchanged and changed data. This is less performant than the source change detection. 

### Change Data Capture
Change Data Capture is a software process that identifies and tracks changes to data in a database. 
CDC provides real-time or near-real-time movement of data by moving and processing data continuously as new database events occur.

https://www.striim.com/blog/change-data-capture-cdc-what-it-is-and-how-it-works/




# Reference
https://blog.devgenius.io/python-etl-pipeline-the-incremental-data-load-techniques-20bdedaae8f