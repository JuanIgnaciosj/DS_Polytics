par(mfrow =c (1,2))
boxplot(ETLpolitics_1_$votos_candidato, main="Votos totales", 
        xlab="", ylab="cantidad")
hist(ETLpolitics_1_$votos_candidato, main="Histograma de cantidad de votos", 
     xlab="Cantidad de votos", ylab="Frecuencia")
summary(ETLpolitics_1_, ETLpolitics_1_$year ==2013)

#análisis por años de elección
par(mfrow =c (2,2))
newdata <- subset(ETLpolitics_1_, year == 2013 )
summary(newdata$votos_candidato)
var(newdata$votos_candidato)
sd(newdata$votos_candidato)
boxplot(newdata$votos_candidato, main="Votos 2013", 
        xlab="", ylab="cantidad")
hist(newdata$votos_candidato, main="votos 2013", 
     xlab="Cantidad de votos", ylab="Frecuencia")

newdata2 <- subset(ETLpolitics_1_, year == 2017 )
summary(newdata2$votos_candidato)
var(newdata2$votos_candidato)
sd(newdata2$votos_candidato)
boxplot(newdata2$votos_candidato, main="Votos 2017", 
        xlab="", ylab="cantidad")
hist(newdata2$votos_candidato, main="votos 2017", 
     xlab="Cantidad de votos", ylab="Frecuencia")

#análisis por año de elección y consideración de primera y segunda vuelta
par(mfrow= c(2,4))
newdata3 <- subset(ETLpolitics_1_, year == 2013 & election_id == 1 )
summary(newdata3$votos_candidato)
var(newdata3$votos_candidato)
sd(newdata3$votos_candidato)
boxplot(newdata3$votos_candidato, main="Votos 2013 1ra vuelta", 
        xlab="", ylab="cantidad")
hist(newdata3$votos_candidato, main="votos 2013 1ra vuelta", 
     xlab="Cantidad de votos", ylab="Frecuencia")

newdata4 <- subset(ETLpolitics_1_, year == 2013 & election_id == 2 )
summary(newdata4$votos_candidato)
var(newdata4$votos_candidato)
sd(newdata4$votos_candidato)
boxplot(newdata4$votos_candidato, main="Votos 2013 2da vuelta", 
        xlab="", ylab="cantidad")
hist(newdata4$votos_candidato, main="votos 2013 2da vuelta", 
     xlab="Cantidad de votos", ylab="Frecuencia")

newdata5 <- subset(ETLpolitics_1_, year == 2017 & election_id == 1 )
summary(newdata5$votos_candidato)
var(newdata5$votos_candidato)
sd(newdata5$votos_candidato)
boxplot(newdata5$votos_candidato, main="Votos 2017 1ra vuelta ", 
        xlab="", ylab="cantidad")
hist(newdata5$votos_candidato, main="votos 2017 1ra vuelta", 
     xlab="Cantidad de votos", ylab="Frecuencia")

newdata6 <- subset(ETLpolitics_1_, year == 2017 & election_id == 2 )
summary(newdata6$votos_candidato)
var(newdata6$votos_candidato)
sd(newdata6$votos_candidato)
boxplot(newdata6$votos_candidato, main="Votos 2017 2da vuelta", 
        xlab="", ylab="cantidad")
hist(newdata6$votos_candidato, main="votos 2017 2da vuelta", 
     xlab="Cantidad de votos", ylab="Frecuencia")

