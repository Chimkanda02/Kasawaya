# ARITHMETIC OPERATORS
rm(list = ls())  # Removes all objects (variables, functions, etc.) from the current R environment, effectively starting with a clean slate
p <- 0.1 # Creates a variable p and assigns it the value 0.1
q <- 0.2 # Creates a variable q and assigns it the value 0.2.
p <- 0.4 + q # Computes 0.4 + q (where q is 0.2), resulting in 0.6. This value is then assigned to p, overwriting its previous value (0.1). Now p = 0.6.
v <- 0.3  # Creates a variable v and assigns it the value 0.3
v <- p + q # Computes p + q (with current values p = 0.6 and q = 0.2), giving 0.8. This value is assigned to v, replacing the previous 0.3. Now v = 0.8.
v
rm(list = ls())
q <- 0.2
p <- 0.4 + q
p <- 0.1
v <- 0.3
v <- p + q
v
1 + 2
25 - 17
3 * 2.3
13 / 7
10 + 20 * 2
(10 + 20) * 2
2 ^ 3
2 ** 3 # shortcut for square root
25 / 10
25 %% 10 # modulo operator (%%) returns the remainder after dividing the left-hand side by the right-hand side.
3
13 / 7
10 + 20 * 2
(10 + 20) * 2
2 ^ 3
2 ** 3
25 / 10
25 %% 10
25 %/% 10
# ?”Arithmetic”
# Task: Type and execute each command and
# see if the output matches your expectation.
x <- 10
y <- 7
z1 <- x - y
z2 <- x * y + 5
z3 <- x * (y + 5)
z4 <- x ** 2 + y
z1
z2
z3
z4
1++
10
5 + 5 +  
1  
1++
1++  
  10  
0.5 + 5
.5 + 5
4^.5
9 ** 1 / 3 # means 9 raised to the power of 1, which equals 9
# Then, 9 / 3 equals 3. 
# If the intention was to compute the cube root of 9, you would need parentheses such as 9 ** (1/3)
-1^6
(-1)^6
1 %% 0.3 # Mathematically: 1÷0.3=3 with a remainder of 1-(3*0.3)= 1-0.9 = 0.1

# RELATIONAL OPERATORS
6 > 5
6 < 5
0.1 + 0.2 == 0.3 #The answer is FALSE. Due to floating-point precision, 0.1 + 0.2 results in 0.30000000000000004, not exactly 0.3
6 >= 5
6 <= 5
5 <= 5 # The expression 5 <= 5 evaluates to TRUE because 5 is less than or equal to 5 (they are equal)
6 == 5 # FALSE
6 != 5 # The expression 6 != 5 checks whether 6 is not equal to 5. Since 6 and 5 are different, the result is TRUE
# Task: What’s the value of a?
# Code
m <- 10
p <- m * 0.125 # Computes 10 * 0.125 = 1.25 and stores it in p
q <- m / 4 / 2 # Division is left‑associative, so(10 / 4) / 2 = 2.5 / 2 = 1.25. Stores 1.25 in q
a <- p != q # Checks if p is not equal to q. Since both are 1.25, they are equal, so p != q is FALSE
# a = FALSE
m <- 1
e <- exp(m) # Computes the exponential of m (i.e., e^1 ≈ 2.71828) and stores it in e
a <- e < m  # Checks if e is less than m (2.71828 < 1). This is FALSE, so a receives FALSE
a
# LOGICAL OPERATORS
#NEGATION
!TRUE # The result is FALSE
!FALSE
TRUE & TRUE
FALSE & TRUE
TRUE | TRUE
c(TRUE, FALSE) & c(TRUE, TRUE)
c(TRUE, FALSE) && c(TRUE, TRUE)
TRUE | TRUE 
FALSE | TRUE
FALSE | FALSE
TRUE | FALSE
TRUE || TRUE
FALSE || TRUE
FALSE || FALSE
xor(TRUE, TRUE)
xor(TRUE, FALSE)
xor(TRUE, TRUE)
xor(FALSE, FALSE)
10 + 1 > 10
234 * 76 > 938 * 43
8 > 7 && 9 > 8
6 < 8 && 7 > 8
6 > 8 || 7 > 8
a <- 10 < 4 + 8
a
a <- 5 + 10 < 12
a
m <- 100
n <- m - 10 < 100
p <- m > 10 + 100
a <- n && p
m <- 4 + 7 * 2
n <- m < 20
p <- m * 10 >= 200
a <- !n || p
x <- 11
if (x %% 2 == 0) {
  print("x is an even number")
} else {
  print("x is NOT an even number")
}
# If-else blocks can be nested within other if-else blocks
x <- 11
if (x %% 2 == 0) {
  print("x is an even number")
} else if (x %% 3 == 0) {
  print("x is divisible by 3")
} else if (x %% 5 == 0) {
  print("x is divisible by 5")
} else {
  print("not divisible by 2, 3, 5")
}
# If-else blocks can be nested within other if-else blocks
x <- 12
if (x %% 2 == 0) {
  if (x %% 3 == 0) {
    print("x is divisible by 6")
  } else {
    print("x is not divisible by 3")
  }
  print("x is an even number")
} else {
  print("x is an odd number")
  if (x %% 3 == 0) {
    print("x is divisible by 3")
  } else {
    print("x is not divisible by 3")
  }
}

# Task: In the UK, you can start driving a car when you're 17. Give the value held in age is the age of the individual,
# write a script that prints “may drive” or “may NOT drive” depending on age.
# age <- 30

age <- 30
if (age >= 17){
  print("May drive")
} else{
  print("May not drive")
}
# Task: Children aged from 13 to 19 are referred to as teenagers. Give the value held in age is the age of the
# individual, write a script that prints “teenager” or “not teenager” depending on age.
# age <- 20

age <- 20
if (age >= 13 & age <= 19 ){
  print("teenager")
} else{
  print("not teenager")
}
# Use & when all conditions must be true (AND).
# Use | when at least one condition must be true (OR).
# Foe example; age >= 13 & age <= 19 → both must hold → “teenager”
#              age < 13 | age > 19 → either holds → “not teenager

