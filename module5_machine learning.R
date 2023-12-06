rm(list = ls())
library(dplyr)
library(ggplot2)
library(esquisse)
install.packages("kernlab")
library(kernlab) # package contenant les dataset de spams
data(spam)
set.seed(1234)
test= runif(5,0,1) #génère un vecteur de 5 nombres pseudo-aléatoires tirés d'une distribution uniforme sur l'intervalle [0, 1].
spam1 = spam[sample(nrow(spam)),]




#principe de la 
#kapa met plus de precision sur la  prediction


#foret aleatoie
# aleatoire car a chaque etape on selection aleatoirement un nombre de variable.
#aussi les ob