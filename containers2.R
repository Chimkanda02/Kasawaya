# From vectors to lists
vec1 <- 1:3 # creating the vectors
vec2 <- c("a", "b")
vec3 <- c(TRUE, FALSE)
vec4 <- c(vec1, vec2, vec3)
l <- list(vec1, vec2, vec3)

# List examples
l1 <- list(1:3,"abc",c(1.2, 3.8))
l1
typeof(l1)
l3 <- c(list(1, 2), c("3", "4"), list(5, 6))
l3

l1 <- list(1:3,"abc",c(1.2, 3.8))
l1
typeof(l1)
typeof(l1[1])
l3 <- c(list(1, 2), c("3", "4"), list(5, 6))
l3
unlist(l3)
# Are these two commands equivalent?
v <- c(1, 2, 3)
v
as.list(v)
list(
  "a" = factor(c("apple", "apple", "banana")), # a factor containing three elements: "apple", "apple", "banana" (levels will be "apple", "banana")
  "b" = c(1:10)
)

l <- list(
  "a" = factor(c("apple", "apple", "banana")),
  "b" = c(1:10)
)
typeof(l)
names(l)
attributes(l)
names(l) <- c("aa", "bb")
l[["a"]]
l["a"]
typeof(l[["a"]])
typeof(l["a"])

# Same as vectors, the attr function adds attributes to lists.
attr(l, "names") <- c("n1", "n2")
attr(l, "des") <- "description of l"
attr
df <- data.frame(x = 1:3, y = letters[1:3])

l <- list(x = 1:3, y = letters[1:3])
attr(l, "class") <- "data.frame"
attr(l, "row.names") <- 1:3
l

# list + attributes makes data.frame
identical(df, l)
attributes(df)

# as.data.frame behaves differently to data.frame given the same inputs
df1 <- as.data.frame(list(x = 1:3, y = letters[1:3]))
df2 <- as.data.frame(x = 1:3, y = letters[1:3])
identical(df, df1)
identical(df, df2)

nrow(df)
ncol(df)
length(df)
rownames(df)
colnames(df)
names(df)

# transpose; Task: Compare the output from df
t(df)

# row/column-wise functions of data.frame
df <- data.frame(x = 1:3, y = letters[1:3])
df2 <- rbind(df, df)
df3 <- cbind(a = df2, z = 1:nrow(df2)*10)
df2
df3

# Task: What are the outputs?
df2[["x"]][5]
df2
df2[["x"]][nrow(df2)]
df2
df2[[ncol(df2)]][nrow(df2)]
df2
colnames(df2)[ncol(df2)]
identical(df2["y"], df2[["y"]])
df2[["x"]][2]
# Task: What are the outputs?
  df3["4", "z"]
(df3[["z"]] + 4)[2]
df3[[ncol(df3)]][nrow(df3)]

library(tibble)
tb <- tibble(x = 1:3, y = letters[1:3])
typeof(tb)
attributes(tb)
is.data.frame(tb)
tb

# Data Extraction
# There are three extraction operators, [, [[, and $. (see ?Extract)
# For vector structures, we only need [.
# [[ and $ are only needed for list structures (recursive)
# $ requires column names

a <- c(11, 22, 33, 44, 55)
# 1. Positive numbers
a[4]
a[2:3]
a[c(3, 1)]
a[c(2, 2, 3)]
a[4.9]
a[1.2:3.2]

# 2. Negative numbers
a[-4] # extracts all elements except the 4th (value 44)
a[c(-4, -3)] # excludes the 4th and 3rd elements, returning 11, 22, 55
a[-c(4, 3)] # does the same as above, excluding positions 4 and 3
a[c(-4,)] #  is invalid syntax (trailing comma), and would produce an error in R

# Extract from vectors
a <- c(11, 22, 33, 44, 55, 10)
# 3. Logical values
a[c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE)] # Length matches a. Keeps positions 1 and 3
a[c(TRUE, FALSE)] # Recycled to length 6 → TRUE, FALSE, TRUE, FALSE, TRUE, FALSE. Keeps positions 1, 3, 5
a[c(TRUE, FALSE, FALSE, FALSE)] # Recycled to length 6 → TRUE, FALSE, FALSE, FALSE, TRUE, FALSE. Keeps positions 1 and 5
a[c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE)] # Logical index has length 7, which is longer than a (length 6). This produces an error in R
a > 35 # Returns a logical vector of the same length as a: FALSE FALSE FALSE TRUE TRUE FALSE (since only 44 and 55 are > 35)
a[a > 35] # Extracts elements where the condition is TRUE → 44, 55.
a[a > 35] # (repeated) – same as above
a[a > 20 & a < 50] # Uses element-wise & (AND). Keeps elements >20 and <50 → 22, 33, 44 (since 55 is too high, 10 too low).
a[a > 20 && a < 50] # Uses && (only the first element of each logical vector). a > 20 → first element FALSE, a < 50
a[c(FALSE, TRUE, NA)] #Logical indexing with NA. Any NA in the index produces NA in the output at that position. The index length is 3, recycled to length 6:

# Extract from vectors
a <- c(11, 22, 33, 44, 55, 10)

# 4. Empty
a[] # print all the contents of the vector
identical(a, a[]) # is TRUE – both are the same object in content and type a[NULL]
a[NULL] # Using NULL as an index removes the notion of “no elements” entirely. It returns a zero-length
typeof(a[NULL]) # Since a[NULL] returns an empty numeric vector, typeof() returns "double" (the type of the original vector)
typeof(a[NULL]) == typeof(a) # Both sides are "double", so the comparison returns TRUE – an empty subset preserves the data type.
a[NA]

# 5. Zero
a[0] # Index 0 is ignored in R (no element has index 0). It returns an empty numeric vector: numeric(0)
a[c(0, 1)] # Index 0 is ignored, index 1 selects the first element. The result is a vector containing only 11

# Extract from vector
# 6. Characters
b <- c(a = 11, b = 22, c = 33)
b["a"]
b[a] # returns error coz a is a character and must be place inside inverted commas
b[c("a", "a", "c")]
b["d"] # returns NA coz in the vector b, we don't have d
b[b > 20][[2]] == b[b > 20][2] b[b > 20]  # selects elements greater than 20, returning b=22 c=33. [[2]] extracts the second value as a scalar (no name), so b[b > 20][[2]] yields 33
# [2] returns a sub-vector of length 1, preserving the name: c=33.
# == compares only the values, so 33 == 33 is TRUE.
identical(b[b > 20][[2]], b[b > 20][2]) # identical() compares everything (values, names, attributes), so 33 (unnamed) vs c=33 (named) is FALSE.
names(b[b > 20][2]) # b[b > 20] yields a named vector: b=22 c=33.Subsetting with [2] keeps the name (c), so names() gives "c".
names(b[b > 20][[2]]) # Subsetting with [[2]] extracts the value 33 as a plain numeric, which has no name, so names() returns NULL

# Extract from vector / Exercise
p <- c(a = 11, b = 22, c = 33)
q <- c("aa", "bb", "cc")
# Task: Given the definition of p and q above, work out the followings:
q[p[c("a", "a", "b")] > 20] 
# p[c("a","a","b")] → c(11,11,22)
# >20 → c(FALSE, FALSE, TRUE)
# Subset q → only the third element ("cc")
# Output: "cc" because q contains strings cc

p[q == "bb" | p < 20] 
# q == "bb" → c(FALSE, TRUE, FALSE) why? "aa" == "bb" → FALSE, "bb" == "bb" → TRUE, "cc" == "bb" → FALSE
# p < 20 → c(TRUE, FALSE, FALSE)
# OR → c(TRUE, TRUE, FALSE)
# Subset p → first two elements: a=11, b=22  NOTE!!! we are using two conditions here (i) p < 20 (ii) q == "bb"
# Output: a 11 b 22

p[-2] + p[3] 
# p[-2] excludes the second element, so it becomes c(a = 11, c = 33) (length 2).
# p[3] extracts the third element: c = 33 (length 1)
# When adding a vector of length 2 with a vector of length 1, the shorter vector is recycled to match the longer one. So p[3] effectively becomes c(33, 33)
# Then element‑wise addition:
# 11 + 33 = 44 (keeps name "a")
# 33 + 33 = 66 (keeps name "c")
# Result: a 44 c 66

paste0(q[p > 20], "d") 
# p > 20 evaluates to c(FALSE, TRUE, TRUE) because p has values 11, 22, 33.
# This logical vector is used to subset q, selecting only the elements where the condition is TRUE
# q[c(FALSE, TRUE, TRUE)] → c("bb", "cc")
# paste0(..., "d") concatenates the string "d" to each element of c("bb", "cc") without a separator.
# Result: c("bbd", "ccd").
# Output: "bbd" "ccd"

# Extract from vectors / matrix
# Extract from matrix
m <- matrix(11:22, nrow = 4) # This code creates a 4×3 matrix filled column‑wise with the integers 11 through 22: By default, matrix() fills by column (top to bottom, left to right)
colnames(m) <- c("col1", "col2", "col3") # Assigns the column names "col1", "col2", "col3" to the matrix.
m[2, 3]  # Row 2, column 3 → 20
m[2:3]  # Vector: 11,12,13,14,15,... → positions 2 and 3 are 12, 13. Returns c(12, 13)
m[2:3, ]  # Rows 2 and 3, all columns → a 2×3 matrix:
m[2:3, 3]  # Rows 2 and 3, column 3 → vector c(20, 21)
m[2:3, 2:3]  # Rows 2–3, columns 2–3 → a 2×2 matrix
m[2]  # Single index as vector → second element = 12
m[2, ]  # Second row, all columns → vector c(12, 16, 20)
m[m > 5]  # All elements are >5 (11–22), so returns the entire vector (column‑major):c(11,12,13,14,15,16,17,18,19,20,21,22)
m[2, c("col1", "col3")] # Row 2, columns named "col1" and "col3" → vector c(12, 20) (names preserved)

# Extract from lists
l <- list(1:5, letters[1:3], c(1.4, 3.1, 6.4, 6.2))
l
l[1]
l[1][2] # l[1] extracts the first component as a list of length 1.The result is [1] 1 2 3 4 5. l[1] is a list of length 1.[2] on that list asks for the second element of this list, te result is NULL. 
l[1, 2] # It sees the comma inside the square brackets and expects two indices (row, column). But l has no dim attribute (it is not a matrix, array, or data frame). R returns an error.
l[-1]
l[2:3]
identical(l[-1], l[2:3])
l[[3]] # l[[3]] extracts the third component of the list as its original object, not as a sublist.
l[[3:4]] # First, extract the 3rd component of l → the numeric vector c(1.4, 3.1, 6.4, 6.2).Then, from that result, extract the 4th element.
l[3:4] # l[3:4] extracts the 3rd and 4th components of l as a sublist (single brackets [ ] always return a list). l[4] does not exist → returns a list of length 1 containing NULL.

# Extract from data.frame
# with [] and [[]]
df <- data.frame(x = 1:10, y = letters[1:10])
df
x <- df[1]
x <- df[[1]]
x <- df[, 1]
x <- df[1, ]
x <- df[1, 2]
x <- df[, 1:2]
x <- df[3:5, ]
x <- df[3:5, 2]
x <- df[, c("y", "x", "x")] # c("y", "x", "x") selects columns by name: first y, then x, then x again. Subsets df using [rows, columns].
x <- df[, c("x", "x")] # df[, c("x", "x")] selects all rows (empty before comma) and two columns, both named "x". The result is a data frame with two columns. Column names will be "x" and "x.1"
x <- df[, c(2, 1, 1)] # c(2, 1, 1) selects columns by position:   2 → y , 1 → x, 1 → x again (second copy) x

df["y"] # extracts the column named "y" from the data frame df, but returns it as a data frame
df[["y"]] # gives you the y column as a character vector. 
df[c(TRUE, FALSE), ] # selects rows from the data frame based on a logical vector that is recycled to match the number of rows. Result: rows 1, 3, 5, 7, 9 (all odd‑numbered rows) and all columns (because the space after the comma means no column subsetting).
# You get odd‑numbered rows because R recycles the logical vector c(TRUE, FALSE) starting from the first row
df[, c(TRUE, FALSE)] # TRUE selects column1 (x), FALSE skips column2 (y).The result is a data frame with one column (x), all rows kept.
df[c(TRUE, FALSE)] # the same result but this time the Result is a data frame with one column (x), all rows kept
df[df[, "x"] > 5, ] # selects the result starting from x greater than 5
df[df[["x"]] > 5, ] # same

# Extract from data.frame
# with $
df <- data.frame(age = 1:10, initial = letters[1:10]) 
df["age"]
df[["age"]]
df$age # $ is used to access a column by name directly.Returns the content (the vector), not a data frame (unlike df["age"] which returns a one‑column data frame).
df$"age" # does exactly the same thing as df$age — it extracts the column named "age" from the data frame as a vector.
df$`age`
df$a  # df$a looks for a column name that starts with "a".The only match is "age", so df$a returns the age column as a vector: 1 2 3 4 5 6 7 8 9 10
df$"a"
df$'a'
df$`a`
df[["a"]] # df[["a"]] returns NULL because there is no column named exactly "a" in the data frame.

# difference between $ and [[ ]]
df2 <- data.frame(age = 1:10, account = letters[1:10])
wanted_col <- "age"
df2$a # returns NULL coz there are two variables that starts with "a"
df2$ag # returns the contents of the vector age since the onl variable that has letters ag is age
df2$ac
df2[[wanted_col]] # returns integer vector 1:10
df2$wanted_col # df2$wanted_col returns NULL because "wanted_col" is not a column name in df2
df2$age

# Task: Given the definition of df2 above,work out the followings:
df <- data.frame(age = 1:10, account = letters[1:10])
df[df[3, 1], 2] # df[3, 1] extracts the value at row 3, column 1 → 3 (the age). This value (3) is used as the row index, so the expression becomes df[3, 2], which returns the value at row 3, column 2 → "c"
df[df[[1]] %% 2 == 0, 2] # selects rows from df where the first column (age) is even, then returns the corresponding values from the second column (account)
length(df) * nrow(df) # length(df) = number of columns in the data frame = 2. nrow(df) = number of rows = 10. Result = 2 * 10 = 20
df[["x"]][-2][2] # df[["x"]] attempts to extract column "x" — it returns NULL (no such column). NULL[-2] subsetting with a negative index on NULL still yields NULL. NULL[2] also yields NULL
df[df[, "y"] == "d", "x"] # df[, "y"] extracts column "y" as a vector. == "d" creates a logical vector indicating rows where column "y" equals the string "d".This logical vector is used to select rows from df. , "x" then selects column "x" from those filtered rows.
df$y[2:5][3] #  If column "y" existed, it would take the 2nd through 5th elements of that column, then select the 3rd element from that subset (which would be the overall 4th element of the original column). It returns NULL coz y does not exist.












































