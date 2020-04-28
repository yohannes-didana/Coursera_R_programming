data1 <- read.csv('hw1_data.csv')
names(data1)
print(data1[1:2,])
tail(data1, n=2)
data1$Ozone[47]
sum(is.na(data1$Ozone))
testMean <- colMeans(data1, na.rm=TRUE)
colMeans(subset(data1, Ozone > 31 &Temp > 90))
tapply(data1$Temp, data1$Month, mean, na.rm = TRUE)
tapply(data1$Ozone, data1$Month, max, na.rm = TRUE)
old.dir <- getwd()
file.exists("mytest.R")
dir.create("testdir")
file.create("mytest.R")
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)

##function

if (x < 3) { y <- 10} else { y <- 14}
y<- if(x < 3){ 10} else {4}

for (i in 1:10) {print(i)}

add2 <- function(x, y) {
  x + y
}

above <- function(x, n) {
  use <- x> n
  x[use]
}

columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

columnmean(airquality)

f <- function(a, b=1, c=2, d = NULL){}

make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

cube <- make.power(3)
cube(3)
square <- make.power(2)
square(3)

ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))

x <- Sys.time()
p <- as.POSIXlt(x)
p
names(unclass(p))
p$sec



cube <- function(x, n) {
  x^3
}

cube(3)

x <- 1:10
if(x > 5) {
  x <- 0
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)









