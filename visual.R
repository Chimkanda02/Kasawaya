# Plotting with R Base / plot() 
# Plotting vectors
plot(x = c(1, 2, 3), y = c(2, 5, 4))
plot(4:9)

# Modifying plot elements
plot(cars)
plot(cars, type = "b",     # "b" for both	Draws both points and lines (points connected by line segments).
     main = "cars dataset", # Main title of the plot.
     xlab = "Speed (mph)", ylab = "Stopping distance (ft)",  # Label for the x‑axis.Label for the y‑axis.
     xlim = c(0, 30), ylim = c(0, 140),  # Limits of the x‑axis: from 0 to 30 mph.Limits of the y‑axis: from 0 to 140 ft.
     pch = 16, lty = "dashed", col = "purple",  # Plotting character – 16 is a solid circle (●).Line type – dashed line connecting the points. Colour of both points and lines.
     xaxs = "i", yaxs = "i"  # x‑axis style = "internal".Prevents extra padding at the ends; axis limits exactly from 0 to 30. Same for y-axis. Axis limits exactly from 0 to 140, no extra white space inside.
)

# Plotting with R Base / boxplot()
# boxplot (wide table)
df <- data.frame(        # data.frame() creates a table (like a spreadsheet) with columns.Column names: uniform and normal.
  uniform = runif(100),  # runif(100) generates 100 random numbers from a uniform distribution between 0 and 1 (default).
  normal = rnorm(100)    # rnorm(100) generates 100 random numbers from a normal (Gaussian) distribution.
)
boxplot(df)

# boxplot (long table)
boxplot(count ~ spray, InsectSprays) # It creates a boxplot that compares the distribution of insect count across different types of spray.

# Plotting with R Base / matplot()
# matplot
matplot(
  cbind(
    sin(1:10) * 0.1,
    sin(1:10) * 3,
    sin(1:10) * 1.8
  ),
  type = "l", lty = 1,
  col = c("red", "blue", "black"),
)
legend(
  "topright",
  legend = c(
    "sin(1:10) * 0.1",
    "sin(1:10) * 3",
    "sin(1:10) * 1.8"
  ),
  col = c("red", "blue", "black"),
  lty = 1
)

# Plotting with R Base / exercise
# Task: Make a plot that illustrates the relationship between “Temp” and “Month” in the airquality dataset
airquality
boxplot(Temp ~ Month, airquality) # Median temperature rises steadily from 66°F in May to 76°F in September. The increase is largest between May and June (+10°F), then smaller increments thereafter.There is a clear, positive relationship: later months are warmer.
aggregate(Temp ~ Month, airquality, median) # to get exact numeric medians.

# ggplot2
# Base plot()
pressure
plot(pressure)

library("ggplot2")
ggplot(data = pressure) +
  geom_point(
    mapping = aes(x = temperature, y = pressure)
  )
# No need to include data in the code
ggplot(pressure) + 
  geom_point(aes(x = temperature, y = pressure)
  )

# Now, join the points with a smooth line
ggplot(data = pressure) +
  geom_point(
    mapping = aes(x = temperature, y = pressure)
  ) +
  geom_line(
    mapping = aes(x = temperature, y = pressure)
  )

# Mapping can be specified in the ggplot() function, and shared by geom_ layers that don’t have a mapping declared
ggplot(
  data = pressure,
  mapping = aes(x = temperature, y = pressure)
) +
  geom_point() +
  geom_line()

# ^ mapping declared in the geom_ function overwrites the one declared in the ggplot() function. Produces two line graphs of different direction.
ggplot(
  data = pressure,
  mapping = aes(x = temperature, y = pressure)
) +
  geom_point() +
  geom_line(mapping = aes(y = temperature, x = pressure))

# Labels and title

























































































