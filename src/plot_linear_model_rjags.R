#!/usr/bin/env Rscript
#
# Grafica una regresión lineal con técnicas bayesianas
source("src/functions/make_fit.R")
library(ggplot2)
library(optparse)
option_list = list(
	make_option(c("-f", "--file"), type="character", default=NULL,
                  help="dataset file name", metavar="character"),
	make_option(c("-o", "--out"), type="character", default=NULL,
                  help="output file name", metavar="character")
);
opt_parser <- OptionParser(option_list=option_list);
opt <- parse_args(opt_parser);
in_file <- opt$file
out_filename <- opt$out
slope     <- 2
intercept <- 5 
resultados <- read.csv(in_file)
bayesian <- make_fit(resultados)
predicted_intercept <- as.numeric(bayesian[2])
predicted_slope <- as.numeric(bayesian[4])
png(out_filename)
ggplot(resultados, aes(x = domain, y = noisy_range)) +
       geom_point() +
       theme_classic() +
       geom_abline(slope = predicted_slope, intercept = predicted_intercept, color="blue") +
       geom_abline(slope = slope, intercept = intercept, color="red")
dev.off()
