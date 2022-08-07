Designing your Database Schema

content from 
https://towardsdatascience.com/designing-your-database-schema-best-practices-31843dc78a8d
by Chloe Lubin

# Architecture decision factors:
* Decide whether using a star or snowflake schema is right for you, 
* how normalization v. denormalization affect your analytics, and what the future of database schema design looks like

Good database schema design is essential for any company leveraging relational database management systems. If time isn't spent designing a logical and intuitive database schema now, it will be spent later trying to figure out how tables are related and how to perform JOINs between tables. What is a database schema? A schema is a snapshot of all the objects contained in a database (tables, views, columns, keys, etc.) and their relationships. It's a bird's eye view of the database structure. A schema is represented using an Entity-Relationship Diagram (ERD), a flowchart that pictures how entities are related in a database system, where rectangles represent entities (e.g. tables), ovals, attributes (e.g. columns), and diamonds, relationships (e.g. one-to-one, one-to-many, many-to-one, and many-to-many). For more information on the elements that compose an ERD, check out this article by Lucidchart.


Entity-Relationship Diagram example (Wikimedia Commons)
Here, I'll talk about the different schema models, normalization v. denormalization, and what the future holds for schema design. I’m assuming that the schema is implemented in an enterprise data warehouse (EDW) and that the database is relational in nature. Let's get started! ▶️

# Schema Models
The most common schema models in a relational database system are the star schema and the snowflake one.

## Star Schema ⭐️
The star schema is the simplest schema model and the most commonly used.
A central fact table that can be joined on by surrounding dimension tables. 
The dimension tables of a star schema model are denormalized, requiring fewer JOINs, 
PROS: simpler querying logic and increased query performance.


Own chart (created with Lucidchart)
SELECT 
    loc.region, 
    loc.country,
    vir.family as virus_subfamily_name,
    vir.infect_rate,
    fact.death_cnt
FROM fact_pandemic AS fact
    LEFT JOIN dim_location AS loc
        ON fact.location_id = loc.id
    LEFT JOIN dim_virus AS vir
        ON fact.virus_id = vir.id
    LEFT JOIN dim_dates AS d
        ON fact.dates_id = d.id
WHERE d.year = 2020


## Snowflake (“3NF“) Schema ❄️
The snowflake schema (or “3rd Normal Form” schema)  
Like a star schema except for the fact that the dimension tables are completely normalized. 
Normalization helps for a number of reasons: it helps reduce duplicates in the data, lower the amount of storage space used and avoid performing data deletion or update commands in multiple places. 
Cons: slower query performance due to the higher number of JOINs to perform.



SELECT 
    r.region, 
    c.country,
    fam.name AS virus_subfamily_name,
    t.infect_rate, 
    fact.death_cnt
FROM fact_pandemic AS fact
    LEFT JOIN dim_country AS c
        ON fact.location_id = c.id
    LEFT JOIN dim_region AS r
        ON r.id = c.region_id
    LEFT JOIN dim_virus AS vir
        ON fact.virus_id = vir.id
    LEFT JOIN dim_virus_family AS fam
        ON fam.id = vir.family_id 
    LEFT JOIN dim_transmission t
        ON vir.type_id = t.id 
    LEFT JOIN dim_dates AS d
        ON fact.dates_id = d.id
    LEFT JOIN dim_year AS y
        ON d.year_id = y.id
WHERE y.year = 2020


## Galaxy Schema (Fact Constellation Schema) 🌌
The galaxy schema (also known as fact constellation schema) is a combination of the star and snowflake schema models. 
* completely normalized 
* more design complexity since there can be more than one fact table and there can be multiple dependencies that exist between dimension and fact tables. 
PROS: great data quality and accuracy, which can enhance your reporting. 
CONS: complex and may affect the performance of your query.


## Data Vault 2.0 🔐
Data Vault 2.0 evolved out of data vault, created in the 2000’s by Dan Linstedt. According to its designer, data vault is a “hybrid approach encompassing the best of breed between 3rd normal form (3NF) and star schema” by providing an agile framework to scale and adapt an EDW (see Super Charge Your Data Warehouse by Dan Linstedt). The model is built around 3 things: hubs, satellites, and links.


Own chart (inspired by this article)
Hubs are tables that store primary keys that uniquely identify a business element. Other pieces of information include a hash key (useful for running the model on a Hadoop system), the data source and the load time.

Satellites are tables that contain the attributes of a business object. They store foreign keys that can be referenced in a hub or link table, as well as the following pieces of info:

a parent hash key (foreign key of the hash key in the hub)
load start and end dates (in satellites, historical changes are captured)
the data source
any relevant dimensions of the business object
Links set the relationship between 2 hubs via the business keys defined in the hubs. A link table contains:

a hash key, which acts like a primary key and uniquely identifies the relationship between 2 hubs in hash format
foreign hash keys referencing the primary hash keys in the hubs
foreign business keys referencing the primary business keys in the hubs
load date
data source
The data vault model is adaptable (relatively less manual operations need to be performed if a column is added or deleted, a data type changed, or a record updated) and auditable (the data source and date records allow to trace data). However, it still needs to be converted to a dimensional model in order to be usable for business intelligence purposes. For that reason, you’ll likely want to add a dimensional layer in the form of a data mart, for example, to enable BI analysts. Dimension tables will source from the hubs while the fact table will source from the link tables as well as the satellites.

# Normalization v. denormalization

## Normalization
Normalization is the process of reducing data redundancy by breaking down larger tables into smaller ones. 
normalization allows for more storage space and, as a result, increased performance of the database system. 
eliminating duplicate rows, the data is clean and organized. 
Shifts burden onto analytics. 
Normalized databases require more JOINs between tables, which affects query performance. 
pulling data from a normalized database, the report page might take a while longer to load. 
Using a denormalized table might be a better option for increased performance.

## Denormalization
Denormalization, on the other hand, refers to the process of grouping tables together. 
Flattened or denormalized tables are synonymous. 
The JOINs are usually built into the flattened view, resulting in fewer JOINs needed to retrieve the data. 
* dashboards and other reports load faster. However, 
CONS: duplicate rows in the dataset, which might require additional data wrangling before producing a clean and accurate final report for distribution.

The Future of Schema Design
AI-powered schema design
These days, Artificial Intelligence and Machine Learning (AI/ML) is all the talk. You can’t go by a day without hearing news about AI and the way it’s changing the world. Machine learning also has a role to play in database schema design. Today, the process of designing database schema is manual and labor-intensive. However, Databaseology professor Andy Pavlo tells us that since the early days of the RDBMS, people have thought about developing an autonomous, “self-adaptive,” database system, including automated schema design.

One initial project looked into automatic database schema design: AutoMatch. It tackled the problem of “finding mappings between the attributes of two semantically related database schemas.” What if a new database element was added — how to map it properly to other elements in the database? By using feature selection and ranking the probabilistic result, Automatch would assign a ranked predictive value for each discovery, scoring the likelihood of 2 elements being related to each other. While the predictions from the machine need to be validated, projects like Automatch are powerful examples of what can be done to streamline database design operations.

In addition to streamlining the database schema design process, having tools to automate ERD design can have great cost and time saving implications for businesses… as long as the predictions have a high accuracy rate. Some companies are starting to offer such services, like dbdiagram.io. It offers a tool to automatically design database diagrams using DSL code. However, the linkage between database elements is still done manually and it’ll probably be a few years before we see a functional tool come out that fully automates the design of ERDs, including the mapping of new elements to existing database elements.

Agile method
As much as companies would like to anticipate their data needs 10 years from now, it’s not always possible to predict what the future holds. That’s why it’s important to adopt an agile method when creating or remodeling a database schema design. As companies are increasingly moving from on-premise servers to the cloud, the migration process is a time to reflect on new innovative ways to increase agility, adaptability and scalability of an EDW. Data vault 2.0 offers a good foundation. Looking ahead, the next iteration will have to focus on building an agile schema model while providing highly optimized and performant functionalities to perform analytical operations.

Conclusion
In the end, the best database schema design will depend on the type of data collected by a company, the organization’s data maturity, and its analytics objectives. In this article, I've covered the different schema models, the differences between normalization and denormalization, and finally, what the future holds for schema design, particularly with the use of machine learning to automate the design process. Hopefully, you’re better equipped to design your next database schema model!

This post was last edited on June 12, 2022. The opinions expressed here belong solely to myself, and do not reflect the views of my employer.

