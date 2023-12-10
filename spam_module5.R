rm(list = ls())
# jeu de données dans kernlab
library(kernlab)
data("spam")

#separation apprentissage validation
set.seed(1234)
spam1=spam[sample(nrow(spam)),] # melange de ligne
app=spam1[1:3000,]
valid=spam1[-(1:3000),]

#application du KNN
library(class)
knnspam=knn(app[,-58],valid[,-58],cl=app$type,k=3)
mean(knnspam !=valid$type)

#choix automatique de k entre 1 et 50

grille_k = data.frame(k=seq(1,50, by=1))
grille_k

install.packages("caret")
library(caret)
ctrl1 = trainControl(method = "LGOCV",index = list(1:3000)) # method="cv" pour validation croisé
# Methode leave -group -out cross - validation
sel_k1 = train(type ~ ., data = spam1, method = "knn", trControl = ctrl1, tuneGrid = grille_k)

sel_k1$bestTune
plot(sel_k1)

#Dans ce contexte, la valeur de k qui donne la meilleure précision est k=1, 
#avec une accuracy de 80.76% et un coefficient kappa de 0.60.
