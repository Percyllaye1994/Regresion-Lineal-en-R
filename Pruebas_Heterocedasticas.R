#se utilizara el siguiente comando para traer la base de datos 
#Un distribuidor de bebidas est� analizando el sistema de entregas de su
#producto; en particular, est� interesado en predecir el tiempo sugerido para servir
#a los detallistas. El ingeniero industrial a cargo del estudio ha sugerido que los
#factores que influyen sobre el tiempo de entrega son el n�mero de cajas de
#bebidas y la m�xima distancia que debe viajar el despachador.


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
distribuci�n<-read_excel(ruta_excel)

#estadisticas basicas
summary(distribuci�n)

#para estimar los coeficientes del modelo de regresi�n lineal m�ltiple 
modelo <- lm(Tiempo ~ Cajas + Distancia,data=distribuci�n)

#coeficientes
modelo

##con este comando podemos obtener los rango m�ximos y minimo, as� como la media, los estimadores, error est�ndar
summary(modelo)

##para obtener la matriz de covarianzas se aplica el siguiente comando
vcov(modelo)

###para desarrollar, mejor el an�lisis utilizares la tabla ANOVA
anova(modelo)

### Para obtener el vector de residuos utilizamos el siguiente comando,
##  nos sirven para revisar las propiedades de los errores
residuales<-modelo$residuals
plot(residuales)

#Obtener los residuales est�ndares del modelo ajustado
rstint<-rstandard(modelo)
plot(rstint)

##Vamos a realizar una grafica 
win.graph()
par(mfrow=c(1,3))

#para poder observar los gr�ficos 
hist(rstint)
boxplot(rstint)
qqnorm(rstint)


#install.packages("zoo")
library(lmtest)

#En las prueba mostradas a continuaci�n se estudian las siguientes hip�tesis.

#H0: los errores tienen varianza constante.<- homocedasticos 
#H1: los errores no tienen varianza constante <- heterocedasticos

#para detectar la heterocedasticidad dentro del modelo aplicamos la prueba Breusch-Pagan
bptest(modelo)

#De la salida anterior se observa que el valor-P es mayor
#que el nivel de significancia usual de 5%, por lo tanto, 
#hay evidencias para decir que se cumple la homocedasticidad
#Cuando la probabilidad de cometer el Error Tipo I, es muy alta no se puede
#rechazar la hip�tesis nula, entonces, la varianza de los errores aleatorios es
#constante, por lo tanto, homoced�sticos.

##vamos a aplicar una prueba de nombre White, 
#esto con el fin de devolver las matrices de 
#covarianza corregidas para hacer las inferencias
library(car)
hccm(modelo)




