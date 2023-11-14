12+35
12*45
13*45 # JUSTE UN COMMENTAIRE
pi * sqrt(16)+exp(2)
100*pi
help(pi) 
?pi
a<- 6
c = 6
6->d
e = d+4
help(mean) 
ls() # liste des variables
rm(d)
ls()
rm(list = ls()) # supprime la liste des variable
ls()
# LES TYPES D'OBJET
charc = "hello"
class(charc) # voir le type d'un objet
charc2 <- ""
class(charc2)
test = 9
class(test)
test2 = as.numeric(test) # converversion en numerique
test2
test3 = as.character(test) #conversion en caracter
test3 

#LES BOOLEEN
boolean = TRUE
boolean2 <- test!=9
boolean3 = test >9
boolean4 <- as.logical(0) #coversionn en booléen 
booolean5 = as.logical(1)

vec1 = c(3,6,4,5,7) # commande c pour creer des vecteurs
vec1[1]  # r commance a compter a partir de 1

x1 = 1:10
x2 = seq(2,10)
x3 = seq(2,10, by=2)

vec6 = runif(10,4,6) #nombre aléatoir en 4 et 6
vec6 # on a que les float
vec7 = round(vec6,0)
vec

vec2 = c(TRUE,FALSE,TRUE)
vec8 =c(vec1,vec7) # concatene ke
x3 = c("heloe", "hello")
vec9 = rep(vec1, each=2)
vec1
vec9
vec10 = vec1 + vec1
vec10
testvec = 1:4
newvec = testvec*3
newvec
newvec[c(1,3)]
newvec[1:3]
testvec
testvec[3] = 99
testvec
testvec[testvec>8]<-3
testvec
sex_vector = c("h","f","f","h","non-binaire")
factor_sex_vector = factor(sex_vector)
factor_sex_vector
levels(factor_sex_vector)

temperatur_vec = c("hight","low","hight","low","medium")
factor_temperature = factor(temperatur_vec,order=TRUE)
factor_temperature

x = 1:12

dim(x) = c(3,4)
dim(x)
xy = matrix(1:12, nrow=3, byrow=FALSE)
xy
vecteur = 1:7

#DATAFRAME
newdf = data.frame(prenom=c("fabien","thoma","marie"),age = c(29,50,45),sport=c("football","badminton","badminton"))
newdf
newdf$prenom
newdf$age
newdf$age[2]
objet = newdf$age
objet

#LES FONCTIONS
x <- 1:10
min(x)
var(x)# variance
summary(x)
summary(newdf)

#DECLARATION DE FONCTION 
carre = function(x){
  x^2+12
}
carre(4)

#CONDITION
if(2+2==4){
  print("hello")
}

if(2+2==5){
  print("hello")
}else{
  print("goodbye")
  }

# Boucle 
for (i in 1:5) {
  print(i)
}

i=1
while (i<6) {
  print(i)
  i=i+1
}

#COMPARAISON for et vectorisation

a=0
system.time(for(i in 1:10^8){a=a+1})
rep(1,8)
system.time(sum(rep(1,10^8)))

#librairie / packages
install.packages("tidyverse")
library(tidyverse)

pi
options(digits = 19)
pi
# RMarkdow
