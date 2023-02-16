
bodyfatwomen = read.csv("bodyfatwomen.csv") #store dataset from .csv

# plot bodyfat vs. age, with bodyfat as the y-axis and age as the x-axis, and add a title, x-axis label, and y-axis label, and change the color of the points to red, set a marker size of 2, and set the background color to white
#plot(bodyfatwomen$age, bodyfatwomen$bodyfat, main="Body Fat vs. Age", xlab="Age", ylab="Body Fat", col="red", pch=20, cex=2, bg="white")

# print all column types in bodyfatwomen
existing_data = sapply(bodyfatwomen, class)
print(existing_data)

#residual plot for DEXfat - DEXfat average vs index
plot(bodyfatwomen$DEXfat - mean(bodyfatwomen$DEXfat), main="Residual Plot for DEXfat", xlab="Index", ylab="Residual", col="red", pch=20, cex=1.5, bg="white")
# plot lines for standard variance
abline(h=sd(bodyfatwomen$DEXfat), col="blue", lwd=4)
abline(h=-sd(bodyfatwomen$DEXfat), col="blue", lwd=4)
# include legends for the lines and the points
legend("topright", legend=c("DEXfat", "Standard Deviation"), col=c("red", "blue"), pch=c(20, 1))
# make points bigger and lines thicker
par(cex=1, lwd=2)
