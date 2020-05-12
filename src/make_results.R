#!/usr/bin/env Rscript
#
# Resultados en json de una regresión lineal con técnicas bayesianas
source("src/functions/make_fit.R")
library(optparse)
library(jsonify)
option_list = list(
	make_option(c("-f", "--file"), type="character", default=NULL,
                  help="dataset file name", metavar="character"),
	make_option(c("-o", "--out"), type="character", default=NULL,
                  help="output file name", metavar="character")
);
opt_parser <- OptionParser(option_list=option_list);
opt <- parse_args(opt_parser);
in_filename  <- opt$file
out_filename <- opt$out
results <- read.csv(in_filename)
bayesian_fit <- make_fit(results)
predicted_intercept <- as.numeric(bayesian_fit[2])
predicted_slope <- as.numeric(bayesian_fit[4])
write(to_json(list(predicted_intercept=predicted_intercept,predicted_slope=predicted_slope)),out_filename)
