# Data wrangling
# 
# Data wrangling session, Dar Ecr Program
#
# By  : walinase
# Date ; 20/06026
################################################################################
morley

# The following are the data exploration functions:
head(morley) # gives the first six rows of the dataset
tail(morley) # gives the last six rows of the dataset
str (morley) # displays the structure of the dataset
summary(morley) # provides the summary statistics of the dataset
view(morley) # opens data in a new spreadsheet
class (morley)

################################################################################
# na.omit () function
# We can easily remove any rows with NA in our dataset using the na.omit function
morley
morley <- na.omit(morley)  # removes rows with NA without printing the dataset
morley
attributes(morley)
# or use the drop_na ()
drop_na (morley)       # which ever command you prefer
anyNA(morley)  # check for missing values before deciding:Returns FALSE for morley because there are no NA or missing values in the rows.

# Calculate the mean of Speed, ignoring any NAs in the calculation
mean(morley$Speed, na.rm = TRUE)

df <- read_xlsx("C:/Users/ROBERT/Desktop/Kasawaya/data_wrangling/datasets/BankWages.xlsx")
df

# repeating the previous functions for the dataset
head(df)
tail(df)
str (df)
summary(df)
anyNA(df)
view(df)
str(df)
class(df)

# Core dplyr functions are: dplyr means "data plier" used to fine tune data
# select() # Take only specified columns from the data frame
# mutate() # Create new columns, often taking information from other columns
# rename() # Rename existing columns to new names
# clean_names() # cleans and standardizes column names for consistency
# filter() # Take only the rows that meet the desired criteria

# select() function
# First argument: data
# Followed by logical tests for column names to be kept or removed
select(df, job)
select(df, job ,gender, education)
# Note, if you put a minus sign infront of the name of the column, it means dont select this column
select(df, job ,gender, -education,-minority )
# The code below will only select a column that contains the contents in the brackets in its name
select(df, contains("education"))
select(df, contains("educ")) # works the same 

# We can also use starts_with() or ends_with()
select(df, starts_with("min"))
select(df, ends_with("ob"))

# GOOD PRACTICE 1
# Often, different functions from different packages can have the same name. If you end up using multiple packages
# , some function can overwrite another.
# To make sure this does not happen, you can specify the library you are calling from, for example:
dplyr:: select()
# will use the select() function from the dplyr package.
dplyr:: select(df, job, gender, education)

# Cleaning column names
# inspection of column names is done with names()
# Then, pipe the cleaned column names to rename() for manual edits.
# Format is: df <- rename(df, new_name = old_name)
names(df)
# use the rename function to rename the columns
df <- rename(df, 
             "work" = "job", 
             "schooling" = "education", 
             "sex" = "gender"
             )
names(df)






























































































































