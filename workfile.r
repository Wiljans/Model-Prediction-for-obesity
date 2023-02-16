
bodyfatwomen = read.csv("bodyfatwomen.csv") #store dataset from .csv



# print DEXfat column vs age and do linear regression with a 95% confidence interval
plot(bodyfatwomen$age, bodyfatwomen$DEXfat, main="DEXfat vs. Age", xlab="Age", ylab="DEXfat", col="red", pch=20, cex=2, bg="white")
abline(lm(bodyfatwomen$DEXfat ~ bodyfatwomen$age), col="blue", lwd=2)
