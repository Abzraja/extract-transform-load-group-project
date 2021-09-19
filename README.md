# Project #2 - Extract, Transform, and Load

![Title Image](Images/etl.png)

## Contents
* Project Proposal:
*    1. Project Outline
*    2. Data Sources
*    3. Final Production Database
*    4. Findings

* Project Report:
*    1. Extract
*    2. Transform
        1. Happiness Data
        2. Alcohol Consumption Data
*    3. Load

* Repository Structure
*    1. Root (/)
*    2. Images (/Images)
*    3. Resources (/Resources)

* Main Working Files
* Dependencies
*   1. Modules
*   2. Config password file
* Software Used
* Config password file
* Team - Roles


## Project Proposal:

### Project Outline
One might argue that people are momentarily happier when drinking alcohol -- but that over more extended periods, drinking more does not make them more satisfied with life. As such, the industry we have focused on is healthcare. 

This project is an attempt to extract, transform and load a final dataset that can address questions behind how the use of alcohol impacts the happiness of nations around the globe.


### Data Sources
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

### Final Production Database
For the final data both a Relational Database such as SQL or a Non-Relational database such as Mongo DB, could have been used.

We chose to load the data into a PostgreSQL database which is a Relational Database.

The reason for using a Relational Database is because they are better suited to our purpose due to the ability to write complex SQL queries for data analysis and reporting.

### Findings

## Project Report:

### Extract
The original Data Sources used are outlined above in the Data Sources section.

The files are contained in the Input directory.

These CSV files were loaded into Pandas Dataframes by using the pd.read_csv Pandas function using Jupyter Notebook.

![Extract](Images/extract.png)

### Transform
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





### Load


## Respository Structure

## Main Working Files

## Dependencies

### Modules

### Config password file

## Software Used


