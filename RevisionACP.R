# revision ACP
rm(list = ls())
fromage <- read.table("D:/UTT/PROGRAMATION R/Data/fromage.csv",header = TRUE,sep = ",", row.names=1)
summary(fromage)
str(fromage)
df2 = head(fromage)

#centrage reduction
fromage_cr = scale(fromage,center = T,scale = T)
head(fromage_cr)
res_acp = prcomp(fromage_cr)
res_acp
res_acp$rotation
res_acp$x
fviz_eig(res_acp,title="Histograme des valeurs propres") # visualiser les valeurs propres résultant de l'Analyse en Composantes Principales (ACP).
res_acp$sdev
# Critère de Kaiser : Certains praticiens utilisent la règle de Kaiser, 
# qui suggère de conserver les composantes avec des valeurs propres supérieures à 1.
#-------------------------selon le cours--------------------------------------------
#On voit que la première composante explique 55% de la variance et la deuxième 20%. On peut
#à présent représenter le nuage des individus sur le plan Axe1-Axe2.

#nuage des points
fviz_pca_ind(res_acp, col.ind = "cos2",gradient.cols = c("lightblue1","gold","red"),repel = TRUE) 
#gradient.cols = c("lightblue1","gold","red") : Cela définit une palette de couleurs pour 
#le gradient utilisé pour colorer les points en fonction des cos2. Dans cet exemple, les couleurs iront d'un bleu clair ("lightblue1") à l'or ("gold") et au rouge ("red").
 
fviz_pca_var(res_acp,col.var = "contrib",gradient.cols = c("lightblue1","gold","red"),repel = TRUE)
             