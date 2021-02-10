library(knitr)
help("read.table")
datos_acc<-read.table("Accidentes_1969_1984_UK.txt",header=T, sep =",", dec = ".")
attach(datos_acc)
summary(datos_acc)
kable(datos_acc[1:10,])#datos del 1 al 10
n<-length(law)#192 años
kable(datos_acc[n-9:n,])#ultimos datos
#a)
plot(1:length(DriversKilled),DriversKilled, xaxt="n",
     type = "l", col="blue",xlab="Meses(años1969-1985)",
     ylab="Num.conductores fallecidos")
years<-seq(1969,1985,1)
axis(1,at=seq(1,length(DriversKilled)+12,12),
     labels<-as.character(years))#convertir en caracter years
grid()
Febrero_83<-(1983-1969)*12+2#año de aplicacion de la ley
abline(v=Febrero_83,col="red",lwd=2)#recta del año de aplicacion de la ley
media_no_ley<-mean(DriversKilled[1:Febrero_83])
media_ley<-mean(DriversKilled[Febrero_83:length(DriversKilled)])
lines(c(0,Febrero_83),c(media_no_ley,media_no_ley),col="red")
lines(c(Febrero_83,192),c(media_ley,media_ley),col="green")
boxplot(DriversKilled~law, xlab="Con(1) y sin(0) aplicacion de la ley",
        ylab="Num Fallecidos/mes",col="orange")
grid()
#b)
plot(DriversKilled,front,pch=19,col="blue",
     ylim = c(0,max(front)))
grid()
modelo1<-lm(front~DriversKilled)
abline(modelo1,col="green",lwd=2)
points(DriversKilled,rear,pch=19,col="red")
modelo2<-lm(rear~DriversKilled)
abline(modelo2,col="green",lwd=2,lty=3)
#c)
plot(DriversKilled[law==0],front[law==0],pch=19,col="blue",
     ylim = c(0,max(front[law==0])))
grid()
modelo1<-lm(front[law==0]~DriversKilled[law==0])
abline(modelo1,col="green",lwd=2)
points(DriversKilled[law==1],front[law==1],pch=19,col="red")
modelo2<-lm(front[law==1]~DriversKilled[law==1])
abline(modelo2,col="green",lwd=2,lty=3)