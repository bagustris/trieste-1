# Bab 5: Scales

library(ggplot2)
data(movies, package = "ggplot2movies")

h = ggplot(subset(movies, length>0 & budget>0),
           aes(y=length)) + ylim(0, 500)
h1 = h + geom_point(aes(budget), alpha=0.2)
h1

h2 = h + geom_point(aes(log10(budget)), alpha=0.2)
h2

h3 = h1 + scale_x_log10()
h3

# perintah diatas sama denga berikut,
h1 + scale_x_continuous(trans="log10")

# adjust the tick marks and labels
h4 = h3 +
  scale_y_continuous(breaks=seq(0, 500, 100),
                     limits=c(0, 500),
                     minor_breaks = seq(0, 500, 25),
                     labels=c(0, "", "", "", "", 500),
                     name="Movie Length")
h4


## Discrete colours
g = ggplot(data=mpg, aes(x=displ, y=cty)) +
  geom_point(aes(colour=factor(cyl)))
g

# another color scheme (colorbrewer0.org)
ggplot(movies, aes(x=length, y=rating)) + 
  geom_point(aes(color=rating))
  # scale_color_gradient2(low="black",
  #                       high="red",
  #                       mid="white"))
  # # scale_color_manual(values=c("red", "blue"))
  scale_color_gradientn(colours=rainbow(5))
  
RColorBrewer::display.brewer.pal(4, "Set3")


# alter the hue and intensity
g + scale_colour_hue(l=70, c=60)
g
# use predefined colours pallettte
g + scale_colour_brewer(palette="PuOr", type="div")

# specify our color scheme
g + scale_colour_manual(
  values=c("4"="red", "5"="blue",
           "6"="green", "8"="black"))
g

# for black white
g + scale_colour_grey()


# Multiplot
par(mfrow=c(2, 2))

library("gridExtra")
grid.arrange(h1, h2, h3, h4, nrow=2)

library("grid")
vplayout = function(x, y)
  viewport(layout.pos.row = x, layout.pos.col = y)

print(h1, vp = vplayout(1, 1:2))
print(h2, vp = vplayout(2, 1))
print(h3, vp = vplayout(2, 2))
