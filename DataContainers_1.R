# Atomic Vector / Four main types
# Atomic vector is the lowest-level data type in R (no scalar type). There are 4 commonly used atomic vector types in R
# double - the default type R use to store (real) numeric values. 10, 3.6, 2.67e5
# integer - whole numbers. 10L, 2.67e5L, from:to
# character - texts "abc", "column_a"
# logical - TRUE, FALSE
d <- 2.9
i <- 4L
s <- "abc"
b <- TRUE
typeof(d) # the answer is double
typeof(i) # the answer is integer
typeof(s) # the answer is character
typeof(b) # the answer is logical

x <- 10
x <- 2.9
x <- 7.82e5
x <- 0xb # 0x - hexadecimal
typeof(x) # the answer is double

s <- "\"abc"
s <- '"abc'
s <- "'abc"
print(s) # the answer is "abc"

x <- 5L
x <- 3.9e3L
x <- 1:3
typeof(x) # the answer is integer
typeof(length(x)) # the answer is integer
.Machine$integer.max # 2^31

a <- 1.0
is.vector(a) # the answer is TRUE
length(a) # the answer is 1


# Atomic Vector / c(), length()
# The c function
p <- c(1, 2, 3)
q <- c(p, 4, 5, 6) #The code first creates p as a vector c(1,2,3), then q as c(p,4,5,6) → c(1,2,3,4,5,6)
m <- c(p, 10, 10, q)
n <- c(c(11, 12, 13), 10, p)
v <- c(1:3, 1:3)
p <- c(1) # Next, p is reassigned to c(1) (a length‑1 vector)
q <- 1 # Finally, q is reassigned to the scalar 1. Both p and q now hold the same numeric value 1 (as a length‑1 vector)
identical(p, q) # so identical(p, q) returns TRUE

v <- 1            #The code starts with v <- 1 (a vector of length 1)
for (ii in 1:100) {#The for loop then iterates ii from 1 to 100. In each iteration, it appends the current ii to v using v <- c(v, ii)
  v <- c(v, ii)   # After the first iteration (ii = 1), v becomes c(1, 1) (length 2)
}                 #After the second (ii = 2), v becomes c(1, 1, 2) (length 3)
length(v)  # This continues until ii = 100, at which point v has 1 + 100 = 101 elements.

# The length function
p <- c(1, 2, 3)
q <- c(c(11, 12, 13), 10, p)
length(q)                    # the answer is 7
print(q)                    # the answer is 11 12 13 10  1  2  3
length(q) <- length(q) - 3
print(q)                    # the answer is 11 12 13 10

# Atomic Vector / : and [ ]
vec <- 1:3
vec <- 3:1
vec <- -2:5
vec <- -(2:5)
vec <- 5:-2
vec # the answer is  5  4  3  2  1  0 -1 -2
vec <- 11:15
vec
print(vec[2])
print(vec[2:3])
print(vec[c(1, 4)])
print(vec[c(1, 4, 2:3)])
print(vec[c(TRUE, FALSE, FALSE, TRUE, FALSE)])
vec[3] <- 3
print(vec)

# Character (String) type and functions
#Character type atomic vectors
vec <- c("1", "2ab", "cd", "ef gh")
vec[3]
length(vec)

#Concatenation
paste("ab", "bc", "cd") #The function paste() combines strings with a default space separator.  (space between each)
paste("ab", "bc", "cd", sep = "-")  #"ab-bc-cd" (separator changed to hyphen)
paste0("ab", "bc", "cd")  #"abbccd" (no separator; shorthand for paste(..., sep = "")).
paste(c("ab", "bc"), "cd", sep = "-") # combines each element of the first vector ("ab" and "bc") with the single string "cd", using a hyphen as separator. The result is a vector of two strings:
#  "ab-cd" and "bc-cd".

# Cases
tolower("ApPle") #[1] "apple"
toupper("ApPle") #[1] "APPLE"
nchar(c("apple", "banana")) # the answer is [1] 5 6 

#Other relevant functions
substr("abcdefg", start = 2, stop = 4) #extracts the substring from character positions 2 to 4 (inclusive)
grep("cd", c("iii", "abcde", "ooocd"), fixed = TRUE) # grep() returns the indices of elements that contain the pattern:c(2, 3) (since "abcde" and "ooocd" contain "cd")
grepl("cd", c("iii", "abcde", "ooocd"), fixed = TRUE) # grepl() returns a logical vector of the same length. fixed = TRUE treats "cd" as a literal string, not a regular expression

sub("a", "d", "arrange") #replaces only the first occurrence of "a" with "d", resulting in "drrange".
gsub("a", "d", "arrange") # replaces all occurrences of "a" with "d", resulting in "drrdnge"

#Atomic Vector / Type test and coercion
#Type test
logical, integer, double, character
as.character(54L)
as.logical(6.5)
as.logical(-6.5)
as.logical(0)
as.integer("100.10")
as.integer(100.1)
as.character(NaN)
as.double("481.9")
as.double("abc")

# Implicit coercion
v <- c(TRUE, 100L)
typeof(v)
v <- c(100, 100L)
typeof(v)
v <- c(TRUE, "abc")
typeof(v)
sum(c(TRUE, FALSE, TRUE))


# Explicit coercion
as.character(54L)
as.logical(6.5)
as.logical(-6.5)
as.logical(0)
as.integer("100.10")
as.integer(100.1)
as.character(NaN)
as.double("481.9")
as.double("abc")

#Loop over vectors of unknown size
# Assuming v0, v1, v2, v3 are the vectors
# you want to iterate over
v3 <- c(-11.1, -22.2, -33.3)
v2 <- c(-11.1, -22.2)
v1 <- c(-11.1)
v0 <- c()

# Three versions of looping over the vector
#The name vv is arbitrary and likely short for "vector" (repeating the letter for distinction

print_all_seq_along <- function(vv) { # vv is the formal parameter name (argument) of the function. When you call the function, whatever vector you pass in (e.g., v3, v2, etc.) gets assigned to vv inside the function body
  for (ii in seq_along(vv)) {         #seq_along(vv) creates an index sequence of the same length as the input vector
    print(vv[ii])                     #vv[ii] accesses each element
  }
}

#Generate sequences of dates
# know the start date and the length of the sequence
d <- as.Date("2020-02-25", format = "%Y-%m-%d")
d + 1:5
typeof(d)
attributes(d)

# Reference: the-book-of-r
# FUNCTIONS
#A function definition always follows this standard format:

# functionname <- function(arg1,arg2,arg3,...){
#  do any code in here when called....It can include if statements, loops,and even other function calls. 
#  return(returnobject)
# }
myfib <- function(){
  fib.a <- 1
  fib.b <- 1
  cat(fib.a,", ",fib.b,", ",sep="") #Prints the first two terms (1, 1,) to the console.sep="" removes spaces between items, so output looks like 1, 1,.
  repeat{
    temp <- fib.a+fib.b       #Calculates the next Fibonacci number by summing the previous two (fib.a and fib.b), storing it in temp
    fib.a <- fib.b            #Updates fib.a to the value of fib.b (shifts forward in the sequence)
    fib.b <- temp             #Updates fib.b to the new Fibonacci number.
    cat(fib.b,", ",sep="") #cat(fib.a,", ",fib.b,", ",sep=""), to ensure the first two terms, 1 and 1, are also printed to the screen
    if(fib.b>150){
      cat("BREAK NOW...")
      break
    }
  }
}
myfib()

#Generate sequences of random numbers / uniform distribution
runif(1) #produces a single random number between 0 and 1.
runif(100) #produces 100 such random numbers
mean(runif(10000)) #generates 10,000 uniform random numbers and calculates their average (expected value ≈ 0.5)
sum(runif(10000)) #generates 10,000 uniform random numbers and returns their total (expected sum ≈ 5000).

vec <- floor(runif(10000, min = 0, max = 10))
tb <- table(vec)
tb
typeof(tb)
attributes(tb)
plot(table(floor(runif(1000, min = 0, max = 10))))

rnorm(1, mean = 10, sd = 4)
mean(rnorm(10000, mean = 10, sd = 4))
sd(rnorm(10000, mean = 10, sd = 4))
plot(table(floor(rnorm(1000, mean = 10, sd = 4))))

# Basic descriptive (statistics) functions
mean(1:10)
mean(c(1:10, NA, NaN))
mean(c(1:10, NA, NaN), na.rm = TRUE)

sd(1:10)
var(1:10)
median(1:10)
median(c(1, 2, 2, 10))
quantile(1:100, probs = c(0.05, 0.95))
quantile(1:100, probs = c(0, 1))
range(1:100)

v <- c(1, 3, 8, 2, NA, NaN) #Creates a numeric vector v with values 1, 3, 8, 2, a missing value NA, and NaN (Not a Number, e.g., result of 0/0).
min(v) # Returns NA because NA propagates in R – any operation involving NA (or NaN) generally returns NA
min(v, na.rm = TRUE) #Removes NA and NaN before calculation. The minimum of the remaining numbers (1, 3, 8, 2) is 1.
max(v) # Also returns NA due to the presence of NA/NaN

max(v, na.rm = TRUE) # After removing NA and NaN, the maximum of (1, 3, 8, 2) is 8
max(c(v, Inf), na.rm = TRUE) # First appends positive infinity (Inf) to the vector. Then removes NA/NaN. Since Inf is larger than any finite number, the result is Inf.

which.min(v)
which.max(v)
sum(1:100)
diff(c(1, 3, 5, 2, 10)) #Computes successive differences: 3-1=2, 5-3=2, 2-5=-3, 10-2=8 → returns c(2, 2, -3, 8)
diff(c(1, 3, 5, 2, 10), lag = 3) #Computes differences with a lag of 3
# cumulatives
cumsum(c(1, 3, 5, 2, 10)) # Cumulative sum: 1, 1+3=4, 4+5=9, 9+2=11, 11+10=21 → c(1, 4, 9, 11, 21)
cumprod(c(1, 3, 5, 2, 10))
cummax(c(1, 3, 5, 2, 10))
cummin(c(1, 3, 5, 2, 10))
cummin(c(10, 3, 5, 2,))

sample(1:10, size = 3) #Randomly selects 3 distinct numbers from 1 to 10 (without replacement).
sample(1:10, size = 10) #Randomly permutes all numbers 1 to 10 (a random shuffle, without replacement)
sample(1:10, size = 11) #?
sample(1:10, size = 20, replace = TRUE)
sp <- sample(c("a", "b", "c"), size = 100, prob = c(10, 10, 20), replace = TRUE)
table(sp)
set.seed(1)
v <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
sample(v, size = 5)
S07/sample_lhs.R
?sample.int()

# curiosity with sample command:Create a population of 200 with age and income
#set.seed(123)  # for reproducibility
population <- data.frame(
  age = sample(18:90, size = 200, replace = TRUE),
  income = sample(20000:120000, size = 200, replace = TRUE)
)

# Now purposeful sampling: age > 60 AND income > 50000
purposeful_sample <- population[population$age > 60 & population$income > 50000, ]

# Check result
head(purposeful_sample)
nrow(purposeful_sample)
install.packages("lhs")
install.packages("ggplot2")
library(lhs)
library(ggplot2)
B <- lhs::randomLHS(1000, 2) # 1000 samples of 2 parameters. Generates a 1000×2 matrix of Latin Hypercube samples – each column has values uniformly distributed between 0 and 1, stratified to cover the range evenly
B[, 1] <- qnorm(B[, 1], mean = 7, sd = 1) # X1 is normally distributed. Transforms the first column (original uniform [0,1]) into a normal distribution with mean 7 and standard deviation 1 using the quantile function (qnorm). The second column remains uniform on [0,1].
ggplot(data = data.frame(B)) +
  geom_point(mapping = aes(x = X1, y = X2)) +
  geom_density(mapping = aes(x = X1), color = "#00A087FF", size = 2) +
  scale_x_continuous(limits = c(2, 12), breaks = seq(2, 12, by = 1)) + #Sets x‑axis range from 2 to 12 with tick marks every 1 unit
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.2)) # Sets y‑axis range from 0 to 1 with tick marks every 0.2 units

#Add attributes to vectors / names
# Data by itself doesn’t tell the full story. The description of data (meta data) gives meaning to the data, it transforms data to information
d <- c(21, 9770, 38)
attr(d, "region") <- "england"
attr(d, "description") <- "cases between week 40 2021 and week 14 2022"
attributes(d)
attr(d, "names") <- c("influenza", "SARS-CoV-2", "other")
names(d) <- c("influenza", "SARS-CoV-2", "other")
d["influenza"]
attr(d, "description")
attributes(d)
str(d)

#Add attributes to vectors / dim
d <- c(1, 2, 3, 4, 5, 6) #Creates a numeric vector d containing the numbers 1 through 6.
attr(d, "dim") <- c(2, 3) # Assigns a dim attribute with value c(2, 3), turning the vector into a 2‑row, 3‑column matrix
attr(d, "dim") <- c(3, 2) # Overwrites the dim attribute with c(3, 2), reshaping the same underlying data into a 3‑row, 2‑column matrix (again column‑wise).
d
d <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
d
d <- c(1, 2, 3, 4, 5, 6)
dim(d) <- c(2, 3)
d
d <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3, byrow = TRUE)
d

#Matrix operations
d <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
t(d)
diag(d) #Returns the main diagonal elements as a vector. For a non‑square matrix, it takes the first
        #d[1,1] = 1 and d[2,2] = 4 → result: c(1, 4).
d * d
d %*% t(d)  #The code d %*% t(d) performs matrix multiplication of d with its transpose.
outer(1:10, 1:4) #Both outer(1:10, 1:4) and 1:10 %o% 1:4 compute the outer product of the vectors 1:10 and 1:4
1:10 %o% 1:4

#The outer product returns a 10×4 matrix where the element at row i, column j is the product of the i-th element of the first vector and the j-th element of the second vector:
#result[i, j] = (1:10)[i] * (1:4)[j].
#For example, the first row is 1 * (1,2,3,4) = (1,2,3,4), the second row is 2 * (1,2,3,4) = (2,4,6,8), etc.

nrow(d)
ncol(d)
rownames(d) <- c("a", "b")
colnames(d) <- c("c1", "c2", "c2")
d
d1 <- rbind(d, c(11, 12, 13))
d2 <- cbind(d, c(21, 22))
d2
rownames(d1) # Retrieves or prints the row names of the matrix or data frame d1. If no row names are set eturns NULL
colnames(d2) # Retrieves or prints the column names of the matrix or data frame d2.
is.matrix(d) # Checks whether object d is a matrix. Returns TRUE if d has a dim attribute of length 2, otherwise FALSE.
d3 <- c(1, 2, 3) #Creates a numeric vector d3 of length 3 containing the values 1, 2, 3.
attr(d3, "dim") <- c(3) # Assigns a dim attribute with a single value 3. However, a dimension vector must have length 2 for a matrix or length >1 for an array
is.matrix(d3) # Returns FALSE because a matrix requires exactly two dimensions (a dim attribute of length 2)
attr(d3, "dim") <- c(1, 3) #Assigns a proper two‑element dimension: 1 row and 3 columns. This reshapes d3 into a 1×3 matrix (a row vector).
is.matrix(d3) # Returns TRUE because d3 now has a dim attribute of length 2, making it a genuine matrix

#Add attributes to vectors / factor (class + levels)
char_vec <- c("apple", "banana", "coconut", "apple", "apple", "banana")
f <- factor(char_vec) #converts the character vector char_vec into a factor — R’s data type for categorical variables.
f
attributes(char_vec)
attributes(f)
str(f) #1 2 3 1 1 2 – integer codes representing each element: 1=apple, 2=banana, 3=coconut
typeof(f)
attributes(f)
levels(f)
class(f)
t <- table(char_vec)
attributes(t)
t["apple"]
f2 <- c(1L, 2L, 3L, 1L, 1L, 2L)
attr(f2, "levels") <- c("apple", "banana", "coconut")
attr(f2, "class") <- "factor"
identical(f, f2)
