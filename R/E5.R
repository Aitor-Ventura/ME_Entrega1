library(knitr)
casas <- read.table("casas.txt", header = TRUE, sep = "\t")
attach(casas)
precios <- (Precio)
A <- rank(precios)
A
B <- sort(precios)
B
C <- order(precios)
C
Comparativa <- data.frame(precios,A,B,C)
Comparativa
precios0 <- B
local0 <- Localizacion[order(Precio)]
casasord <- data.frame(local0, precios0)
kable(casasord)
kable(casasord[precios>190,])
