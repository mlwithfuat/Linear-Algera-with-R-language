#Matrixlerin ??arpanlar??na ayr??lmas??
library(softImpute)
set.seed(101)
n=10 # number of rows
p=5 # number of columns
j=3 
np=n*p
missfrac=0.3 # percantage of missing datas
x= matrix(rnorm(n*j),n,j)%*%matrix(rnorm(j*p),j,p)+matrix(rnorm(np),n,p)/3
x
ix=seq(np)
ix
imiss=sample(ix,np*missfrac,replace = FALSE)
imiss
xna=x
xna[imiss]=NA
xna
fit1=softImpute(xna,rank=4, lambda = 30)#creating 15 values with softImpute
fit1

#simple reccomandation system with R
library(devtools)
install_github("mhahsler/recommenderlab")
library("recommenderlab")
data("MovieLense")
MovieLense100 <- MovieLense[rowCounts(MovieLense)>100,]
MovieLense100
train<- MovieLense100[1:50]
rec<- Recommender(train, method="UBCF")
rec
pre<- predict(rec, MovieLense100[101:102])
pre
as(pre,"list")
