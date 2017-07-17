# Bab3: Plot Bouldin

# ggplot has two main argument: DATA ang MAPPING
# DATA is dataframe, MAPPING creates default AES atributes

data(mpg, package = "ggplot2")
g = ggplot(data=mpg, 
           mapping = aes(x=displ, y=cty, color=factor(cyl))) 

# perintah diatas ekuivalen dengan
g = ggplot(mpg, aes(displ, cty, color=factor()))

# Fungsi geom_*

data(tips, package = "reshape2")
g = ggplot(tips, aes(x=size, y=tip))
(g1 = g + geom_boxplot())
g2 = g + geom_boxplot(aes(group=size)) 
g3 = g2 + geom_dotplot(aes(group=size), 
                       binaxis="y", stackdir="center", 
                       binwidth=0.05, stackratio=0.5)
g3

## standard plot
data(movies, package = "ggplot2movies")
h = ggplot(movies, aes(x=mpaa)) + geom_bar()

data(raster_example, package="nclRggplot2")
g_rast = ggplot(raster_example, aes(x, y)) +
  geom_raster(aes(fill=z))

## aesthetic
d = data.frame(x=1:50, y = 1:50, z = 0:9)
g_aes = ggplot(d, aes(x = x, y = y))
g_aes + geom_point(aes(colour = z))

# perhatikan perbedaan dua skip berikut
g_aes + geom_point(aes(colour="Blue"))
g_aes + geom_point(colour="Blue")

  
## Fungsi stat_*
g4 = g + stat_summary(geom="point", fun.y= mean)
g5 = g + stat_summary(geom="point",
                      fun.y= function(i) mean(i)/median(i))

# berikut demo fungsi stat_summary
ggplot(tips, aes(x=size, y= tip)) + stat_summary(geom="point", fun.y = median) +
  stat_summary(geom = "line", fun.y=mean) +
  stat_summary(geom = "errorbar", 
               fun.ymax=function(x)
                 mean(x) + sd(x),          # try to change the value of it                      
               fun.ymin = function(x)
                 mean(x) - 1*sd(x))

g5 = g + stat_summary(geom="point",
                      fun.y= function(i) mean(i)/median(i))

g6 = g +
  stat_summary(fun.ymin = function(i) quantile(i, 0.25),
               fun.ymax = function(i) quantile(i, 0.75),
               colour="blue", geom="errorbar",
               width=0.2) +
  stat_smooth(aes(colour=smoker, lty=smoker),
              se=FALSE, method="lm")
