# Project #2 - Extract, Transform, and Load

![Title Image](Images/etl.png)

## Contents
* [Project Proposal](#proposal):
*    1. [Project Outline](#outline)
*    2. [Data Sources](#sources)
*    3. [Final Production Database](#final-production-db)
*    4. [Findings](#findings)

* [Project Report](#report):
*    1. [Extract](#extract)
*    2. [Transform](#transform)
        1. [Happiness Data](#happiness-data)
        2. [Alcohol Consumption Data](#alcohol-data)
*    3. [Load](#load)

* [Repository Structure](#repo)
* [Main Working Files](#main)
* [Dependencies](#dependencies)
*   1. [Environment](#environment)
*   2. [Modules](#modules)
*   3. [Config password file](#config)
* [Software Used](#software)
* [Team - Roles](#team)


## Project Proposal:<a id="proposal"></a>

For the complete proposal report please refer to:\n
[Project Proposal](0 - Project Proposal.pdf) PDF File.

### Project Outline<a id="outline"></a>
One might argue that people are momentarily happier when drinking alcohol -- but that over more extended periods, drinking more does not make them more satisfied with life. As such, the industry we have focused on is healthcare. 

This project is an attempt to extract, transform and load a final dataset that can address questions behind how the use of alcohol impacts the happiness of nations around the globe.


### Data Sources<a id="sources"></a>
We needed 2 data sets:

1. [Alcohol Consumption Data](https://www.who.int/data/gho/data/indicators/indicator-details/GHO/total-(recorded-unrecorded)-alcohol-per-capita-(15-)-consumption) -
(ref: World Health Organisation - Alcohol, total per capita (15+) consumption (in litres of pure alcohol) (SDG Indicator 3.5.2))

A dataset with alcohol consumed per person on average for each country.

2. [World Happiness Report]() - (ref: Kaggle.com - World Happiness Report up to 2020)

A dataset with Happiness metrics, such as GDP per capita, Healthy Life Expecatancy and a Happiness score. 

These data sets were downloaded as CSV files and stored in the Input folder ([Resources/Input](Resources/Input))

There are 3 files in this folder:
1. WHO-alcohol-data.csv
2. 2015.csv (Happiness data for 2015)
3. 2019.csv (Happiness data for 2019)

### Final Production Database<a id="final-production-db"></a>
For the final data both a Relational Database such as SQL or a Non-Relational database such as Mongo DB, could have been used.

We chose to load the data into a PostgreSQL database which is a Relational Database.

The reason for using a Relational Database is because they are better suited to our purpose due to the ability to write complex SQL queries for data analysis and reporting.

### Findings<a id="findings"></a>
The resulting dataset can be used for future analysis to determine if alcohol consumption can predict happiness score, GDP per capita or healthy life expectancy. 

## Project Report:<a id="report"></a>

### Extract<a id="extract"></a>
The original Data Sources used are outlined above in the Data Sources section.

The files are contained in the Input directory.

These CSV files were loaded into Pandas Dataframes by using the pd.read_csv Pandas function using Jupyter Notebook.

![Extract](Images/extract.png)

### Transform<a id="transform"></a>

#### Happiness Data<a id="happiness-data"></a>

To transform the data we needed to first analyse the data and select which data we needed.

Then we dropped any columns we did not require using the dataframe.drop fuction in Pandas.

![DropColumns](Images/drop_columns.png)

We dropped columns that we deemed should not directly be related to Alcohol Consumption.

The remaining columns were renamed for readability and consistency. The Happiness Data has 2 separate CSV files that need to be concatenated together. In order to do this, both dataframes must have matching column names.

![RenameColumns](Images/rename_columns.png)

A column was added to designate the Year the data is for

![YearColumn](Images/year_column.png)

The above steps were repeated for the 2019 Happiness Data.

Then finally the data was concatenated into a single dataframe and exported to a CSV file.

![ConcatenateDataframe](Images/concatenate.png)


#### Alcohol Consumption Data<a id="alcohol-data"></a>

The downloaded file was imported into Pandas

![ExtractConsumption](Images/extract2.png)

Columns that were not required were dropped.

![DropColumns](Images/drop_columns2.png)

Columns were renamed for consistency between this data and the Happiness Data.

![RenamedColumns](Images/rename_columns2.png)

This dataset only contained records for the Years 2000, 2005, 2010, 2015 and 2019 and the not the Years in between. Our Happiness Data contained Year 2015-2019. The only years we can match are 2015 and 2019, therefore we filtered the data to only include values for these 2 years.

![FilterYears](Images/filter_years.png)

The litres per capita column had a strange format with the average figure followed by a range in brackets (e.g. 9.6[8-11.1])

We only wanted the average figure that was before the brackets.

So we used a function to strip this data out into a new column.

![AverageFigure](Images/average_figure.png)

Then the undesired column with brackets was dropped.

![DropColumns](Images/drop_columns3.png)

Finally numerical columns had their data type set to numeric instead of object. This was checked and then the dataframe was exported to a CSV.

![Numeric](Images/numeric.png)

Next, both Data sets were loaded into a single Notebook file.

When imported a new Unnamed:0 Column had appeared in each dataframe, so this had to be dropped.

![Happiness Final](Images/happiness_final.png)

![Alcohol Final](Images/alcohol_final.png)

The country was set as the index for the alcohol consumption data.

![Set Index](Images/set_index.png)

Both dataframes were then merged on the Year and Country columns

![Merge](Images/merge.png)

The columns were re-ordered in a way we wanted to present the data.

![Reorder Columns](Images/reorder.png)

The data was checked for any missing values

![Check NaN](Images/check_nan.png)

The country was set as the index.

![Set Index](Images/set_index2.png)

The columns were renamed, replacing spaces with underscores, for the purpose of matching the Table Field names in PostgreSQL.

![Rename Columns](Images/rename_columns3.png)

The data was rearraned in a way we wanted to present it. By sorting litres per capita average in most to least (descending order).

And finally the dataframe was exported to a CSV file.

![Sort Values](Images/sort_values.png)

### Load<a id="load"></a>

A Table Schema reflecting our final dataframe was created using QuickDBD.

![TableSchemaDiagram](4%20-%20Table-Schema-Diagram.png)

This was used to export a [PostgreSQL Table Schema](5%20-%20Table%20Schema.sql) .sql file.

PgAdmin was used to create a Database and the code from the Table Schema SQL file was used a Query to create the table.

![Table Creation](Images/table_creation.png)

A Query was run to make sure the table had been created correctly.

![Check Table](Images/check_table.png)

The final merged data was imported into a DataFrame in a new Notebook.

For this step the SQlAlchemy module was also imported and also a Config file with the username and password of the PostgreSQL server and database is stored. This was done so the username and password is not leaked when uploaded to the repository.


![Import Final Data](Images/import_final.png)

A connetion to the database was established and then an inspect command was run to see if the table was visible to verify the connection.


![See Table](Images/see_table.png)

The to_sql function was used to load the dataframe contents to the PostgreSQL table.

![Load Data](Images/load.png)

Finally a Query was run on the database using pgAdmin to verify the data had loaded into the table.

![verify data load](Images/verify_load.png)


## Respository Structure<a id="repo"></a>
* Root folder([/](/))  - Contains Main Notebook files and Table Schema files. These files have been prefixed with a number to designate the order they were completed and run.

* Images Folder ([Images/](Images/)) - Contains image files used in README.

* Resources Folder ([Resources](Resources/)) - Contains Input and Output Folders.
    * [Resources/Input](Resources/Input) - Contains original data from downloaded data sets, in the form of CSV files.
    * [Resources/Output](Resources/Output) - Contains data that has been transformed, in the form of CSV files.


## Main Working Files<a id="main"></a>

* The root([/](/)) folder contains all the main working files.
    * The files are numbered in the order they were created and run.
    ![File Order](Images/file_order.png)
    * 1 - Happiness Data.ipynb - Jupyter notebook: Extraction and Transformation process of the Happiness Data
    * 2 - Alcohol Consumption Data.ipynb - Jupyter notebook: Extraction and Transformation process of the Alcohol Data
    * 3 - Merge Datasets.ipynb - Jupyter Notebook: Dataset Merge of Transformed Alcohol Consumption and Happiness Data
    * 4 - Table-Schema-Diagram.png - Image File: Table Schema Diagram from QuickDBD
    * 5 - Table Schema.sql - SQL File: SQL code to create PostgreSQL Table
    * 6 - Load Data.ipynb - Jupyter Notebook: Importing and Loading Merged Data into PostgreSQL database table.


## Dependencies<a id="Dependencies"></a>
### Python Environment and Package Mananger<a id="environment"></a>
* [Anaconda](https://www.anaconda.com/products/individual)

### Modules<a id="modules"></a>

You can use conda or pip to install the packages below

e.g. `pip install Pandas`\
e.g. `conda install Pandas`

* [Jupyter Notebook](https://jupyter.org/install.html)<a id="notebook"></a>
* [Pandas](https://pypi.org/project/pandas/)<a id="pandas"></a>
* [SQLAlchemy](https://pypi.org/project/SQLAlchemy/)<a id="sqlalchemy"></a>
* [Psycopg2](https://pypi.org/project/psycopg2/)<a id="psycopg2"></a>

### Config password file<a id="config"></a>

## Software Used
* [PgAdmin](https://www.pgadmin.org/)<a id="pgadmin"></a>

## Team - Roles<a id="team"></a>

Although each person worked primarily on their allocated task, all steps were reviewed and completed as a team effort.

* [Elena Dragomir](https://github.com/elliedragomir)
    * Primary task: Project Outline and Proposal and Finding Datasets
    * Secondary task: ETL (Extract, Transform, Load) Process.

* [Mini Yadav](https://github.com/Miniy751) 
    * Primary task: ETL (Extract, Transform, Load) Process
    * Secondary task: Finding Datasets

* [Abdurrahman Raja](https://github.com/Abzraja)
    * Primary task: PostgreSQL Table Schema, PostgreSQL Table Creation and README.
    * Secondary task: ETL (Extract, Transform, Load) Process