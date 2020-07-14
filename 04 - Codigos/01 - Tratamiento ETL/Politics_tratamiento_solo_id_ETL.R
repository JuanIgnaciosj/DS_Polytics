#generacion de ETL solo con id
#los candidatos, las comunas, y las regiones, se van a manejar solo con id


getwd()
setwd("C:/Users/Andres64/Documents/R/andresDataScience/datawarehouse")

###Data Read###
datos2013vuelta1 <-read.csv2("Presidenciales1-2013.csv",sep=",",header=TRUE, dec=",")
datos2013vuelta2 <-read.csv2("Presidenciales2-2013.csv",sep=",",header=TRUE, dec=",")
datos2017vuelta1<-read.csv2("Presidenciales1-2017.csv",sep=",",header=TRUE, dec=",")
datos2017vuelta2<-read.csv2("Presidenciales2-2017.csv",sep=",",header=TRUE, dec=",")

#Corrobora la correcta carga de los datos
View(datos2013vuelta1)
View(datos2013vuelta2)
View(datos2017vuelta1)
View(datos2017vuelta2)

###Join Table###
Presidenciales = rbind(datos2013vuelta1, datos2013vuelta2)
Presidenciales = rbind(Presidenciales, datos2017vuelta1)
Presidenciales = rbind(Presidenciales, datos2017vuelta2)

#Corrobora la correcta carga de los datos
View(Presidenciales)


###Delete partido_id###
Presidenciales <- subset(Presidenciales, select = -partido_id )
View(Presidenciales)


####Add id_region###### 

#cargo archivo Regiones-Comunas.csv
regiones<-read.csv2("Regiones-Comunas.csv",sep=",",header=TRUE, dec=",")

#corrobora la correcta generacion del DataFrame regiones
View(regiones)

#uno las comunas de la region  con la funcion merge a traves del identificador clave: comuna_datachile_id
Presidenciales = merge(Presidenciales,regiones)

#corrobora la correcta generacion del DataFrame Presidenciales
View(Presidenciales)

###Clean table###
Presidenciales <- subset( Presidenciales, select = -comuna_customs_id )

Presidenciales <- subset( Presidenciales, select = -comuna_tax_office_id )

Presidenciales <- subset( Presidenciales, select = -region_name )

Presidenciales <- subset( Presidenciales, select = -comuna_name )

#corrobora la correcta generacion del DataFrame Presidenciales
View(Presidenciales)

###Export CSV###

write.csv2(x=Presidenciales, file="ETLpolitics_solo_id.csv")
