rm(list = ls())
# jeu de données dans kernlab
library(kernlab)
data("spam")
set.seed(1234)
perm=sample(4601,3000)
perm
app=spam[perm,]
valid=spam[-perm,]
install.packages("randomForest")
library(randomForest)
set.seed(1234)
foret = randomForest(type~., data=app)
foret
plot(foret)
grille_mtry = data.frame(mtry=seq(1,30, by=1))
library(caret)
ctrlForet = trainControl(method = "oob",index = list(1:3000)) # method="oob"out of bag
sel_mtry = train(type ~ ., data = spam, method = "rf", trControl = ctrlForet, tuneGrid = grille_mtry)
sel_mtry
plot(sel_mtry)

foret_optimale <- randomForest(type ~ ., data = app, mtry = 6)
pred <- predict(foret_optimale, data = valid)
table(foret)
mean(pred==spam$type)