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


