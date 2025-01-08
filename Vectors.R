#Vectors in R
library(matlib)
D = matrix(c(3,2,1,7,-4,-2),nrow=1)
D
dim(D)
#Column Vectors
E = matrix(c(3,2,1,7,-4,-2))
E
dim(E)
#add/sub and scaler multiply
# u= (u1,u2,u3,....,un) and
# v = (v1,v2,v3,...,vn) they are Two Vector in R^n
#u+v = (u1+v1,u2+v2,u3+v3,...,un+vn)
#u-v = (u1-v1,u2-v2,u3-v3,...,un-vn)
# if k is a real number
#ku = (ku1,ku2,ku3,...,kun)
U = matrix(c(3,2,1,7,-4,-2),nrow = 1)
V = matrix(c(9,3,9,2,3,4), nrow=1)
U+V
U-V
3*U

# diff 2 vector's dot product
# u= (u1,u2,u3,....,un) and
# v = (v1,v2,v3,...,vn) they are Two Vector in R^n
# u.v =<u,v>=u1.v1+u2.v2+u3.v3+...+un.vn
# if u.v = 0 vectors call as orthogonal
U*V
# Cross Product
F = 1:5
F
G = 11:15
G
t(F)%*%(G)
(F)%*%t(G)
#Norm of the vector
library(pracma)
Norm(c(3,4))
Norm(c(3,4),p=2)
Norm(c(1,1,1))
# Frobenius norm
Z = matrix(data = 1:25, nrow = 5)
frobeinusNorm<-function(Z) {
  (sum((as.numeric(Z))**2))**(1/2)
}
frobeinusNorm(Z)
# Distance between 2 vector
xnew<- as.matrix(iris[1,1:4])
xnew
ynew<- as.matrix( iris[2,1:4])
ynew
a=rbind(xnew, ynew)
dist(a)
sqrt(sum((4.9-5.1)**2+(3-3.5)**2+(1.4-1.4)**2+(0.2-0.2)**2))
# angle between 2 vector
# Function to calculate the angle between two vectors in degrees
calculate_angle <- function(vec1, vec2) {
  # Compute dot product
  dot_product <- sum(vec1 * vec2)
  
  # Compute magnitudes
  mag_vec1 <- sqrt(sum(vec1^2))
  mag_vec2 <- sqrt(sum(vec2^2))
  
  # Compute cosine of the angle
  cos_theta <- dot_product / (mag_vec1 * mag_vec2)
  
  # Calculate the angle in radians, then convert to degrees
  angle_radians <- acos(cos_theta)
  angle_degrees <- angle_radians * (180 / pi)
  
  return(angle_degrees)
}

# Define two vectors
matA <- c(3, 1)
matB <- c(5, 5)

# Call the function
result <- calculate_angle(matA, matB)
print(result)
