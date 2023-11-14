#MODULE 3 REDUCTION DE DIMENSION ACP ET CLUSTERING

# reduire tout en gardant le caractistique qui rendent compte de la difference de nos individu
#si on arrive a reduire le nombre de dim on va gagner du temps dans notre travail.


rm(list = ls())

fromage = read.csv("D:/UTT/PROGRAMATION R/Data/fromage.csv", row.names=1)
str(fromage)
summary(fromage)

#il faut centrer reduit nos données, les mettre de moyennes 0 de variance pour voir quels 
#sont les combinaore lineaire qui nous permetra de garder des variable

fromage_cr=scale(fromage, center = TRUE,scale = TRUE)
df_fromage_cr = data.frame(fromage_cr)
install.packages("factoextra")
library(factoextra)
res_pca<- prcomp(df_fromage_cr)
fviz_eig(res_pca) #histogram
#avec la visualisation on voir que la première dim esplique une bonne partie du jeu de donnée

fviz_pca_ind(res_pca,col.ind = "cos2",gradient.cols=c("lightblue1","gold","red"),repel=T)

#plus le cosinus(cos2) est elever plus les axe sont decorélé et plus les deux axe expliqiue les donnéées

fviz_pca_var(res_pca, col.var = "contrib", gradient.cols=c("lightblue1","gold","red"), repel=T )

#----------------------------METHODE DE KMEANS----------------------------------------#
#consiste a regrouper les idividu en recalculant les centres de gravité de chaque ensemble d'individu
# ça marche pour faire des classification. 
#On peut aussi proceder en rajoutant ou ajustant des clusters. 

#avec les fromage on va voir s'il y'a certains qui ont lieu d'etre ensembles.

groupes_kmeans = kmeans(fromage_cr,center = 4, nstart = 5) #nstart pour refaire le meme choix de centre de gravité au moins 4 fois
groupes_kmeans
groupes_kmeans$cluster[groupes_kmeans$cluster==1] # selection des fromage dont le cluster est 1 
groupes_kmeans$cluster[groupes_kmeans$cluster==2]
groupes_kmeans$cluster[groupes_kmeans$cluster==3]
groupes_kmeans$cluster[groupes_kmeans$cluster==4]

fviz_cluster(groupes_kmeans,data =fromage_cr, ellipse.type = "convex",repel=T, xlab="Axe 1", ylab="Axe 2") + theme_minimal()

inertie_vec = rep(0,10)

for (i in 1:10) {
  km=kmeans(fromage_cr,center=i,nstart =20)
  inertie_vec[i]<- km$tot.withinss
}

plot(1:10,inertie_vec,xlab = "nobre de cluster", type="b")


#CLASSIFICATION HIERACHIQUE

#Etape : rassemblement des données les plus proches. puis regrouper groupe par groupe jusqu'a 
# englobé toutes les donnée dans un seul globe
#on fait ensuite l'abre suivant l'ordre d'entourage
#important de savoir calculer entre deux indiv puis en deuc groupe

hc_ward = hclust(dist(fromage.cr),method = "ward.D2")
clusterCAH = cutree(hc_ward,4)
fviz_cluster(list(cluster = clusterCAH, data = fromage_cr), ellipse.type = "convex",
             xlab = "Axe 1", Ylab = "Axe 2")+ theme_minimal()