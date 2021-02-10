library(carData)
library(knitr)
datos <- MplsStops
str(datos)
attach(datos)
datos_s <- subset(datos[problem=="traffic",],select=c(race,gender,
                                                       neighborhood))
detach(datos)
attach(datos_s)
str(datos_s)
head(datos_s)
tail(datos_s)
kable(datos_s[1:10,])
subset(datos, select=c(race,gender,neighborhood))
ftable(race,gender)
table(race)
table(gender)
pie(ftable(gender), labels=levels(gender), radius = 1,
    main = "ACCIDENTES POR GENERO")
pie(ftable(race), labels=levels(race), radius = 1,
    main = "ACCIDENTES POR RAZA")
sitios <- ftable(neighborhood);sitios
barriodt <- data.frame(ftable(sitios))
kable(barriodt)
max(sitios)
which.max(sitios)
which.max(barriodt$Freq)