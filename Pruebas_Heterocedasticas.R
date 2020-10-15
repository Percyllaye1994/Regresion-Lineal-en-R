#se utilizara el siguiente comando para traer la base de datos 
#Un distribuidor de bebidas está analizando el sistema de entregas de su
#producto; en particular, está interesado en predecir el tiempo sugerido para servir
#a los detallistas. El ingeniero industrial a cargo del estudio ha sugerido que los
#factores que influyen sobre el tiempo de entrega son el número de cajas de
#bebidas y la máxima distancia que debe viajar el despachador.


#cargamos libreria para leer archivos excel
library(readxl)

#ejecutamos para abrir la ventana de windows
#seleccionamos la ruta del archivo excel
file.choose()

#traemos la direccion de la BD y la asignamos a ruta_excel
ruta_excel<-"E:\\IX Ciclo\\Econometria\\Heterocestasticidad\\NumCajas.xlsx"

#verificamos el nombre del archivo excel
excel_sheets(ruta_excel)

#asignamos la BD a distribucion
distribución<-read_excel(ruta_excel)

#estadisticas basicas
summary(distribución)

#para estimar los coeficientes del modelo de regresión lineal múltiple 
modelo <- lm(Tiempo ~ Cajas + Distancia,data=distribución)

#coeficientes
modelo

##con este comando podemos obtener los rango máximos y minimo, así como la media, los estimadores, error estándar
summary(modelo)

##para obtener la matriz de covarianzas se aplica el siguiente comando
vcov(modelo)

###para desarrollar, mejor el análisis utilizares la tabla ANOVA
anova(modelo)

### Para obtener el vector de residuos utilizamos el siguiente comando,
##  nos sirven para revisar las propiedades de los errores
residuales<-modelo$residuals
plot(residuales)

#Obtener los residuales estándares del modelo ajustado
rstint<-rstandard(modelo)
plot(rstint)

##Vamos a realizar una grafica 
win.graph()
par(mfrow=c(1,3))

#para poder observar los gráficos 
hist(rstint)
boxplot(rstint)
qqnorm(rstint)


#install.packages("zoo")
library(lmtest)

#En las prueba mostradas a continuación se estudian las siguientes hipótesis.

#H0: los errores tienen varianza constante.<- homocedasticos 
#H1: los errores no tienen varianza constante <- heterocedasticos

#para detectar la heterocedasticidad dentro del modelo aplicamos la prueba Breusch-Pagan
bptest(modelo)

#De la salida anterior se observa que el valor-P es mayor
#que el nivel de significancia usual de 5%, por lo tanto, 
#hay evidencias para decir que se cumple la homocedasticidad
#Cuando la probabilidad de cometer el Error Tipo I, es muy alta no se puede
#rechazar la hipótesis nula, entonces, la varianza de los errores aleatorios es
#constante, por lo tanto, homocedásticos.

##vamos a aplicar una prueba de nombre White, 
#esto con el fin de devolver las matrices de 
#covarianza corregidas para hacer las inferencias
library(car)
hccm(modelo)




