# Bab 2: ggplot overview

library(ggplot2)
data(mpg, package = "ggplot2")
plot(mpg[mpg$cyl==4,]$displ, mpg[mpg$cyl==4,]$cty,
     xlim=c(1, 8), ylim=c(5, 35))


points(mpg[mpg$cyl==5,]$displ, mpg[mpg$cyl==5,]$cty,
       col=2)
points(mpg[mpg$cyl==6,]$displ, mpg[mpg$cyl==6,]$cty,
       col=3)
points(mpg[mpg$cyl==8,]$displ, mpg[mpg$cyl==8,]$cty,
       col=4)

g = ggplot(data=mpg, aes(x=displ, y=cty))
g + geom_point(aes(colour=factor(cyl)))

p = g + geom_point(aes(colour=factor(cyl))) +
  stat_smooth(aes(colour=factor(cyl)))

g + geom_point(aes(colour=factor(cyl)))

# perintah di atas merupakan bentuk singkat dari perintah berikut
g + layer(
  data = mpg,#inherited
  mapping = aes(color=factor(cyl)),#x,y are inherited
  stat = "identity",
  geom = "point",
  position = "identity",
  params = list(na.rm=FALSE)
)
