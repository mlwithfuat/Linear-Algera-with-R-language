#MAtrislerde uzakl??k ve benzerlik
#Eucledian 
#manhattan
#jaccard
#??ebi??ef
#hamming
#minkowski
#kosin??s
A=matrix(c(1,1,2,1,1,2,1,0.8,1),3, byrow = T)
dist(A)
sqrt((1-1)**2+(0.8-1.0)**2+(1-2)**2)
t(A)
dist(t(A))
library(proxy)
simil(A)#similarity on A matrix
set.seed(1234)
x<-matrix(rnorm(25),nrow = 5)
x
dist(x)
