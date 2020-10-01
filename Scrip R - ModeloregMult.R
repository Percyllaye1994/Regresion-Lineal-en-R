
View(ventas)
#asignamos el objeto con la funcion
modelo <- lm(formula = LVENTA ~ LINGR + LPR, data = ventas)

#intervalos para los coeficientes
#intercepto
confint(modelo,1,0.95)
#LINGR
confint(modelo,2,0.95)
#LPR
confint(modelo,3,0.95)

#Coeficientes
modelo

#resumen del modelo
summary(modelo)

plot(modelo)

require(lmtest)
dwtest(modelo)


car::vif(modelo)

anova(modelo)

