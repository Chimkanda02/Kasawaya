# Package deSolve: Solving Initial Value Differential Equations in R
# Implementation of an IVP ODE in R can be separated in two parts: the model specification and the model application. Model specification consists of:
         # Defining model parameters and their values,
         # Defining model state variables and their initial conditions,
         # Implementing the model equations that calculate the rate of change (e.g. dX/dt) of the state variables.
# The model application consists of:
         # Specification of the time at which model output is wanted,
         # Integration of the model equations (uses R-functions from deSolve),
         # Plotting of model results.
# 1.1. Model specification
         # Model parameters

# There are three model parameters: a, b, and c that are defined first. Parameters are stored as a vector with assigned names and values:
parameters <- c(a = -8/3,
                b = -10,
                c = 28)

# State variables
# The three state variables are also created as a vector, and their initial values given:
state <- c(X = 1,
           Y = 1,
           Z = 1)

# Model equations
# The model equations are specified in a function (Lorenz) that calculates the rate of change of the state variables.
# The code is most readable if we can address the parameters and state variables by their names.As both parameters and state variables are ‘vectors’, they are converted into a list. 
# The statement with(as.list(c(state, parameters)), ...) then makes available the names of this list.

# The main part of the model calculates the rate of change of the state variables. 
# At the end of the function, these rates of change are returned, packed as a list. Note that it is necessary to return the rate of change in the same ordering as the specification of the state variables. 
# This is very important. In this case, as state variables are specified X first, then Y and Z, the rates of changes are returned as dX, dY, dZ.
Lorenz<-function(t, state, parameters) {
  with(as.list(c(state, parameters)),{
     # rate of change
     dX <- a*X + Y*Z
     dY <- b * (Y-Z)
     dZ <- -X*Y + c*Y - Z
     # return the rate of change
     list(c(dX, dY, dZ))
  }) # end with(as.list ...
}

# 1.2. Model application
# Time specification
# We run the model for 100 days, and give output at 0.01 daily intervals. R’s function seq() creates the time sequence:
times <- seq(0, 100, by = 0.01)

# Model integration
# The model is solved using deSolve function ode, which is the default integration routine.
# Function ode takes as input, a.o. the state variable vector (y), the times at which output is required (times), the model function that returns the rate of change (func) and the parameter
# vector (parms)
# Function ode returns an object of class deSolve with a matrix that contains the values of the state variables (columns) at the requested output times.

library(deSolve)
out <- ode(y = state, times = times, func = Lorenz, parms = parameters)
head(out)

# Plotting results
# Finally, the model output is plotted. We use the plot method designed for objects of class deSolve, which will neatly arrange the figures in two rows and two columns; before plotting,
# the size of the outer upper margin (the third margin) is increased (oma), such as to allow writing a figure heading (mtext). First all model variables are plotted versus time, and
# finally Z versus X:

par(oma = c(0, 0, 3, 0))
plot(out, xlab = "time", ylab = "-")
plot(out[, "X"], out[, "Z"], pch = ".")
mtext(outer = TRUE, side = 3, "Lorenz model", cex = 1.5)




















































