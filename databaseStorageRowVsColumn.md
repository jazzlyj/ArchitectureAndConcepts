# Database Storage Types - Row vs Columnar


## How data is stored on the disk
* On the hard disk, data is organized into blocks at the lowest level, which is the smallest unit the computer reads the disk at a time. 
* Databases will load all the information from the blocks that contain the data it’s looking for. 
    * If the target data is stored in fewer blocks, the database will operate much faster.


## Row-oriented databases
* Each data chunk in a block is one row from the table
* Row-store is beneficial when most of the columns need to be accessed at the same time. 
    * Not recommended to have very wide tables because you probably dont need all the columns all the time


### Row based DB software 
* Postgres, MySQL, and GCP Cloud Storage

### Pros
* Best suited for OLTP applications.
* Inserting and deleting data is easy.

### Cons
* The compression rate is low, thus taking more space.
* Might read unnecessary data.




## Column-oriented databases
* Each data chunk is an entire column. It means that all the data in a col will be grouped together


### Column based DB software 
* Amazon Redshift and (GCP) BigQuery

### Pros
* Best suited for OLAP application.
* Compression rate is high because the data in cols is of the same data type. 
    * Simple and powerful methods like RLE (Run Length Encoding), Bit Vector Encoding, and Null suppression can be effectively used on each column and gives better compression ratios because the compression algorithm works better on values with the same data type.
* The query doesn’t need to scan unnecessary columns at all.
* Efficient in analytical operations like aggregation over many rows.

### Cons
* Read and write the full record is slower.

## Reference:
https://towardsdatascience.com/understand-columnar-and-row-based-database-2cd29ae35bd0

