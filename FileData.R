# NA and NULL
# When do we get NA and NULL?
# NA
c(1, 2, 3)[4] # Attempts to extract the 4th element from a vector of length 3.Result: NA
a <- c(1, 2, 3) # Creates a numeric vector (1, 2, 3) and assigns it to variable a
length(a) <- 100 # Replaces the length of a with 100. The original 3 elements remain at positions 1–3. Positions 4 through 100 are filled with NA.
print(a) # 1 2 3 NA NA NA ... (total 100 elements, with 97 NAs after the first three)

# NULL
x <- 1:6 # Creates an integer vector x containing the numbers 1, 2, 3, 4, 5, 6.
dim(x) # Returns the dimensions of x. Since x is a vector (not a matrix or array), it has no dim attribute, so dim(x) returns NULL.
f <- function(){} # Defines a function named f that takes no arguments and does nothing (empty body). The function returns NULL by default when called.
a <- f() # Calls the function f() (which does nothing and returns NULL), and assigns that NULL value to the variable a. So a becomes NULL
a

# How to remove the names inside the vector
x <- c("a" = 1, "b" = 2, "c" = 3) # remove the names attribute of x
names(x) <- NULL
x

v1 <- c(1, 2, 3) # v2 <- NULL # same as v2 <- c()
for (ii in 1:10) {
  v2 <- c(v2, v1)
}

#  NA as part of the calculation
is.na(NA) # is.na(NA) checks whether the input is missing (NA). Since it is, the result is TRUE.
any(is.na(c(1:10, NA))) # c(1:10, NA) creates a vector with numbers 1–10 and one NA. is.na() returns FALSE for the numbers and TRUE for the NA. any() then checks if any element is TRUE, so the result is TRUE

NA * 11
sum(c(NA, 1, 2, 3))
NA && TRUE
NA || FALSE
NA > 1
NA == NA
NA != NA
NaN == NaN
NA == NaN

# The current working directory and what’s in it
getwd() # "/..../intro-r-lecturers"
dir()

# Relative path
file.path("FileData")
file.path(".", "FileData")
file.path(getwd(), "FileData")

a <- 10
b <- 20
ls() # The ls() function in R lists all objects (variables, functions, data frames, etc.) in the current working environment.
rm("b")  # Removes object named "b" (case‑sensitive)
rm(a) # Removes object 'a'
a <- 10
b <- 20
rm(list = ls())  # Removes ALL objects in the environment. # ls() returns "a" "b", so rm(list = c("a","b")) is executed

# Global Environment / source from another file
# Specify a directory/file (using func_IsEven.R variable_defs.R)

source(file = file.path(
  "C:/Users/ROBERT/Desktop/Kasawaya",
  "FileData",
  "func_IsEven.R"
))
source(file = file.path(
  "C:/Users/ROBERT/Desktop/Kasawaya",
  "FileData",
  "variable_defs.R"
))
ls()

# Task: Given the above directory structure. Without changing the current working directory (indicated by ) , use the source function to:
# 1. Bring a function defined in “func_NextMulti.R” to the current global environment.
# Create the file with a simple function
writeLines(
  "NextMulti <- function(x, multiple = 2) { ceiling(x / multiple) * multiple }",
  "C:/Users/ROBERT/Desktop/Kasawaya/FileData/func_NextMulti.R"
)

# Now source it (bring it into global environment)
source("C:/Users/ROBERT/Desktop/Kasawaya/FileData/func_NextMulti.R")

# Global Environment / save and load to “.RData” file
# Save individual variables
a <- 10
save(a, file = "a.RData")

# Save everything in the Global Environment
save.image(file = "img.RData")
rm(list = ls())
load("img.RData")


# Reshape / Wide vs Long format
data(morley)
morley
morley_wide <- reshape(
  morley,
  idvar = c("Expt"),    # Identifies the "experiment number" as the row identifier in the wide output.
  timevar = "Run",      # The variable (run number from 1 to 20) that will become suffixes in the new column names.
  v.names = "Speed",    # The measurement variable (speed values) that will be spread across the new columns
  direction = "wide",   # Specifies conversion from long to wide format
  sep = "_"             # Separator between the original variable name (Speed) and the run number
)
morley_wide

morley_long <- reshape(
  morley_wide,
  idvar = "Expt",
  direction = "long",
  sep = "_",          # tells R that column names like Speed_1 have time after "_"
  timevar = "Run",    # name for the new time column
  v.names = "Speed"   # name for the value column
)
morley_long

# changing data structure (wide/long). You can use reshape, spread and pivot
morley_wide <- tidyr::spread(
  morley,
  key = Run,
  value = Speed
)
morley_wide

morley_wide <- tidyr::pivot_wider(
  morley,
  names_from = Run,
  values_from = Speed
)
morley_wide
# code works same
morley_wide <- pivot_wider(
  morley,
  names_from = Run,
  values_from = Speed
)
morley_wide

# Pivoting longer
morley_long <- tidyr::gather(
  morley_wide,
  key = Run,
  value = Speed,
  names(morley_wide)[-1]
)
morley_long

morley_long <- tidyr::pivot_longer(
  morley_wide,
  names_to = "Run",
  values_to = "Speed",
  -Expt
)

# Aggregate
dtf <- data.frame(
  p1 = rep(1:2, 4:5), # p1: integers: four 1s followed by five 2s.
  p2 = rep(letters[2:3], 5:4), # p2: characters: five "b"s followed by four "c"s. 
  v1 = rnorm(9, mean = 10), # v1: nine random numbers from a normal distribution with mean 10
  v2 = rnorm(9, mean = 20) # v2: nine random numbers from a normal distribution with mean 20.
)
dtf

aggregate(       # The aggregate() call computes the mean of v1 for each unique combination of p1 and p2 in dtf
  dtf$v1,        # splits the first argument (dtf$v1) into subsets, where each subset corresponds to a unique combination of values from p1 and p2.
  by = list(p1 = dtf$p1, p2 = dtf$p2), # argument tells aggregate() how to split the data into groups:
  FUN = mean     # argument tells aggregate() which function to apply to each group of dtf$v1 after the data is split by p1 and p2. FUN = mean produces the group‑wise average of v1
)

dtf <- data.frame(
  p1 = rep(1:2, 4:5),
  p2 = rep(letters[2:3], 5:4),
  v1 = rnorm(9, mean = 10),
  v2 = rnorm(9, mean = 20)
)
dtf2 <- dplyr::group_by(dtf, p1, p2)
dplyr::summarise(dtf2, v1.avg = mean(v1), v2.max = max(v2))

# Multiple Dataset Merge
# example with data frame
df <- data.frame(
  name = c(
    "robert", "catelyn", "theon", "cersei", "sansa",
    "ned", "jaime", "sandor", "arya", "tyrion"
  ),
  gender = c(
    "m", "f", "u", "f", "f",
    "m", "m", "", "f", "m"
  )
)

df1 <- data.frame(
  birth_house = c(
    "baratheon", "stark", "stark", "stark", "stark",
    "lannister", "lannister", "lannister", "greyjoy", "clegane"
  ),
  name = c(
    "robert", "catelyn", "sansa", "ned", "arya",
    "cersei", "jaime", "tyrion", "theon", "sandor"
  )
)
df2 <- merge(df, df1, by = "name")
df2

# Sort() and order()
v <- c(NA, 10, 8, 4, 4, NaN, NULL, 7, 13)
sort(v)
sort(v, decreasing = TRUE)

v <- c(NA, 10, 8, 4, 4, NaN, NULL, 7, 13)
order(v)
v[order(v)]
v[order(v, decreasing = TRUE)]

df <- data.frame(
  name = letters[1:8],
  age = c(25, 25, 25, 20, 20, 15, 47, 33),
  score = c(97, 100, 90, 100, 95, 100, 90, 90)
)
df
df[order(df[["age"]]),] # sorts the rows by age in ascending order (youngest to oldest)
df[order(df[["age"]], -df[["score"]]), ] #  sorts first by age ascending, then for equal ages, by score in descending order (because the minus sign reverses the order of score)

# Search / unique, duplicated
unique(c(NA, 1, 1, 10, NULL, NaN, NaN))
x <- c(4, 1:5, 3:6)
duplicated(x)
duplicated(x, fromLast = TRUE)
duplicated(c(NA, 1, NA, NaN, NaN, NULL, NULL))
# multiple columns ----
df <- data.frame(c(1, 2, 1, 4, 2, 2), c(2, 3, 2, 6, 2, 3)) # The code creates a two-column data frame (columns are unnamed).df contains rows: (1,2), (2,3), (1,2), (4,6), (2,2), (2,3)
df
duplicated(df[, 1:2]) # checks for duplicate rows from the start, returning FALSE, FALSE, TRUE, FALSE, FALSE, TRUE because the third row duplicates the first, and the sixth duplicates the second.
dp <- duplicated(df[, 1:2]) #  stores that logical vector for later use.
df[!dp, ] # remove duplicated rows from data frame
df[dp, ] # show duplicated rows
anyDuplicated(df[, 1:2])

# Search / match, %in%
match(c(1, NA, 10, NaN), c(1:4, NA, NaN)) # Returns the positions of the first vector's elements in the second vector.
match("c", letters[1:10]) # Finds "c" in letters[1:10] ("a" to "j"). "c" is the 3rd element → returns 3
is.element("c", letters[1:10]) # Checks membership of "c" in the set → returns TRUE
3 %in% 1:10 # Checks if 3 is in the integer sequence 1:10 → returns TRUE
9:11 %in% 1:10 # Tests each element of c(9,10,11) for membership in 1:10 → returns c(TRUE, TRUE, FALSE)



































