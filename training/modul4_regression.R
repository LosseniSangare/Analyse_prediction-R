rm(list=ls())
setwd("D:/UTT/PROGRAMATION R/Data")
df= read.csv("D:/UTT/PROGRAMATION R/Data/Advertising.csv")
summary(df)
pairs(df)
cor(df)

#regression lineaire simple Y= β0 + β1X1

rl = lm(df$Sales ~ df$TV)
summary(rl)
plot(df$Sales ~ df$TV)
abline(rl, col="red", lwd=4)
library(ggplot2)
ggplot(df) + aes(x=TV,y=Sales)+geom_point()+geom_smooth(method = "lm")+theme_light()

sales_pred <- predict(rl)
ggplot(df)+aes(x=TV,y=Sales) +geom_point()+geom_line(aes(y=sales_pred), color="red",lwd=1.5)+theme_minimal()

# regression multiple : Y = β0 + β1X1 + β2X2 + β3X3 + ε
rlm =lm(df$Sales~df$TV + df$Newspaper +df$Radio)
summary(rlm)

rm_new = lm(df$Sales~df$Newspaper)
summary(rm_new)

rl_tot <-lm(df$Sales ~ df$Newspaper + df$TV + df$Radio)
summary(rl_tot)
sales_pred_mult = predict(rlm)
head(df$Sales)
head(sales_pred)
head(sales_pred_mult)

#ici la courbe n'esst pas linéaire car plusieurs variables
ggplot(df)+aes(x=TV,y=Sales) +geom_point()+geom_line(aes(y=sales_pred_mult))+theme_minimal() 

