library(ggplot2)
library(knitr)
dvp<- read.table("Ventas_Provincia.txt", header = T, dec = ".", sep = ",")
n<-length(dvp$Total_Ventas)
s_p_12<- aggregate(dvp$Total_Ventas~dvp$Provincia, dvp, sum)
kable(s_p_12)
s_m_12<- aggregate(dvp$Total_Ventas~dvp$Provincia, dvp, mean)
kable(s_m_12)
s_p_12$`dvp$Provincia`[which.max(s_p_12$`dvp$Total_Ventas`)]
s_p_12$`dvp$Provincia`[which.min(s_p_12$`dvp$Total_Ventas`)]
year_mes<- as.Date(dvp$Year_Mes)
segundo_semestre<-dvp[year_mes>"2012-06-01",]
attach(segundo_semestre)
provincias_estudio<- segundo_semestre[Provincia == "Caceres"|Provincia == "Madrid"| Provincia =="Barcelona",]
detach(segundo_semestre)
attach(provincias_estudio)
Year_Mes_Semestre<- unique(year_mes[year_mes>"2012-06-01"])
plot(Year_Mes_Semestre, Total_Ventas[Provincia=="Barcelona"], type = "b", col = "red", lwd = 2, ylim = c(0, max(Total_Ventas)), ylab = "Ventas mensuales en euros", xlab = "Segundo Semestre 2012", main = "Análisis de Ventas por Provincia ")
text(Year_Mes_Semestre[2], 50000, labels = "Barcelona", col = "red", cex = 1.10)
grid()
points(Year_Mes_Semestre, Total_Ventas[Provincia=="Madrid"], type = "b", col = "blue", lwd=2)
text(Year_Mes_Semestre[5], 50000, labels = "Madrid", col = "blue", cex = 1.10)
points(Year_Mes_Semestre, Total_Ventas[Provincia=="Caceres"], type = "b", col = "green", lwd=2)
text(Year_Mes_Semestre[4], 50000, labels = "Caceres", col = "green", cex = 1.10)
provincias_estudio_semestre<-factor(provincias_estudio$Provincia, levels = unique(provincias_estudio$Provincia))
boxplot(provincias_estudio$Total_Ventas~provincias_estudio_semestre, col= "green", ylab = "Ventas Mensuales en euros", xlab="Provincias Seleccionadas", main= "Análisis de ventas por provincias")
grid()
g<- ggplot(data = provincias_estudio, mapping = aes(x=Year_Mes, y=Total_Ventas, group=Provincia, colour= Provincia))
g1<- g+ geom_point()+ geom_line()
g1
g2<- g1+ xlab ("Segundo semestre 2012")+ ylab ("Ventas mensuales en euros")+ ggtitle("Análisis de ventas por provincia")
g2