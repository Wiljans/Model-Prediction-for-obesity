
bodyfatwomen = read.csv("bodyfatwomen.csv") #store dataset from .csv

# plot bodyfat vs. age, with bodyfat as the y-axis and age as the x-axis, and add a title, x-axis label, and y-axis label, and change the color of the points to red, set a marker size of 2, and set the background color to white
#plot(bodyfatwomen$age, bodyfatwomen$bodyfat, main="Body Fat vs. Age", xlab="Age", ylab="Body Fat", col="red", pch=20, cex=2, bg="white")

# print all column types in bodyfatwomen
existing_data = sapply(bodyfatwomen, class)
print(existing_data)

# print DEXfat column vs age and do linear regression with a 95% confidence interval
plot(bodyfatwomen$age, bodyfatwomen$DEXfat, main="DEXfat vs. Age", xlab="Age", ylab="DEXfat", col="red", pch=20, cex=2, bg="white")
abline(lm(bodyfatwomen$DEXfat ~ bodyfatwomen$age), col="blue", lwd=2)

