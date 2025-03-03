# add, sub and scaler multiply

A = matrix(c(-2,5,4,6,
             -5,-2,4,5,
             9,5,7,8,
             3,6,2,1),ncol = 4, byrow = TRUE)# creating 4x4 matrix
print(A)

B = matrix(c(-6,4,6,7,
             3,7,2,1,
             -2,5,6,7,
             1,3,-4,5),ncol = 4, byrow = TRUE)# same size B matrix
summaryAdd <- A+B
print(summaryAdd)
summarySub <- A-B
print(summarySub)
scalerMul <- 3*A
print(scalerMul)


# Multiply in Matrixes
#Dot product
A
mulDot <- A*B
print(mulDot)

#Cross Product Multiply

crossProdA <- A%*%B
print(crossProdA)
crossProdB <- B%*%A
print(crossProdB)

C = matrix(c(3,-2,-1,4),ncol=2, byrow=TRUE)
D= matrix(c(1,1), ncol=1)
C%*%D
#DETERMINANT
det(A)
det(B)
library(matlib)
M<- matrix(c(4,-12,-4,
             2,1,3,
             -1,-3,2),3,3, byrow = TRUE)
cofactor(M,1,1)
cofactor(M,1,2)
cofactor(M,1,3)
cofactor(M,2,3)
#Cofactors of M matrix
#Singular Matrix
library(matrixcalc)
P <- diag(1,4)
det(P)
is.singular.matrix(P)
O <- matrix(c(0,0,3,4), nrow=2, byrow = TRUE)
det(O)
is.singular.matrix(O)
# not singular matrix,
# Row Echelon Form
library(pracma)
(A<- matrix(c(1,2,3,4,
             -1,0,1,3,
             0,1,-2,1,
             5,4,-2,-3),nrow= 4, byrow= T))
rref(A)
#MATRIX INVERSION
B<- matrix(c(-1,2,5,6),nrow=2, byrow= T)
B
matrix.inverse(B)
Ginv(B)
A<- matrix.inverse(B)
A%*%B

#Gaussian
A<- matrix(c(2,1,-1,
             -3,-1,2,
             -2,1,2),3,3, byrow = T)
A
b<- c(8,-11,-3)# vector
b
gaussianElimination(A,b)
gaussianElimination(A,b, verbose = TRUE, fractions = TRUE)
# RAnk of matrix
A<- matrix(c(1,2,3,0,2,2,1,4,5),3,byrow = T)
matrix.rank(A)


# KERNEL OF THE MATRIX
library(kernlab)
data(spam)
dt <- as.matrix(spam[c(10:20,3000:3010),-58])
rbf <- rbfdot(sigma = 0.05)
rbf
head(kernelMatrix(rbf,dt))
library(magick)
kern <- matrix(0, ncol= 3, nrow = 3)
kern[1,2] <- 0.25
kern[2, c(1,3)] <- 0.25
kern[3,2] <- 0.25
kern
img <- image_read('logo:')
img_blurred <- image_convolve(img,kern)
image_append(c(img, img_blurred))
