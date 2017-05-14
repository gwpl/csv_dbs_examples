# csv_dbs_examples
It is CSV "DBs" examples.
Purpose is to have convenient set of CSV files for testing CSV imports and joins in other systems, like `csvsql` or Base,Kexi import, etc. Also to provide "hello world" examples from few systems for convenient overview.

# Installation of dependencies

## csvsql, csvlook
http://csvkit.readthedocs.io/en/0.9.1/install.html

	pip install csvkit

## ODS - LibreOffice Base

* More about [LibreOffice Base](https://en.wikipedia.org/wiki/LibreOffice)
* File assumes you linked csv inputs under : `/tmp/csv_dbs_examples/csv_inputs`

# Inputs

	$ csvlook csv_inputs/CDs.csv 

| CDTitle  | ArtistID | LocID |
| -------- | -------- | ----- |
| CDTitle1 | A1       | L1    |
| CDTitle2 | A1       | L2    |
| CDTitle3 | A2       | L1    |
| CDTitle4 | A2       | L2    |

	$ csvlook csv_inputs/Artists.csv 

| ArtistID | Artist  |
| -------- | ------- |
| A1       | Artist1 |
| A2       | Artist2 |

	$ csvlook csv_inputs/Locations.csv 

| LocID | Location  |
| ----- | --------- |
| L1    | Location1 |
| L2    | Location2 |


# Notes

## csvsql

	$ csvsql --query 'SELECT CDTitle,Location,Artist FROM CDs JOIN Artists ON CDs.ArtistID=Artists.ArtistID JOIN Locations ON CDs.LocID = Locations.LocID' "$@"

Produces:

| CDTitle  | Location  | Artist  |
| -------- | --------- | ------- |
| CDTitle1 | Location1 | Artist1 |
| CDTitle2 | Location2 | Artist1 |
| CDTitle3 | Location1 | Artist2 |
| CDTitle4 | Location2 | Artist2 |


# Screenshots

## LibreOffice Base - imported csv files

![LibreOffice Base - Database Wizard - Step 1](screenshots/LibreOffice_Base_DB_Wizard_Step1_Screenshot_20170514.png)

![LibreOffice Base - Database Wizard - Step 2](screenshots/LibreOffice_Base_DB_Wizard_Step2_Screenshot_20170514.png)

![LibreOffice Base Tables Example](screenshots/LibreOffice_Base_Tables_Screenshot_20170514.png)

![LibreOffice Base Form Example](screenshots/LibreOffice_Base_Form_Example_of_Locations_to_CDs_to_Artists_Resolution_Screenshot_20170514.png)

