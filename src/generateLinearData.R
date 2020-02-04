#!/usr/bin/env Rscript
#
# Genera una linea recta con ruido

slope <- 2
intercept <- 5 
x <- c(1:10)
y <- slope*x + intercept
yaleatoria <- y + runif(10,-2,2)
png('myPlot.png')
plot(x, yaleatoria, type = "p", col = "blue")
lines(x, y, type = "l")
dev.off()

data <- data.frame(x,yaleatoria)
model <- lm(yaleatoria ~ x, data)

png('myPlot2.png')
plot(x, yaleatoria, type = "p", col = "blue")
abline(model)
dev.off()

interceptModel <- coefficients(model)[1]
slopeModel <- coefficients(model)[2]

library(ggplot2)
png('myPlot3.png')
ggplot(data, aes(x=x,y=yaleatoria)) +
  geom_point() +
  geom_abline(slope = slopeModel,intercept = interceptModel,color="red")+
  theme_classic()
dev.off()

