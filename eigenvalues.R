#Eigenvalues and Eigenvectors
A <- as.matrix(data.frame(c(1,-1,0),c(1,2,1),c(-2,1,-1)))
e <- eigen(A)
e$values
e$vectors
#PCA
library(tidyverse)
library(gridExtra)
data("USArrests")
head(USArrests, 10)
apply(USArrests,2, var)
scaled_df<- apply(USArrests,2,scale)
head(scaled_df)
arrests.cov<- cov(scaled_df)
arrests.eigen <- eigen(arrests.cov)
str(arrests.eigen)
(phi <- arrests.eigen$vectors[,1:2])
phi<- -phi
row.names(phi)<- c("Murder","Assault","UrbanPop","Rape")
colnames(phi)<- c("PC1","PC2")
phi
PC1 <- as.matrix(scaled_df)%*%phi[,1]
PC2<- as.matrix(scaled_df)%*%phi[,2]
PC<- data.frame(State = row.names(USArrests),PC1,PC2)
head(PC)
ggplot(PC,aes(PC1,PC2))+
  modelr::geom_ref_line(h=0)+
  modelr::geom_ref_line(v=0)+
  geom_text(aes(label = State),size=3)+
  xlab("First Principal Component")+
  ylab("Second PC")+
  ggtitle("First two PC of USArrsts data")
PVE<- arrests.eigen$values/sum(arrests.eigen$values)  
round(PVE,2)
PVEplot<- qplot(c(1:4),PVE)+
  geom_line()+
  xlab("Principal Component")+
  ylab("PVE")+
  ggtitle("Scree Plot")+
  ylim(0,1)
cumPVE <- qplot(c(1:4),cumsum(PVE))+
  geom_line()+
  xlab("Principal Component")+
  ylab(NULL)+
  ggtitle("Cumulative Scree Plot")+
  ylim(0,1)
grid.arrange(PVEplot,cumPVE, ncol=2)
pca_result <- prcomp(USArrests, scale. = T)
names(pca_result)
pca_result$center
pca_result$scale
pca_result$rotation
pca_result$rotation <- -pca_result$rotation
pca_result$rotation
pca_result$x <-- pca_result$x
head(pca_result$x)
biplot(pca_result, scale = 0)
