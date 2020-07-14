setwd("D:/Usuarios/Juan Ignacio/Desktop/Data Science")
getwd()

#Data Read#
library(readxl)
pob2017 <- read_excel("Poblacion_H_M_T_2017.xlsx")
View(pob2017)

##Filtrado ##
pob2017vot<-pob2017[!(pob2017$edad %in% c("Total Comunal","0 a 4","5 a 9", "10 a 14","15 a 19")),]
View(pob2017vot)

#Ajuste para la poblacion de 15 a 19 años (40% del total) (Shift + 0 modo sobreescribir)
pob2017Ajust <- pob2017[!(pob2017$edad %in% c("Total Comunal","0 a 4","5 a 9", "10 a 14","20 a 24", "25 a 29", "30 a 34", "35 a 39", "40 a 44", "45 a 49", "50 a 54", "55 a 59","60 a 64", "65 a 69","70 a 74", "75 a 79","80 a 84", "85 a 89", "90 a 94","95 a 99", "100 o más")),]
View(pob2017Ajust)
hombres_a <- pob2017Ajust$hombres*0.4
hombres_a <- round(hombres_a)
mujeres_a <- pob2017Ajust$mujeres*0.4
mujeres_a <- round(mujeres_a)
total_a <- mujeres_a+hombres_a
total_a <- round(total_a)
View(total_a)

#Juntar tablas
pob2017Ajust <- cbind(pob2017Ajust,hombres_a,mujeres_a,total_a)
View(pob2017Ajust)

#Eliminar columnas
pob2017Ajust <- subset(pob2017Ajust, select = - hombres)
pob2017Ajust <- subset(pob2017Ajust, select = - mujeres)
pob2017Ajust <- subset(pob2017Ajust, select = - total)

#Renombrar columnas
edadac<-gsub(pattern ="15 a 19", x=pob2017Ajust$edad, replacement= "18 a 19")
pob2017Ajust <- cbind(pob2017Ajust,edadac)
pob2017Ajust <-subset(pob2017Ajust, select = -edad)
colnames(pob2017Ajust) <- c("comuna_name", "hombres", "mujeres", "total", "edad")
View(pob2017Ajust)

#Juntar tablas
pob2017votantes <- rbind(pob2017vot,pob2017Ajust)
View(pob2017votantes)

write.csv2(x=pob2017votantes, file="Poblacion_Votantes_2017")
