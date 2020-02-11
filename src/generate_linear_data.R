#!/usr/bin/env Rscript
#
# Genera una linea recta con ruido

library(ggplot2)
slope     <- 2
intercept <- 5 
domain    <- c(1:10)
range     <- (slope * domain) + intercept
noise     <- runif(10, -2, 2)
noisy_range <- range + noise
data        <- data.frame(domain, noisy_range)
model       <- lm(noisy_range ~ domain, data)
intercept_model <- coefficients(model)[1]
slope_model     <- coefficients(model)[2]
png("reports/figures/pngLinearRegression.png")
ggplot(data, aes(x = domain, y = noisy_range)) +
       geom_point() +
       theme_classic() +
       geom_abline(slope = slope_model, intercept = intercept_model, color="red") 
dev.off()
