setwd("D:/UTT/PROGRAMATION R")
rm(list=ls())
options(digits = 7)
#CHARGEMENT DE DONNEES
pisa_us = read.table("Data/pisaUS.csv", header = TRUE, sep=";",dec=",", na=" ") #pisa permet de tester les connaisance des etudiant au meme age selon le pays
# le paramettre na pour dire que ceci " " represente une donner na

class(pisa_us)
str(pisa_us)
summary(pisa_us)
summary(pisa_us$MATH)

pisa_us$MATH <- as.character(pisa_us$MATH)
summary(pisa_us$MATH)

pisa_us[2,4]

pisa_us[2,4] = 100
pisa_us[2,4]

pisa_us[,4]=100

#suppression de ligne

pisa_us= pisa_us[-2,]
pisa_us=pisa_us[,-6]

pisa_us$READ = NULL

pisa_us<- pisa_us$MATH>600

#repart a 0

pisa_us = read.table("Data/pisaUS.csv", header = TRUE, sep=";",dec=",", na=" ")

twocol = data.frame(matrix(0,4838,2))
names(twocol)= c("col_1","col_2")
rescol = cbind(pisa_us,twocol)

towline<- data.frame(matrix(0,2,11))
names(towline)<-names(pisa_us)
