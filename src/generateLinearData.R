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
summary(model)

