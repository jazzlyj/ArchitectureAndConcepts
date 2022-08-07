Data Engineering for Beginners: Data Lake and Data Warehousing

By Mahmud Oyinloye
https://medium.com/@le.oasis/data-engineering-for-beginners-data-lake-and-data-warehousing-2440a91f5990


As a growing data professional, you’ll probably find yourself developing an ETL solution at some point, and although you might be a Data Analyst/Scientist, the basics of Data Engineering are very key in career growth, mainly cause it combines SQL, Python, Machine Learning, DevOps & Data Visualisation skills.


Datalakehouse

# Prerequisites
* Analytics is defined as any action that converts data into insights.
<br>
* A Data architecture is the structure that enables the storage, transformation, exploitation, and governance of data.
🕯️ This data needs a home, and a Data Lake is the preferred solution for creating that home.

# Data Engineering
This is the practice of designing and building systems for collecting storing and analyzing data at scale. 
<br>
It is a broad field with applications in just about any industry.
Data Engineering is the complex task of making raw data usable to Data Scientists and groups within an organization.
These pipelines must take data from many disparate sources and collect them into a single warehouse that represents the data uniformly as a single source of truth.
Role of a Data Engineer.
Data “engineers” design and build pipelines that transform and transport data into a format wherein, by the time it reaches the Data Scientists or other end users it is in a highly usable state.
Why does a Data Engineer build data pipelines?: because they want to get their data into a place (dashboard, report, ML model) from where the business can make, data-driven decisions.
The data has to be in a usable condition so that someone can use this data to make decisions. Many times, the raw data is not very useful.

# Data Lake
It generally describes a place where you can securely store various types of data of all scales for processing and analytics.
<br>
Data Lakes are typically used to drive Data Analytics, Data Science & ML workloads, or batch and streaming data pipelines.
Data Lakes will accept all types of data, they are portable, on premise or in the cloud.
The first line of defense in enterprise data is your data lake. It’s the central, give me whatever data at whatever volume, variety, formats, and velocity you got. I can take it.
Big data, Data Science, and Analytics supporting data-­driven decision-making promise to bring unprecedented levels of insight and efficiency to everything from how we work with data to how we work with customers to the search for a cure for cancer — but data science and analytics depend on having access to historical data.
In recognition of this, companies are deploying Big Data Lakes to bring all their data together in one place and start saving history, so data scientists and analysts have access to the information they need to enable data­-driven decision making.
🕯 A data lake brings together data from across the enterprise into a single location.

A common term in data engineering, is the concept of a data lake.
A data lake brings together data from across the enterprise to a single location, you might get the data from a relational database or from a spreadsheet and store the raw data in a data lake.
One option for this single location to store the raw data is to store it in a cloud storage bucket. S3 bucket.
A data lake is a medium where an organization brings all their data together in one place and starts saving history, so data scientists and analysts have access to the information they need to enable data­ driven decision-making.
The reason to make raw data available to analysts is so they can perform self ­service analytics. Self­ service has been an important mega-trend towards democratization of data.

Datalakehouse
🕯 Access to a company’s data (Self Service) gives rise to big challenge involving Governance and Data Security, Data Compliance; who has access privileges to company data.

## Considerations
* Does your data lake handle all the data you have?
* Can it all fit into a cloud storage bucket? If you have an RDMS; need to put the data in Cloud SQL (managed dB) rather than Cloud Storage.
* Can it elastically scale to meet the demand? As your data collected increases, will you run out of disk space (on-premise problem)?
* Does it support high throughput ingestion, what is the network bandwidth?
* Do you have edge points of presence, is there fine-grained access control to objects? Do users need to seek within a file or is it enough to get a file as a whole?
* Cloud Storage is blob storage, so you might need to think about the granularity of what you store.
* Can other tools connect easily?
💡 The purpose of a Data Lake, is to make data accessible for analytics.

# Data Warehousing
A data warehouse is a type of data management system that is designed to enable and support business intelligence (BI) activities, especially analytics.
A typical data warehouse often includes the following elements:
* A relational database to store and manage data.
* An extraction, loading, and transformation (ELT) solution for preparing the data for analysis.
* Statistical analysis, reporting, and data mining capabilities.
* Client analysis tools for visualizing and presenting data to business users.
* Other, more sophisticated analytical applications that generate actionable information by applying Data Science and artificial intelligence (AI) algorithms, or graph and spatial features that enable more kinds of analysis of data at scale.

# Data Lake Architecture
Data from external sources is loaded first into a raw or landing zone, where it is filed in folders that reflect its provenance (for instance, time and source) without further processing. Sometimes also called the raw or staging zone, is used to house raw ingested data.
Then, as appropriate, this data is copied into the gold zone, where it is cleansed, curated, and aggregated.
The gold zone frequently mirrors the landing area, but contains cleansed, enriched, and otherwise processed versions of the raw data.
This zone (gold) is sometimes also called prod to indicate that the data it contains is production-ready, or cleansed to indicate that the data has been run through data quality tools and/or a curation process to clean up (or cleanse) data quality problems.
The work zone, where users run their projects, or the sensitive zone, where data that should be protected is kept in encrypted volumes.
The sensitive zone is sometimes created to keep files containing data that is particularly important to protect from unauthorized viewers, whether because of regulatory requirements or business needs.

# Data Lakes vs Data Warehousing.
A data lake is a capture of every aspect of your business operation.

The data is stored in its natural/raw format, usually as object blobs or files.

Retain all data in its native format.
Support all data types and all users.
Adapt to changes easily.
Tends to be application-specific.
How do you take this flexible & large amount of data and do something with it?

Typically loaded only after a use case is defined.
Provide faster insights.
Current/Historical data for reporting.
Tends to have a consistent schema shared across applications.
Take the raw data from a Data Lake & then Process → Organise → Transform then store it in a Data Warehouse.
Modernizing Data Lakes and Data Warehousing with Google Cloud.
Google Cloud Storage Bucket.
A good option for staging all of your raw data in one place, before building transformation pipelines into your data warehouse.
Businesses use Cloud Storage as backup and archival storage for their businesses.
Storing Data in a Cloud Storage Bucket is durable and performant.
For a Data Engineer, you will often use a Cloud Storage Bucket as part of your Data Lake, to store many different raw data files, such as csv, json or avro.
You could then load or query them directly from Big Query; as a data warehouse.
Real-Time Analytics live data.
Batch pipelines are not enough, what if you need real-time analytics on data that arrives continuously & endlessly.
In that case, you might receive the data in Pub Sub, transform it using Data Flow & Stream it using Big Query.
Real-Time Streaming
Stream processing is a data management technique that involves ingesting a continuous data stream to quickly analyze, filter, transform or enhance the data in real-time.
🕯️ Data Pipelines largely perform the cleanup & processing of data. They are responsible for doing the transformations and processing of your data at scale & bring entire systems to life with freshly, newly processed data for analysis.

# Challenges of Data Engineers
As a Data Engineer; you’ll usually encounter a few problems when building data pipelines.
You might find it difficult to access the data that you need. You might find that the data, even after you access it, doesn’t have the quality that’s required by the Analytics or Machine Learning Model.
If you plan to build a model & even if the data quality exists, you might find that the transformations require computational resources that might not be available to you.
Challenges around Query performance; being able to run queries & transformations with the computational resources that you have.

Data Access
What makes Data Access difficult?

Data in many businesses is siloed by departments & each department creates its own transactional systems to support its own business processes.
So you might have operational systems that correspond to store systems, and have a different operating system maintained by your product warehouses that manage your inventory.
And have a marketing department that manages all the promotions given that you need to do an analytic query on.
Such as;

You need to know how to combine data from the stores. From the promotions & from the inventory levels.
And because all these are stored in separate systems, some that have restricted access, building an analytics system that uses all three of these data sets to answer an ad-hoc query from above could be very difficult.
Data Accuracy and Quality.
The second challenge is that of cleaning, formatting, and getting the data ready for insights requires you to build ETL pipelines.
ETL pipelines are usually necessary to ensure data accuracy and quality.
ETL; get the raw data and transform it into a form with which you can actually carry out the necessary analysis.
The cleaned and transformed data are typically stored in a Data Warehouse (not a Data Lake).
A Data Warehouse is a consolidated place to store the data, and all the data are easily joinable and queryable.
🕯️ In a Data Lake; data is in a raw format, In a Data Warehouse; the data is stored in a way that makes it efficient to query.

Because data becomes useful, only after you clean it up; you should assume that any raw data that you collect from source systems need to be cleaned and transformed.
Transform it into a format that makes it efficient to query.
🕯️ ETL the data & store it in Data Warehouse.

Availability of Computational Resources.
The availability of computational resources can be a challenge if you are on an on-premise system.
Data Engineers would need to manage server and cluster capacity & make sure that enough capacity exists to carry out ETL jobs.
The problem is that the compute needed by these ETL jobs is not constant over time. Very Often, it varies week to week, depending on factors like holidays and promotional sales.
This means that when traffic is low, you are wasting money. And when traffic is high, your jobs are taking way too long.
Once your data is in a Data Warehouse, you need to optimize the queries your users are running, to make the most efficient use of your compute resources.

Big Query — Google
BigQuery is a fully managed enterprise data warehouse that helps you manage and analyze your data with built-in features like machine learning, geospatial analysis, and business intelligence.
BigQuery’s server-less architecture lets you use SQL queries to answer your organization’s biggest questions with zero infrastructure management.
BigQuery’s scalable, distributed analysis engine lets you query terabytes in seconds and petabytes in minutes.
🕯️ Big Query is used as a Data Warehouse.


Our operational systems, like our relational databases that store online orders, inventory & promotions, are our raw data sources on the left, note that this isn’t exhaustive.
You could have other source systems that are manual like csv. These upstream data sources get gathered together in a single consolidated position in our data lake, which is designed for durability and high availability.
Once in the Data Lake, the data often needs to be processed via transformations that then output the data into our data warehouse which is ready for use by downstream teams.


🕯️ Data Engineers are Digital Plumbers.

