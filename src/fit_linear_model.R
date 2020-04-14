#!/usr/bin/env Rscript
#
# Genera una regresión lineal con técnicas bayesianas

library(ggplot2)
library(rjags)
out_filename <- "reports/figures/fitted_model.png"
slope     <- 2
intercept <- 5 
linear_model <- "model{
    # Likelihood:
    for (i in 1:n_data) {
        y[i]~dnorm(mu[i], 0.01)
        mu[i] <- slope * x[i] + intercept
    }
    # Prior model for slope and intercept
    slope ~ dunif(0, 10)
    intercept ~ dunif(0, 10) 
}"
resultados <- read.csv("reports/tables/resultados.csv")
linear_jags <- jags.model(textConnection(linear_model), 
             data = list(x=resultados$domain, y=resultados$noisy_range, n_data=nrow(resultados)))
linear_sim <- coda.samples(model = linear_jags,
                           variable.names = c("slope","intercept"), 
                           n.iter = 1000)
predicted_slope <- median(linear_sim[[1]][,"slope"])
predicted_intercept <- median(linear_sim[[1]][,"intercept"])
png(out_filename)
ggplot(resultados, aes(x = domain, y = noisy_range)) +
       geom_point() +
       theme_classic() +
       geom_abline(slope = predicted_slope, intercept = predicted_intercept, color="blue") +
       geom_abline(slope = slope, intercept = intercept, color="red")
dev.off()

summary(linear_sim)
png("reports/figures/histogram_rjags_linear_model.png")
plot(linear_sim, trace = FALSE)
dev.off()
