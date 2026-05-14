# =============================================================================
# Introduction to Epidemiology
#
# Institution: Institut Pasteur de Tunis & Africa CDC
# Date: April 16, 2026
# Instructor: Prof. Slimane Ben Miled
#
# Overview:
# This script implements fundamental epidemiological models (SIR and SEIR)
# using R. It covers:
# - Basic epidemiological concepts
# - Compartmental models (SIR, SEIR)
# - Interpretation of model dynamics
# - Applications to public health and decision-making
# =============================================================================

# Load required libraries
library(deSolve)
library(ggplot2)
library(reshape2)

# =============================================================================
# SIR Model Description
#
# A simple mathematical description of the spread of a disease in a population
# is given by the SIR model. The population is divided into three compartments:
# - S(t): Susceptible individuals
# - I(t): Infected (infectious) individuals
# - R(t): Recovered individuals (with immunity)
#
# SIR Model Equations:
#   dS/dt = -beta * S * I / N
#   dI/dt = beta * S * I / N - gamma * I
#   dR/dt = gamma * I
#
# Total population N is assumed constant.
# Model Parameters:
#   beta  : transmission rate
#   gamma : recovery rate (1/gamma is infectious period)
# =============================================================================

# SIR differential equations function for deSolve
sir_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    N <- 1.0
    dS <- -beta * S * I / N
    dI <-  beta * S * I / N - gamma * I
    dR <-  gamma * I
    return(list(c(dS, dI, dR)))
  })
}

# Time parameters
t_start <- 0
t_end   <- 100
dt      <- 0.1
times   <- seq(t_start, t_end, by = dt)

# Initial conditions (proportions)
I0 <- 1e-7
S0 <- 1 - I0
R0 <- 0
state_initial <- c(S = S0, I = I0, R = R0)

# Model parameters (R0 = 0.8)
R0_val <- 0.8
gamma  <- 1/4
beta   <- R0_val * gamma

parameters <- c(beta = beta, gamma = gamma)

# Solve ODE
out_sir <- ode(y = state_initial, times = times, func = sir_model, parms = parameters)
out_sir <- as.data.frame(out_sir)

# Plot SIR compartments
df_sir <- melt(out_sir, id.vars = "time", variable.name = "Compartment", value.name = "Proportion")
ggplot(df_sir, aes(x = time, y = Proportion, color = Compartment)) +
  geom_line() +
  labs(title = "SIR Model Simulation", x = "Time", y = "Population proportion") +
  theme_minimal()
ggsave("sir_plot.png", width = 8, height = 6, dpi = 150)

# Daily new cases approximation (difference of I)
new_cases <- diff(out_sir$I)
plot(times[-1], new_cases, type = "l", col = "red",
     xlab = "Time", ylab = "New cases (approx)", main = "Daily New Cases (SIR)")

# =============================================================================
# Extension: Modeling a Control Measure (e.g., Lockdown)
# Time-varying reproduction number
# =============================================================================

# Time-varying R0 function: lockdown after t = 70
R0_time <- function(t) {
  ifelse(t < 70, 2, 0.5)
}

# SIR with time-dependent beta
sir_control_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    gamma <- parameters["gamma"]
    beta  <- R0_time(time) * gamma
    N <- 1.0
    dS <- -beta * S * I / N
    dI <-  beta * S * I / N - gamma * I
    dR <-  gamma * I
    return(list(c(dS, dI, dR)))
  })
}

state_initial <- c(S = S0, I = I0, R = R0)
parameters <- c(gamma = gamma)

out_sir_int <- ode(y = state_initial, times = times, func = sir_control_model, parms = parameters)
out_sir_int <- as.data.frame(out_sir_int)

ggplot(out_sir_int, aes(x = time, y = I)) +
  geom_line(color = "red") +
  labs(title = "SIR Model with Intervention (Lockdown at t=70)", x = "Time", y = "Infectious proportion") +
  theme_minimal()
ggsave("sir_intervention.png", width = 8, height = 6, dpi = 150)

# =============================================================================
# SEIR Model Description
#
# The SEIR model adds an Exposed (E) compartment for individuals who are
# infected but not yet infectious.
#
# SEIR Model Equations:
#   dS/dt = -beta * S * I
#   dE/dt = beta * S * I - sigma * E
#   dI/dt = sigma * E - gamma * I
#   dR/dt = gamma * I
#
# Parameters:
#   beta  : transmission rate
#   sigma : progression rate from exposed to infectious (1/sigma = incubation period)
#   gamma : recovery rate (1/gamma = infectious period)
# =============================================================================

# SEIR differential equations
seir_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -beta * S * I
    dE <-  beta * S * I - sigma * E
    dI <-  sigma * E - gamma * I
    dR <-  gamma * I
    return(list(c(dS, dE, dI, dR)))
  })
}

# Initial conditions for SEIR
I0 <- 1e-7
E0 <- 0
R0 <- 0
S0 <- 1 - I0 - E0 - R0
state_initial <- c(S = S0, E = E0, I = I0, R = R0)

# Parameters (R0 = 2.5, infectious period 4 days, incubation period 5 days)
R0_val <- 2.5
gamma  <- 1/4
sigma  <- 1/5
beta   <- R0_val * gamma

parameters <- c(beta = beta, sigma = sigma, gamma = gamma)

# Solve SEIR
out_seir <- ode(y = state_initial, times = times, func = seir_model, parms = parameters)
out_seir <- as.data.frame(out_seir)

# Plot SEIR compartments
df_seir <- melt(out_seir, id.vars = "time", variable.name = "Compartment", value.name = "Proportion")
ggplot(df_seir, aes(x = time, y = Proportion, color = Compartment)) +
  geom_line() +
  labs(title = "SEIR Model Simulation", x = "Time", y = "Population proportion") +
  theme_minimal()
ggsave("seir_plot.png", width = 10, height = 6, dpi = 150)

# Incidence (new infectious cases per day)
new_cases <- sigma * out_seir$E
plot(times, new_cases, type = "l", col = "blue",
     xlab = "Time", ylab = "Incidence", main = "SEIR Incidence Curve")

# =============================================================================
# Simulation Questions (to be answered interactively)
#
# 1. Run the model with different values of beta. What do you observe?
# 2. Run the model with different values of gamma. What changes in the epidemic curve?
# 3. What happens when initial value of R(0) is smaller than 1? Greater than 1?
# 4. How does the value of I(0) influence the beginning of the epidemic?
# 5. Find the epidemic peak: when does it occur and what is the maximum I(t)?
# 6. What is the final value of R(t)? What does it mean?
# 7. Explain why S(t) decreases over time.
# 8. Explain why I(t) first increases and then decreases.
# 9. Explain the effect of total population N on the evolution of the epidemic.
# 10. Based on the simulation, what parameters are most important for controlling the epidemic?
# =============================================================================

# Example: Find peak of infection for SEIR model
peak_I <- max(out_seir$I)
time_peak <- out_seir$time[which.max(out_seir$I)]
cat("SEIR peak infection proportion:", peak_I, "at time", time_peak, "\n")

# Final epidemic size (final R)
final_R <- tail(out_seir$R, 1)
cat("SEIR final epidemic size (R∞):", final_R, "\n")