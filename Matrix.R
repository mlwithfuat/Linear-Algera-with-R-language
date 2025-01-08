# MATRIX
# Creating matrix with R
A= matrix(c(3,-2,4,-1,6,7,6,-4,2),ncol=3, byrow= T)
A
B = matrix(c(2,3,4,-2,1,5,-7,1,2),nrow=3)
B
# SQUARE MATRIX
ax = c(2,5,3,7,1,8,9,10,1,12,5,10,4,17,15,11)
A = matrix(ax, nrow=4, ncol=4)
A
diag(A)
tr(A)
# TRANSPOSE
A = matrix(c(-2,5,4,6,-5,-2,4,5,9,5,7,8,3,6,2,1), ncol=4, byrow= T)
A
t(A)
# TRANSPOSE without library
nrows <- nrow(A)
ncols <- ncol(A)

# Create an empty matrix for the transpose with reversed dimensions
transpose_A <- matrix(0, nrow = ncols, ncol = nrows)

# Manually transpose the matrix
for (i in 1:nrows) {
  for (j in 1:ncols) {
    transpose_A[j, i] <- A[i, j]
  }
}
transpose_A
# zero matrix
# matrix with full of zeros
#identity matrix
#An identity matrix is a square matrix in which all the elements of the principal diagonal
#are ones, and all other elements are zeros.
diag(3)
# Scaler Matrix
# A scalar matrix in English refers to a matrix where all the elements of the diagonal are the same scalar value, and all off-diagonal elements are zero. 
#It is a special case of a diagonal matrix
diag(10,3,4)
diag(3,4,4)
# Diagonal Matrix
#A diagonal matrix is a matrix in which the entries outside the main diagonal are all zero.
# In other words, a diagonal matrix has non-zero elements only on its main diagonal (from top left to bottom right), 
#and all other elements are zero
diag(c(3,-1,2))
#Lower Triangular MAtrix
(m2 <- matrix(1:25,5,5))
lower.tri(m2)
m2[lower.tri(m2)] <- NA
# Upper Triangle Matrix
(m2 <- matrix(1:25,5,5))
upper.tri(m2)
m2[upper.tri(m2)]<- NA
m2
#A Document-Term Matrix (DTM) is a mathematical representation of a collection of documents,
# where rows represent documents and columns represent terms (or words).
# The values in the matrix indicate the frequency (or other metrics) of each term in each document.
wordVC <- c("i like dogs","A cat chased the dog","The dog ate a bone", "Cats make fun pets")
library(tm)
corpus<-(VectorSource(wordVC))
corpus<-Corpus(corpus)
summary(corpus)
TDM <- TermDocumentMatrix(corpus)
inspect(TDM)
library(SnowballC)
corpus2 <- tm_map(corpus, stemDocument)
TDM2 <- TermDocumentMatrix(corpus2)
inspect(TDM2)
dtm = t(TDM2)
inspect(dtm)
library("wordcloud")
library("RColorBrewer")
filePath <- "https://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)
docs <-Corpus(VectorSource(text))
inspect(docs)
toSpace <- content_transformer(function(x,pattern) gsub(pattern,"",x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removePunctuation)               
docs <- tm_map(docs, stripWhitespace)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing = T)
d <- data.frame(word = names(v), freq = v)
head (d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
# ADJACENCY MATRIX
library(igraph)
A<- matrix(
  c(0,1,0,0,1,0,
    1,0,1,0,1,0,
    0,1,0,1,0,0,
    0,0,1,0,1,1,
    1,1,0,1,0,0,
    0,0,0,1,0,0
  ),nrow=6, ncol = 6, byrow = TRUE
)
B <- graph_from_adjacency_matrix(A, mode = "undirected")
plot(B)
B <- graph_from_adjacency_matrix(A, mode = "directed")
plot(B)
r1<- c(0,1,1,1)
r2<-c(1,0,1,0)
r3<-c(0,0,0,1)
r4<-c(1,0,0,0)
bridgeAdjmat<- rbind(r1,r2,r3,r4)
bridgeAdjmat
bridgeGraphAm<- graph_from_adjacency_matrix(bridgeAdjmat,mode = "plus")
plot(bridgeGraphAm)
