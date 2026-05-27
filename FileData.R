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








