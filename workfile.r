
bodyfatwomen = read.csv("bodyfatwomen.csv") #store dataset from .csv
print(bodyfatwomen) #print dataset

# plot bodyfat vs. age, with bodyfat as the y-axis and age as the x-axis, and add a title, x-axis label, and y-axis label, and change the color of the points to red, set a marker size of 2, and set the background color to white
plot(bodyfatwomen$age, bodyfatwomen$bodyfat, main="Body Fat vs. Age", xlab="Age", ylab="Body Fat", col="red", pch=20, cex=2, bg="white")

