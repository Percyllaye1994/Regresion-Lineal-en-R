View(BD_practicaR)
head(BD_practicaR)
#Exploracion rapida 
summary(BD_practicaR)

#cambiamos nombre de varibles
names (BD_practicaR)
names (BD_practicaR) = c("PAIS","TC","CP","IPC")
names (BD_practicaR)

#crear histogramas 
hist(x = BD_practicaR$TC)
hist(x = BD_practicaR$CP)
hist(x = BD_practicaR$IPC)

#crear diagramas de dispersion
a<- plot(BD_practicaR$TC)
b<- plot(BD_practicaR$CP)
c<- plot(x = BD_practicaR$IPC, y = BD_practicaR$TC)




##A. Grafique y trace la línea de regresión 
#insertar linea
ggplot(data = BD_practicaR,
       mapping = aes(x = IPC,
                     y = CP
                  )) +
  geom_point() +
  geom_smooth(size = 1)

#insertar linea
ggplot(data = BD_practicaR,
       mapping = aes(x = IPC,
                     y = TC
       )) +
  geom_point() +
  geom_smooth(size = 1)



##diagramas de dispersion para IPC y TC
ggplot(BD_practicaR,aes(IPC,TC))+
  geom_point()

##crear diagramas de dispersion para IPC y CP
ggplot(BD_practicaR,aes(IPC,CP))+
  geom_point()


#B. Estimacion de los parametros
#asignamos el objeto con la funcion
modelo1 <- lm(formula = TC ~ IPC, data = BD_practicaR)
modelo1 
summary(modelo1)
# Estimacion de intercepto:  14.467297
# Estimacion del B1: 0.002219 

#asignamos el objeto con la funcion
modelo2 <- lm(formula = CP ~ IPC, data = BD_practicaR)
modelo2 
summary(modelo2)
# Estimacion de intercepto:  14.467297
# Estimacion del B1: 0.002219 






#c. Indique si el ingreso per cápita tiene relacion positiva o negativa con la demanda de CP
##Hay una relacion positiva entre el ingreso per capita y la demanda CP
ggplot(BD_practicaR,aes(IPC,CP))+
  geom_point()

#D. Que te indica tu valor hallado en el intercepto
# Estimacion de intercepto:  14.467297
# Me indica que el valor promedio de demanda de Telefonos celulares es 14 cuando el ingreso seria 0


#Cual es tu interpretacion del coeficiente de la pendiente
#Como es positiva a mas ingreso mayor demanda de Telefonos celulares

