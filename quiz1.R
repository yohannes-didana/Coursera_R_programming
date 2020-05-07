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

#creating sequence ":"
seq(0, 10, by=0.5)

my_seq <-seq(5, 10, length=30)

seq(along.with = my_seq)
seq_along(my_seq)

#rep() - stands for replicate
rep(0, times = 40)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each = 10)

##
my_char <- c("My", "name", "is")
#The `collapse` argument to the paste() function tells R that when we join together
#the elements of the my_char character vector, we'd like to separate them with single
#spaces.
paste(my_char, collapse = " ")
paste("Hello", "world!", sep = " ")
paste(1:3, c("X", "Y", "Z"), sep = "")
paste(LETTERS, 1:4, sep = "-")

#Index vectors come in four different flavors -- logical vectors, vectors of positive
#integers, vectors of negative integers, and vectors of character strings
y <- x[!is.na(x)]

#Since NA is not a value, but rather a placeholder for an unknown quantity, the
#expression NA > 0 evaluates to NA
x[!is.na(x) & x > 0]

#R uses 'one-based indexing',which (you guessed it!) means 
#the first element of a vector is considered element 1

x[-c(2, 10)]
x[c(-2, -10)]
x[c(3,5,7)]

#matrices and data frames to store tabular data, with rows and columns
#matrices can only contain a single class
#of data, while data frames can consist of many different classes of data.
#'implicit coercion'
my_vector <- 1:20
dim(my_vector) <- c(4, 5)
attributes(my_vector)
class(my_vector)
#a matrix is  simply an atomic vector with a dimension attribute
#matrix() function
my_matrix <- matrix(1:20, nrow = 4, ncol = 5)
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)
my_data <- data.frame(patients, my_matrix)
cnames <- c("patient", "age", "weight","bp", "rating", "test")
colnames(my_data) <- cnames

#1. Everything that exists
#is an object. 2. Everything that happens is a function call.
list
#strptime  ,  difftime()
strptime("October 17, 1986 08:24", "%B %d, %Y %H:%M")
difftime(Sys.time(), t1, units = 'days')

#lubridate package by Hadley Wickham.


x <- list(a=1:5, b =rnorm(10))

c <- lapply( x, mean)

x <- matrix(rnorm(200), 20, 10)

apply(x, 2, mean)

apply(x, 1, sum)

apply(x, 1, quantile, probs = c(0.25, 0.75))


a <- array(rnorm(400), c(2,2,10))

apply(a, c(1,2), mean)

rowMeans(a, dims = 2)

mapply(rep, 1:4, 4:1)

noise <- function(n , mean, sd) {
  rnorm(n, mean, sd)
  
}

noise(5 , 1, 2)

noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)

x <- c(rnorm(10), runif(10) , rnorm(10,1))

f <-gl(3, 10)
tapply(x, f, mean)
tapply(x, f, mean, simplify = F)
tapply(x, f, range)

lapply(split(x, f), mean)
#splitting data frame
library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm =T))

lm(y~ x)

data(iris)

s <- split(iris, iris$Species)
sapply(s, function(x) colMeans(x[,c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]))
colMeans(iris)
apply(iris[,1:4], 2, mean)
apply(iris, 1, mean)

data(mtcars)

tapply(mtcars$hp, mtcars$cyl, mean)

with(mtcars, tapply(mpg, cyl, mean))

sapply(split(mtcars$mpg, mtcars$cyl), mean)

#viewinfo()

#In general, if the result is a list where every element is of length one, then
#sapply() returns a vector. If the result is a list where every element is a vector of
#the same length (> 1), sapply() returns a matrix. If sapply() can't figure things
#out, then it just returns a list, no different from what lapply() would give you.

#anonymous functions
#lapply(unique_vals, function(elem) elem[2])


#dim(), head(), str(), and summary()

#tapply(flags$population,flags$landmass, summary)

#vapply(flags, unique, numeric(1))

#vapply(flags, class, character(1))
