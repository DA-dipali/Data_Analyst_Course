library(ggplot2)
dat <- ggplot2::mpg
View(dat) 
dat <- transform(dat,
                 cyl = factor(cyl),
                 drv = factor(drv),
                 fl = factor(fl),
                 year = factor(year),
                 class = factor(class)
)
str(dat) 

ggplot(dat) + # data
  aes(x = displ, y = hwy) + # variables
  geom_point()  


ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

ggplot(dat) +
  aes(x = displ, y = hwy) +
  geom_line()


ggplot(dat) +
  aes(x = displ, y = hwy) +
  geom_point() +
  geom_line() # add line


ggplot(dat) +
  aes(x = hwy) +
  geom_histogram()


ggplot(dat) +
  aes(x = hwy) +
  geom_histogram(bins = sqrt(nrow(dat)))

ggplot(dat) +
  aes(x = hwy) +
  geom_histogram(bins = 30) 



ggplot(dat) +
  aes(x = hwy) +
  geom_density()


ggplot(dat) +
  aes(x = hwy, y = ..density..) +
  geom_histogram() +
  geom_density()

ggplot(dat) +
  aes(x = hwy, color = drv, fill = drv) +
  geom_density(alpha = 0.75)     # add transparency

# Boxplot for one variable
ggplot(dat) +
  aes(x = "", y = hwy) +
  geom_boxplot()

# Boxplot by factor
ggplot(dat) +
  aes(x = drv, y = hwy) +
  geom_boxplot()


ggplot(dat) +
  aes(x = drv, y = hwy) +
  geom_boxplot(varwidth = TRUE) + # vary boxes width according to n obs.
  geom_jitter(alpha = 0.25, width = 0.2) # adds random noise and limit its width


ggplot(dat) +
  aes(x = drv) +
  geom_bar()


# Change shape of all points
ggplot(dat) +
  aes(x = displ, y = hwy) +
  geom_point(shape = 5) 

# Change shape of points based on a categorical variable
ggplot(dat) +
  aes(x = displ, y = hwy, shape = drv) +
  geom_point()

