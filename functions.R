IsEven <- function(x) {
  if (x %% 2 == 0) {
    print("x is an even number")
  } else {
    print("x is NOT an even number")
  }
}
IsEven(7)

# This code defines a function IsEven that checks whether a number is even:
IsEven <- function(x) {# creates a function named IsEven with one parameter x
  res <- FALSE         # Inside, it initialises res <- FALSE
  if (x %% 2 == 0) { #remainder when dividing by 2 is zero), it sets res <- TRUE
    res <- TRUE   
  }
  return(res) # outputs TRUE for even numbers, FALSE for odd numbers
}a<- IsEven(7) # a <- IsEven(x = 7) → 7 is odd, so a becomes FALSE
IsEven(8) # → 8 is even → returns TRUE (printed to console)
IsEven(IsEven(x = 8))# → inner call: IsEven(8) returns TRUE. Then outer call: IsEven(TRUE). R coerces TRUE to 1, and 1 %% 2 == 0 is FALSE, so returns FALSE.
IsEven(IsEven(IsEven(x = 8))) #→ innermost: IsEven(8)# → TRUE; next: IsEven(TRUE) → FALSE; outermost: IsEven(FALSE) → FALSE (since FALSE is coerced to 0, and 0 %% 2 == 0 is TRUE?
as.numeric(TRUE)# → converts TRUE to 1, prints 1

# Task: Write a function named `FeetToMeters` that takes a numerical
# value ft that represents a length measurement in feet as input and
# returns the same measurement in meters. (Given that 1 foot = 0.3048 metres)

FeetToMeters <- function(ft) {
  mt <- ft * 0.3048
  return(mt)
}
FeetToMeters(10)
FeetToMeters(20)

# Task: Write a function named `NextMulti` that takes an integer x, and
# an integer d as input and returns the next integer that’s greater or
# equal to x that’s divisible by d

NextMulti <- function(x, d) {
  res <- x # starts a counter at x
  while (res %% d != 0) { # checks if res is not divisible by d
    res <- res + 1 #increments by 1 and repeats
  }
  return(res)# When res becomes divisible, the loop stops and return(res) gives the answer.
}
NextMulti(15, 7)
NextMulti(12, 7)

#Each call of a function creates an instance of that function, and that instance
#has its own environment which is separate from the Global Environment.
#This environment is short-lived (discarded after that call has returned)*
#Variables created inside this environment is not accessible in the Global
#Environment, therefore the need for the return statement.

IsEven <- function(x) {
  res <- FALSE
  if (x %% 2 == 0) {
    res <- TRUE
  }
  return(res)
}
IsEven(20)
IsEven(15)

# A function can access the global environment if a variable can not be found in its own environment.
rm(list = ls())
FuncA <- function(x) {
  a <- x + 1
  return(a)
}
FuncA(2)
print(a)
ls()

# Task: What are the output from the last line of the following scripts?
rm(list = ls())
m <- 10
FuncA <- function(x) {
  n <- x + m
  return(n)
}
FuncA(5)

# Task: What are the output from the last line of the following scrip
rm(list = ls())
i <- 12
x <- 4
FuncA <- function(
    x = 10,
    y = 20
) {
  x <- x * y
  return(x + i)
}
FuncA(20)
