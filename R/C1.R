#a
x <- c(50,74,71,91,55,101,80,86,73,74,73,75,77,97,85,76,73,77,75,89,78,
       80,84,80,68,74,76,77,91,73,72,81,67,71,77,93,82,76,65,74,74,80,
       71,57,83,80,69,73,73,72,81,66,87,80,79,72,67,74,68,83,96,76,84,
       79,71,77,66,86,85,78,92,55,79,75,73,90,88,99,83,66)
library(fdth)
dist <- fdt(x, breaks="Sturges")
dist
#b
mean(x)
var(x)
desviacion <- sqrt(var(x))
desviacion
#c
median(x)
sort(x)
quantile(x)
#d
c <- c(50,55,60,65,70,75,80,85,90,95,100,105)
hist(x, breaks = c, xlab = "Pesos", ylab = "Personas", main =
       "PESOS(KG) PERSONAS EII", col="red", density = 5.0, border =
       "black", labels = TRUE)
#e
boxplot(x, main="PESOS(KG) PERSONAS EII", notch = TRUE)