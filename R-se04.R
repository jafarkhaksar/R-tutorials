library(ggplot2)

data(mpg)

# scatter plot

# R traditional function 
plot(mpg$displ, mpg$hwy,
     xlab = "engine displacement",
     ylab = "highway miles per gallon")


# using ggplot2 package

# first specify data and put plus
# next determine type of the graph

ggplot(data = mpg) +  
  geom_point(mapping = aes(x = displ, y = hwy)) 

# geom_point denote scatter plot, there are other geom function


# arbitrary color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),
             color = "blue")

# color based on the class of car
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# color based on a logic
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))


# shape instead of color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),
             shape = 5)


ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# different color for each value of drv variable
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = class),
    show.legend = FALSE
  )

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x =displ, y = hwy),
              method = "lm",
              formula = y ~ x #default. see help for further formulas
  )


# two plots together
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# local and global mapping
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()


library(dplyr)
# different data for a geom object
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)


# bar geom object
data("diamonds")


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(count))) #why not proportion?


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop)))
#what's the problem

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group="cut"))



# fill argument
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(count), fill = cut))


# what happens if we replace cut with another variable
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(count), fill = clarity))


# position argument
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity),
           position = "identity")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity),
           position = "fill")
# do not confuse this fill with the previous fill


# dealing with overplotting
ggplot(data = mpg) + # first specify data
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),
             position = "jitter")

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline(slope=1, intercept = 20)

# storing a plot in a variable
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

p + geom_vline(xintercept = 5)

p + geom_abline()

# See the R4ds chapter on data visualization as a great resource.
# https://r4ds.had.co.nz/data-visualisation.html