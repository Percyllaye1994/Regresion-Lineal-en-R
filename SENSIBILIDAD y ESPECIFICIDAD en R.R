
#creacion de la tabla
tabla1=array(c(86,14,20,380),dim=c(2,2))
#nombrar las columas y filas
colnames(tabla1)=c("HIV+","HIV-")
rownames(tabla1)=c("T+","T-")
#mostrar la tabla
tabla1

install.packages("pander")
#cambiar aspecto de la tabla
library(pander)
pander(tabla1)

#calculamos las proporciones por columnas:
pc <- prop.table(tabla1,2)
pander(round(pc,2)) # Redondeamos a dos dígitos decimales

#calculamos las proporciones por filas:
pf <- prop.table(tabla1,1)
pander(round(pf,4)) # Redondeamos a dos dígitos decimales

#odds ratio 
install.packages("epiR")
library(epiR)
epi.2by2(tabla1)

install.packages("bdpv")

library(bdpv) 
preval.Diab <- prop.table(tabla1)[1] 
class(tabla1) <- "matrix" 
BDtest(tabla1, pr=preval.Diab, conf.level = 0.95)

#############

library(bdpv) 
  preval <- prop.table(tabla1)[1]
 
  BDtest(tabla1, pr=preval , conf.level = 0.95)

  
######
  tabla2=array(c(796000,4000,10000,1990000),dim=c(2,2))
  tabla2

  preval2 <- prop.table(tabla2)[1]
  
  BDtest(tabla2, pr=preval2 , conf.level = 0.95)


