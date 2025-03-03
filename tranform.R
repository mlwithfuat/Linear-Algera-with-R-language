# Do??rusal Matris D??n??????mleri

A<- matrix(c(-1,3,2,-2), ncol= 2, byrow = T)
B<-matrix(c(1,0,0,-1),ncol = 2,byrow=T)# x ekseninde yan??stmak i??in
#if B <- -1,0,0,1 y
#if B<- -1,0,0,-1 origin
#if B<- 1,0,0,1 y=x
#if B<- 0,-1,1,0 saat y??n??n??n tersine 90 derece d??nd??rmek
#if B<- 0,1,-1,0  saat y??n??n??n tersine 180 derece
#if B<- 0,1,-1,0 saat y??n??n??n tersine 270 derece
B%*%A
library(rgl)
xyz<- matrix(rnorm(30),ncol=3)
plot3d(xyz)
rotate3d(c(2,0,0),pi/4,0,1,0)#(2,0,0) dot 45 degree rotate
rotate3d(xyz, pi/4,0,1,0)#xyz matrix 45 degree rotate
scaleMatrix(xyz,3,2)
scale3d(xyz,3,4,1)
translate3d(xyz,5,2,4)
rotate3d(xyz, pi/4,0,1,0)