## creating objects

a <- "masoud" # "Alt + -" to generate <-      "Ctrl + Enter" to run a line

print(a) # function


b <- 31


c <- T # or TRUE

c <- FALSE # or just F

print(c)

c

# vectors: the default structure of R objects

is.vector(b)

v1 <- [1, 2, 3, 4] #error
v1 <- [1 2 3 4]  #error


v1 <- c(1, 2, 3, 4) # c stands for combination or collect

v1 <- 1:4

v1


v2 <- seq(from=23, to=123, by=3) # function with multiple inputs (arguments)
                                # here we store the output in an object
length(v2)

sum(v2)

v2_average <- mean(v2) 

v2_variance <- var(v2)



gpa1 <- c(2.75, 3.25, 3.60) 

gpa2 <- c(3.4, 3.75, 3.80)

gpa <- c(gpa1, gpa2) # c can also connect two objects

gpa

# vector indexing

gpa[4]

gpa[c(4, 1, 3)]

gpa[4:1]

gpa[7]


# adding names to an object

names(gpa) = c("Ali", "Zahra", "Mohammad", "Fatemeh", "Morteza", "Faezeh") # name attribute

gpa

gpa["Fatemeh"]

gpa[c("Fatemeh", "Ali", "Mohammad")]

gpa["Sepideh"]

is.vector(gpa)

# manipulating vectors

5 * gpa 

gpa1 + gpa2 # element by element addition

gpa1 * gpa2 # element by element multiplication

gpa > 3.70

gpa == 2.75

# logical indexing

gpa[c(F, T, F, T, F, T)]

## data frames

data(mtcars)

nrow(mtcars)

ncol(mtcars)

# how much is the mpg of Duster 360?

mtcars["Duster 360", "mpg"] # we know have two dimensions

mtcars[7, 1] # equivalent


# data frame are made up of vectors

mtcars$mpg

mtcars$wt

# let's add a column indicating the weight of cars in Kg

mtcars$wt_kg <- 1000 * 0.45 * mtcars$wt

names(mtcars)


## breaking data frames

my_favorite_cars <- mtcars[c("Mazda RX4 ", "Cadillac Fleetwood", "Toyota Corolla", "Volvo 142E"), ]

my_favorite_attr <- mtcars[ , c("mpg", "cyl", "am", "wt_kg")]


# logical indexing in data frames

random_cars <- mtcars[c(T, T, F, T, F, T, F, T, T, T, T, F, F, T, F, T, F, T, F, F, F, T, F, T, F, T, F, T, F, T, F, T), ]

# let's insert a sensible vector in the row's place

mtcars$am == 0

automatic_trans_cars <- mtcars[mtcars$am == 0, ]



###### warm up
# construct a data frame of cars with "more than 4 cylinders" and "2, 3, or 4 carburetors"



# construct a data frame of cars with more than 4 cylinders and 



###



## linear regression
ls() # displaying objects in the global environment

rm(a, b, c, gpa2, gpa1)  # rm(ls()) removes all objects 

regression1 <- lm(mpg ~ cyl + log(hp) + I(hp^2) + vs + vs:hp , data = mtcars, subset = am==0)

regression1

summary(regression1) # a nicer summary of the regression results

# R stores the regression related material in an object called `list'
# members of a list can be roughly any object of any dimension 

regression1$coefficients

regression1$fitted.values

regression1$residuals

# the above members have also their own functions, for example. residuals(regression1)




##### warm up
# manually calculate R-squared of the previous regression




###


# robust standard errors

install.packages("lmtest")

install.packages("sandwich")

library(lmtest) 

library(sandwich)

robust_Omega = vcovHC(x = regression1, type = "HC3")

robust_inference <- coeftest(x = regression1, vcov. = robust_Omega)


# reporting regression results with latex

library(stargazer) # there are also alternatives to this package

stargazer(regression1,
          type = "latex",
          title = "OLS estimation results",
          label = "tb1",
          out = "/home/jafar/TA/2023/reg1.tex",
          out.header = F,
          se = )




# saving an object
saveRDS(my_favorite_cars, file = "/home/jafar/TA/2023/myFavoriteCars.rds")

# you can read an .rds file with the function `readRDS()`



## the working directory

getwd()

setwd("/home/jafar/TA/2023")

getwd()



# working with .dta files

# install.packages("readstata13")

library(readstata13)

dir.create("stata")

save.dta13(my_favorite_cars, file = "./stata/myFavoriteCars.dta") # one level down with dot

getwd()

auto <- read.dta13(file = "../auto.dta") # one level up with double dot

# a good alternative to the readstata13 package is `rio` with functions import() and export(),
# which supports many formats



# To save and load the whole workspace
save.image(file = "se01.RData")
load(file = "se01.RData")


# problem and solution for this session's material:
# https://www.w3resource.com/r-programming-exercises/dataframe/index.php

# This is a fascinating online book for an introduction to R:
# https://rstudio-education.github.io/hopr/project-2-playing-cards.html

# An excellent youtube playlist for R:
# https://youtube.com/playlist?list=PL9UNgBC7ODr46RSz88DCelUdhkLSpRrfZ

# Finally, google `an introduction to R` to come by further resources if you wish