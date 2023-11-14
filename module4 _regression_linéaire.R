# Module 4 REGRESSION LINEAIRE~
# RL SIMPLE
rm(list = ls())
Advertising <- read.csv("D:/UTT/PROGRAMATION R/Data/Advertising.csv", row.names=1)
summary(Advertising)
str(Advertising)

pairs(Advertising) # voir les corrélationrelation
#correler = les deux variable se comporte de la même maniere. quand un est grand l'autre aussi

cor(Advertising) # plus la valeur tant vers 1 plus les deux variable sont corrélés 
r1 = lm(Advertising$Sales ~ Advertising$TV )  # "~" veux dire en fction de
r2 = lm(Sales ~ TV, data= Advertising)

Advertising = Advertising %>% mutate(newSale=Sales*1000)
r1 = lm(Advertising$newSales ~ Advertising$TV ) 
summary(r1)

#plus la p-value est petite plus petite plus il ya des chance ques les deux varaiable soit lié
#si pvalu <0.1 on dit que la pvalue est significatif a 10%, si <0.01 , on dit 100%---0,001

plot(Advertising$Sales ~ Advertising$TV)
abline(r1,col="navy",lwd=5)
ggplot(Advertising)+aes(x=TV,y=Sales)+geom_point()+ geom_smooth(method = "lm") + theme_minimal()


#REGRESTION MULTIPLE
r1_mult = lm(Sales~TV +Radio + Newspaper, data = Advertising)
summary(r1_mult)

#r-squared = variaance estimé de y chapeau / variance de y
#si = 1 => y = ^y => qu'on fait une bonne prdiction. plus y^2 => 1 plus c'est on predire


#REGRESSION LOGISTIC
rm(list = ls())
Souscription <- read.csv("D:/UTT/PROGRAMATION R/Data/Souscription.csv", header=FALSE, sep=";")
str(Souscription)
Souscription=Souscription %>% mutate(y=case_when(y=="no"~0,
                                                 y=="yes"~1,
                                                 TRUE ~ 2))
table(Souscription$y)
logit_complet = glm(y~., data = Souscription,family = binomial)
#regression logistic en fonction de toutes les variables
summary(logit_complet)

final_lm = step(logit_complet)
#transformation des variable carater en plusieur indicateur
#step()selectionne les variables importante. il par de tout puis faire selection en fesant les test
# test pour ne pas perdre trop d'information
# different de l'ACP car on pas de variabe y dans l'acp

logit_step = glm(y~ contact + month + duration + campaign + poutcome + emp.var.rate + 
                   cons.price.idx + cons.conf.idx, data= Souscription, family = binomial)
summary(logit_step)

prev= predict(logit_step, type = "response")
prev = as.numeric(prev > 0.5)
table(prev,Souscription$y) # nous donne combien a été bien predir et mal prédit 


#ARBRE DE DECISION
rm(list = ls())
Souscription <- read.csv("D:/UTT/PROGRAMATION R/Data/Souscription.csv", encoding="UTF-8", sep=";")
library(rpart)
arbre<-rpart(y ~., data = Souscription ,cp =0.02)
arbre