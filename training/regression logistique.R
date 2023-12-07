rm(list = ls())
souscr <- read.csv("D:/UTT/PROGRAMATION R/Data/Souscription.csv", header=TRUE,  sep=";")
str(souscr)
library(dplyr)
souscr = mutate(souscr,y=case_when(y=="no" ~ 0, TRUE ~ 1))
summary(souscr)
logit_complet <- glm(y~.,data = souscr, family=binomial)
summary(logit_complet)
final_lm = step(logit_complet)
logit_step = glm(y ~ contact + month + duration + campaign + poutcome + emp.var.rate + 
                   cons.price.idx + cons.conf.idx, data = souscr, family = binomial())

summary(logit_step)

prev = predict(logit_step, type = "response")
head(souscr$y)
head(prev)

prev = as.numeric(prev>0.5)
head(prev)
table(prev)
table(souscr$y)
mean(prev==souscr$y) # pas la moyenne mais le ppourcentage de bonne prédiction
table(prev,souscr$y) #  table de confusion
