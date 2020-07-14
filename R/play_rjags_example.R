#!/usr/bin/env Rscript
#
# Ejemplo de votantes en una encuesta con rjags

library(ggplot2)
library(rjags)
# DEFINE the model
vote_model <- "model{
    # Likelihood model for X
    X ~ dbin(p, n)

    # Prior model for p
    p ~ dbeta(a, b)
}"
# COMPILE the model    
vote_jags <- jags.model(textConnection(vote_model), 
             data = list(a = 45, b = 55, X = 6, n = 10),
             inits = list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 100))
# SIMULATE the posterior
vote_sim <- coda.samples(model = vote_jags, 
                         variable.names = c("p"), 
                         n.iter = 1000)
png("reports/figures/histogram.png")
plot(vote_sim, trace = FALSE)
dev.off()
