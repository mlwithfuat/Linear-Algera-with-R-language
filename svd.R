#SVD
A<- as.matrix(data.frame(c(1,3,4,5,0,0,0),
                         c(1,3,4,5,2,0,1),
                         c(1,3,4,5,0,0,0),
                         c(0,0,0,0,4,5,2),
                         c(0,0,0,0,4,5,2)))
A
A.svd<-svd(A)
A.svd
library(pracma)
M<- matrix(1:12,3,4)
rank(M)
orth(M)
