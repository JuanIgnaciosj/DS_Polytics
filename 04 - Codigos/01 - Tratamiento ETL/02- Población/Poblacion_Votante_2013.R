setwd("D:/Usuarios/Juan Ignacio/Desktop/Data Science")
getwd()

#Carga de datos#
library(readxl)
pob2013 <- read_excel("Poblacion_H_M_T_2013.xlsx")
View(pob2013)

##Filtrado por personas que votan##
pob2013vot<-pob2013[!(pob2013$edad %in% c("0-4","5-9", "10-14","15-19")),]
View(pob2013vot)

#Ajuste para la poblacion de 15 a 19 años (40% del total) (Shift + 0 modo sobreescribir)
pob2013Ajust <- pob2013[!(pob2013$edad %in% c("0-4","5-9", "10-14","20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59","60-64", "65-69","70-74", "75-80")),]
View(pob2013Ajust)
hombres_a <- pob2013Ajust$hombres*0.4
hombres_a <- round(hombres_a)
View(hombres_a)
mujeres_a <- pob2013Ajust$mujeres*0.4
mujeres_a <- round(mujeres_a)
View(mujeres_a)
total_a <- mujeres_a+hombres_a
total_a <- round(total_a)
View(total_a)

#Juntar tablas
pob2013Ajust <- cbind(pob2013Ajust,hombres_a,mujeres_a,total_a)
View(pob2013Ajust)

#Eliminar columnas
pob2013Ajust <- subset(pob2013Ajust, select = - hombres)
pob2013Ajust <- subset(pob2013Ajust, select = - mujeres)
pob2013Ajust <- subset(pob2013Ajust, select = - total)
View(pob2013Ajust)

#Renombrar columnas
edad_ac<-gsub(pattern ="15-19", x=pob2013Ajust$edad, replacement= "18-19")
pob2013Ajust <- cbind(pob2013Ajust,edad_ac)
pob2013Ajust <- subset(pob2013Ajust, select = -edad)
colnames(pob2013Ajust) <- c("comuna_name", "hombres", "mujeres", "total", "edad")
View(pob2013Ajust)

#Juntar tablas
pob2013votantes <- rbind(pob2013vot,pob2013Ajust)
View(pob2013votantes)

write.csv2(x=pob2013votantes, file="Poblacion_Votantes_2013")
