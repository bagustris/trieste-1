# Data visualization

tC = c(10, 11, 13, 14, 15, 15, 16, 17, 19, 19, 20, 21,
      23, 24, 25, 26, 28, 29, 27, 24, 22, 20, 18, 15)
tC
time = c(1:24)
time

dataTemp=data.frame(temp=tC, t=time)

g = ggplot(dataTemp, aes(x=t, y=temp))
g

g + geom_point()
g + geom_point(color=factor(tC))
  