#cargamos libreria para leer archivos excel
library(readxl)

#ejecutamos para abrir la ventana de windows
#seleccionamos la ruta del archivo excel
file.choose()

#traemos la direccion de la BD y la asignamos a ruta_excel2
ruta_excel2<-"E:\\IX Ciclo\\Econometria\\ANCOVA\\Data_limpia_ANCOVA.xlsx"

#verificamos el nombre del archivo excel
excel_sheets(ruta_excel2)

#asignamos la BD a salario_maestros
salario_maestros<-read_excel(ruta_excel2)

summary(salario_maestros)

#Representamos gr�ficamente nuestros datos:
win.graph()
par(mfrow=c(1,2))

boxplot(Salario ~ D2,
        data = salario_maestros, xlab="D2", ylab="Salario")

boxplot(Salario ~ D3,
        data = salario_maestros, xlab="D3", ylab="Salario")

#creamos nuestro modelo
modelo4 <- lm(Salario ~ D2 + D3 + Gastos,data=salario_maestros)
modelo4
summary(modelo4)


#ANCOVA
ancova<- aov(formula = Salario ~ D2 + D3 + Gastos, data = salario_maestros)
print(summary(ancova))

#Como los resultados indican conforme el gasto p�blico aumenta un d�lar, en
#promedio, el salario de los maestros de escuela p�blica se incrementa m�s o menos $2.34. Si
#controlamos el gasto en educaci�n, ahora se observa que el coeficiente de intercepto diferencial
#no es significativo para la regi�n Noreste y Norte-centro ni para el Sur.


#ANCOVA_interacciones
ancova_inter<- aov(formula = Salario ~ D2 * D3 * Gastos, data = salario_maestros)
print(summary(ancova_inter))
