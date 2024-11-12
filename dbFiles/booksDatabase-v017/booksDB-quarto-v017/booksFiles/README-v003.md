# WHAT IS THIS FOLDER?

This folder contains a collection of files to be used for teaching about relational databases.
(see below for more information about the specific files that are in this folder).

I created this folder format to help in teaching my classes on 
Relational Databases and SQL using R. 

The same format for this folder is used for other folders that contain information for
other databases. 

The names of the files in this folder (as well as the folder name itself) may include 
a version number in the form of -v###. For example the file name

      somefile-v003.docx

is the 3rd version of the file "somefile.docx". As files are modified I increase the 
version number directly in the filename. This makes it easy to know if the file you are 
looking at is the same or different from another copy of the same file - just look
at the version numbers.



# WHAT TYPES OF FILES ARE IN THIS FOLDER?

1. The "csv" folder contains several different .csv files. 
   Each .csv file contains the contents of a single table that is part of a relational database.

2. The "documentation" folder (if it exists) contains any documentation about the database.
   There may (or may not) be a Microsoft Word document that describes the contents of the database
   in more detail. In addition there may be other files that have practice exercises (and possibly
   answers).

3. The "importToR" folder contains files that are used to import the .csv files into R.
   See the next section for details about how to do that.




# HOW TO IMPORT THE CSV FILES INTO R DATAFRAMES

You can import all of the data to R using any of the following approaches. All of these ways use
the files that appear in the importToR folder.

## ONE WAY (easier way) - use the .RData file (if it exists) in the importToR folder

Run the following R command with the .RData file that appears in the "importToR" folder:

   load("/path/to/filename.RData")   # where filename.RData is the name of the .RData file that appears in this folder

## ANOTHER WAY - read the individual .csv files into R

There is a separate CSV file for each table. These files are located in the csv folder. You can read each csv file into R by using either the read.csv from the base R installation or the readr::read_csv function from the readr package.
   

## YET ANOTHER WAY - use the readCsvFiles.R script that appears in the importToR folder

NOTE: if the importToR folder contains a .RData file, then the other way should be easier ...

Another way to accomplish the same thing:

1. You will need to make one change to the file, readCsvFiles.R, that appears in the "importToR" folder.
   Edit the file.
   NOTE, the file may be called readCsvFiles-v004.R or something similar. The -v004 is a version number.
   Future releases of this file may have larger version numbers)

2. The code in this .R file uses functions from the "readr" package. You must have this package
   installed in order for the script to work. If you don't have the readr package installed on your computer
   then run the R command:

      install.packages("readr")

3. Change the line at the top of the file, readCsvFiles.R, that sets the variable, pathToFolder.
   Set this variable to the path to the folder that contains the csv files.
   There is an example in a comment in the code.


4. You can import all of the .csv files into R by running ALL of the code in the file:  readCsvFiles.R




-Prof. Yitzchak Rosenthal