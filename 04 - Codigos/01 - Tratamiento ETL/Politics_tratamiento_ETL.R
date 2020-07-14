#generacion de ETL v1
#los candidatos, las comunas, y las regiones, se van a manejar como ID


getwd()
setwd("D:/Usuarios/Juan Ignacio/Trabajos U/Ingenieria Civil Industrial/Quinto Año/Segundo semestre/Data Science Aplicada/Data Warehouse")

###Data Read###
datos2013vuelta1 <-read.csv2("Presidenciales1-2013.csv",sep=",",header=TRUE, dec=",")
datos2013vuelta2 <-read.csv2("Presidenciales2-2013.csv",sep=",",header=TRUE, dec=",")
datos2017vuelta1<-read.csv2("Presidenciales1-2017.csv",sep=",",header=TRUE, dec=",")
datos2017vuelta2<-read.csv2("Presidenciales2-2017.csv",sep=",",header=TRUE, dec=",")

#Corrobora la carga de los datos
View(datos2013vuelta1)
View(datos2013vuelta2)
View(datos2017vuelta1)
View(datos2017vuelta2)

###Join Table###
Presidenciales = rbind(datos2013vuelta1, datos2013vuelta2)
Presidenciales = rbind(Presidenciales, datos2017vuelta1)
Presidenciales = rbind(Presidenciales, datos2017vuelta2)

#Corrobora la carga de los datos
View(Presidenciales)

###Delete partido_id###
Presidenciales <- subset( Presidenciales, select = -partido_id)

#Corrobora la carga de los datos
View(Presidenciales)

###Add Candidatos###

candidatos<-read.csv2("Candidatos.csv",sep=",",header=TRUE, dec=",")
View(candidatos)

###Add id_region y nombre_region###

#para corregir el problema de las elecciones del 2017, que aparecen los candidatos 2550, 2551, 2552 que no aparecen en la tabla de candidatos
# 2550 -->Piñera
# 2551 -->sanchez
# 2552 -->artes


Presidenciales = merge(Presidenciales,candidatos)

View(Presidenciales)


regiones<-read.csv2("Regiones-Comunas.csv",sep=",",header=TRUE, dec=",")
View(regiones)

Presidenciales = merge(Presidenciales,regiones)
View(Presidenciales)

###Clean Table###
Presidenciales <- subset( Presidenciales, select = -comuna_customs_id )
View(Presidenciales)

Presidenciales <- subset( Presidenciales, select = -comuna_tax_office_id )
View(Presidenciales)

###Revision CSV###
#Revision Presidenciales 2013
View(subset(Presidenciales, candidato== "Franco Aldo Parisi Fernandez"))
View(subset(Presidenciales, candidato== "Marcel Claude Reyes"))
View(subset(Presidenciales, candidato== "Ricardo Israel Zipper"))
View(subset(Presidenciales, candidato== "Marco Enriquez-Ominami Gumucio"))
View(subset(Presidenciales, candidato== "Roxana Miranda Meneses"))
View(subset(Presidenciales, candidato== "Michelle Bachelet Jeria"))
View(subset(Presidenciales, candidato== "Evelyn Matthei Fornet"))
View(subset(Presidenciales, candidato== "Alfredo Sfeir Younis"))
View(subset(Presidenciales, candidato== "Tomas Jocelyn-Holt Letelier"))

#Revision Presidenciales 2017
View(subset(Presidenciales, candidato== "Alejandro Navarro Brain"))
View(subset(Presidenciales, candidato== "Marco Enriquez-Ominami Gumucio")) 
View(subset(Presidenciales, candidato== "Carolina Goic Boroevic"))
View(subset(Presidenciales, candidato== "Sebastian Pinera Echenique"))
View(subset(Presidenciales, candidato== "Alejandro Guillier Alvarez"))
View(subset(Presidenciales, candidato== "Beatriz Sanchez Munoz"))   
View(subset(Presidenciales, candidato== "Jose Antonio Kast Rist"))
View(subset(Presidenciales, candidato== "Eduardo Artes Brichetti"))

###Export CSV###

write.csv2(x=Presidenciales, file="ETLpolitics.csv")
