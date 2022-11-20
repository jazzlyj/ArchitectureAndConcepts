# Modular data models 
Data models that exist independently from one another.

# Base Models
* Create base models for each of your raw data sources
* Always keep a copy of your raw data, untouched in data warehouse. 
* Can always revert back to the raw copy in case the data is ever compromised.

## Base models include:

* data type casting
* column name changes
* timezone conversions
* simple case when statements

## Base models dont include:
* fancy calculations
* joins 
* aggregations
They are just a standardized versions of the raw data that makes it easier to reference in data models downstream.

# Identify common code between your data models

# Create Models from the repeated code
* By turning repeated code into its own model: 
    * saving on compute costs and run time
    * models will run a lot faster 
* Take out any pieces of code that are specific to a certain data model.


* The goal is for these pieces to be un-specific and reusable

# Reference this model in the other models
After you pull out the shared code and make it its own data model you can reference this new model in your original models


# Reference:
https://towardsdatascience.com/how-to-make-your-data-models-modular-71b21cdf5208