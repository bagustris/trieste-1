## R visualiazation tutorial
# Bab 1: Pengantar

install.packages("drat")
drat::addRepo("rcourses")
install.packages("nclRggplot2")

vignette("practical1", package="nclRggplot2")
x = getNamespaceExports("ggplot2")
x[grepl("geom", x)]
?geom_point

# to limit --> + xlim(), ylim(), eg: c(xlim(1,8)), c(xlim(1,10))
install.packages(ggplotly)
library(plotly)

library(ggplot2)
data(mpg)

g = ggplot(mpg, aes(x=displ, y=cty))
g + geom_point(aes(hwy))
g + geom_point(aes(col=factor(cyl)))
g + geom_point(col="blue")
g + geom_point(col=2)
g + geom_point(aes(col=2))      #default is blue, col2
g + geom_point(aes(col="blue"))

g + geom_point(aes(col=factor(cyl))+ shape) 
g + geom_line(aes(colour=factor(cyl))) + geom_point(aes(colour=factor(cyl)))

# a plot with no name, smoothin
g + geom_point(aes(colour=factor(cyl))) + geom_smooth(aes(colour=factor(cyl)))

