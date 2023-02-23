

bodyfatwomen = read.csv("bodyfatwomen.csv") #store dataset from .csv


# create a matrix of the independent variables
X = cbind(1, bodyfatwomen$age, bodyfatwomen$weight, bodyfatwomen$height, bodyfatwomen$adiposity, bodyfatwomen$neck, bodyfatwomen$chest, bodyfatwomen$abdomen, bodyfatwomen$hip, bodyfatwomen$thigh, bodyfatwomen$knee, bodyfatwomen$ankle, bodyfatwomen$biceps, bodyfatwomen$forearm, bodyfatwomen$wrist)

# create a matrix of the dependent variable
y = bodyfatwomen$DEXfat

# compute beta = (X^T*X)^-1*y
beta = solve(t(X) %*% X) %*% t(X) %*% y

# Compute the residuals and plot them
residuals = y - X %*% beta

# plot the residuals vs. the index 
plot(residuals, main = "Residual Plot for DEXfat", xlab = "Index", ylab = "Residual", col = "red", pch = 20, cex = 1.5, bg = "white")

# plot lines for standard variance
abline(h = sd(residuals), col = "blue", lwd = 4)
abline(h = -sd(residuals), col = "blue", lwd = 4)


# Plot the residal mean
abline(h = mean(residuals), col = "green", lwd = 4)

# include legends for the lines and the points
legend("topright", legend = c("DEXfat", "Standard Deviation", "Error mean"), col = c("red", "blue", "green"), pch = c(20, 1))

# make points bigger and lines thicker
par(cex = 1, lwd = 2)


