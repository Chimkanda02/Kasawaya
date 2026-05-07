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
IsEven(IsEven(IsEven(x = 8))) → innermost: IsEven(8)# → TRUE; next: IsEven(TRUE) → FALSE; outermost: IsEven(FALSE) → FALSE (since FALSE is coerced to 0, and 0 %% 2 == 0 is TRUE?
as.numeric(TRUE)# → converts TRUE to 1, prints 1
