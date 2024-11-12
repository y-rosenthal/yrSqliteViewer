#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# INSTRUCTIONS
#
# Set the following variable to the folder that you stored the .csv files in.
# Be default this R file is included in a ZIP file with the .csv files.
# Alternatively you could use setwd() to set the working directory to that folder.
#


pathToFolder = "/Users/yrose/Dropbox (Personal)/website/src/yrData/relational/books/booksDatabase-v017/booksDB-quarto-v017/booksFiles/csv"


# Example
# pathToFolder = "/Users/yrose/Dropbox (Personal)/website/yu/ids2460-dataMgmtForAnal/79spr22-ids2460-dataManagement/sqlNotes/booksDatabase-v003"   
#
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


# NOTE: This code in this file depends on the readr package.
#       The following line will install the readr package if it is not already
#       installed on your computer.

if (!require(readr)) {install.packages("readr"); require(readr)}



# Get a vector that contains all the .csv filenames in the folder
theCsvFiles = list.files(path=pathToFolder, pattern="\\.csv$", ignore.case=TRUE)



# Function to create global dataframe variables
# with the csv data from each file in the specified directory
readCsvFiles = function(dir = '' , files) {
  
  # Change backslashes into forward slashes in dir
  # This makes the code the same for both mac and windows.
  dir = gsub("\\\\", "/", dir)
  
  # Ensure that dir has exactly one trailing slash
  dir = sub("/$", "", dir)  # remove trailing "/" from dir if it exists
  dir = paste0(dir, "/")   # add a trailing slash 

  # read in all the files  
  for (filename in files) {
    pathToFile = paste0(dir, filename)
    
    # NOTE - we are using read_csv from the readr package instead of the 
    #        read.csv function from the base R functions.
    #
    #        read_csv has an advantage over read.csv in that read_csv tries
    #        to automatically guess the data type for each column. By contrast
    #        read.csv will assume that all columns are character unless you 
    #        explicitly specify the colClasses argument. 
    #        Using read_csv instead of read.csv allows us to use this script
    #        to read in many different .csv files wihtout needing to know 
    #        in advance what the datatypes are for the individual columns in 
    #        each .csv file.
    #
    #        read_csv returns a "tibble". 
    #        we convert the tibble to a data.frame for the benefit of people
    #        who are more familiar with data.frames than with tibbles.
    #       
    #        If you are curious about tibbles you can see this webpage (or just
    #        search online for another explanation):
    #        http://statseducation.com/Introduction-to-R/modules/getting%20data/tibbles/
    
    tb = readr::read_csv( pathToFile, na="NULL", show_col_types=TRUE )   
    df = as.data.frame(tb)
    
    # readr::read_csv gives columns that only contain integers 
    # a class of double, i.e. numeric, instead of a class of integer.
    #
    # This causes issues with the division ( / ) sqlite operator when
    # using sqldf on the dataframe (since / will be treated as integer division when
    # both operands of the / are integers and as real division when either
    # operand is a non-integer)
    # Therefore we will attempt to "fix" those columns that contain 
    # whole numbers by converting them to a integer class.

    for (colnum in 1:ncol(df)){
      col = df[[colnum]]
      if( class(df[[colnum]]) == "numeric" && 
          all(
            (df[[colnum]] - trunc(df[[colnum]])) == 0,
            na.rm = TRUE
          )
      )
      {
        df[[colnum]] = as.integer(df[[colnum]])
      }
    }
    
    variableName = gsub("\\.csv", "", filename)
    cat("created dataframe: ", variableName, "\n")
    assign( variableName , df , globalenv())
  }
}

# run the function on the specified folder
readCsvFiles(
  dir = pathToFolder,
  files = theCsvFiles
)

