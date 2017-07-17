# Bah 4: Facet

# Faceting is a mechanism for automatically laying out multiple plots
# on a page. The data is split into subsets, with each subset plotted
# onto a different panel. ggplot2 has two types of faceting:
# • facet_grid : produces a 2d panel of plots where variables define
# rows and columns.
# • facet_wrap : produces a 1d ribbon of panels which can be wrapped
# into 2d.

library(ggplot2)
data(movies, package = "ggplot2movies")

#head(movies)
g = ggplot(movies, aes(x=length)) + xlim(0, 200) +
  geom_histogram(aes(y=..density..), binwidth = 3)
g
y ~ .
g + facet_grid(Comedy ~ .)

View(movies)
movies$short = movies$length < mean (movies$length)
ggplot(movies, aes(x=rating)) +
  geom_point(aes(y=length)) +
  stat_smooth(aes(y=length), method ="lm") +
  facet_grid(short~Comedy, margin=TRUE)

movies = movies[movies$length < 180,]
movies$dec = 10*(movies$year%/% 10)

library(dplyr)
movies%>% filter (length<180) %>% mutate(dec = 10*year%/%10)
g + facet_grid(. ~ Animation)
