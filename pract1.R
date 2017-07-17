# practical 2 nclRggplot2
# starting...

vignette("practical2", package = "nclRggplot2")

library("nclRggplot2")
library("ggplot2")
df=overplot_data(n=20000)

h = ggplot(df) + geom_point(aes(x,y))
h = ggplot(df) + geom_point(aes(x,y), 
                            alpha=0.5, shape=1)   #change shape and alpha

h 

?geom_jitter
h + geom_jitter(aes(x,y))

h + stat_density2d(aes(x,y, fill=..density..),
                 contour=FALSE, geom="tile")


?stat_bin2d
?stat_binhex
h


# add stat_bind2 and stat_binhex to above code

data(diamonds, package="ggplot2")

?diamonds
?geom_histogram

i1 = ggplot(data=diamonds) +
  geom_histogram(aes(x=depth, color=cut), binwidth = 0.5)

i1


## Copy cat
library("ggplot2")
data(mpg, package="ggplot2")
dim(mpg)

ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point() + xlab("Displacement")

## Solution
#library(nclRggplot2)
#vignette("solutions2", package="nclRggplot2")
