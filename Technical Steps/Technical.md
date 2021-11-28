## Project Report:<a id="report"></a>

### Extract<a id="extract"></a>
The original Data Sources used are outlined above in the [Data Sources](#sources) section.

The files are contained in the Resources/Input directory.

Using [Jupyter Notebook](#notebook):

These CSV files were loaded into [Pandas](#pandas) Dataframes by using the pd.read_csv Pandas function using Jupyter Notebook.

![Extract](../Images/extract.png)

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

A Table Schema reflecting our final dataframe was created using [QuickDBD](#quickdbd).

![TableSchemaDiagram](Table%20Schema/Table-Schema-Diagram.png)

This was used to export a [PostgreSQL Table Schema](5%20-%20Table%20Schema.sql) .sql file.

[PgAdmin](#pgadmin) was used to create a Database and the code from the Table Schema SQL file was used a Query to create the table.

![Table Creation](Images/table_creation.png)

A Query was run to make sure the table had been created correctly.

![Check Table](Images/check_table.png)

The final merged data was imported into a DataFrame in a new Notebook.

For this step the [SQlAlchemy](#sqlalchemy) module was also imported and also a [Config](#config) file with the username and password of the PostgreSQL server and database is stored. This was done so the username and password is not leaked when uploaded to the repository.


![Import Final Data](Images/import_final.png)

A connetion to the database was established and then an inspect command was run to see if the table was visible to verify the connection.


![See Table](Images/see_table.png)

The to_sql function was used to load the dataframe contents to the PostgreSQL table.

![Load Data](Images/load.png)

Finally a Query was run on the database using pgAdmin to verify the data had loaded into the table.

![verify data load](Images/verify_load.png)