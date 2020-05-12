#!/usr/bin/env Rscript
#
# Grafica una regresión lineal con técnicas bayesianas
library(ggplot2)
library(optparse)
library(jsonify)
option_list = list(
	make_option(c("-f", "--file"), type="character", default=NULL,
                  help="dataset file name", metavar="character"),
	make_option(c("-r", "--results"), type="character", default=NULL,
                  help="results file name", metavar="character"),
	make_option(c("-o", "--out"), type="character", default=NULL,
                  help="output file name", metavar="character")
);
opt_parser <- OptionParser(option_list=option_list);
opt <- parse_args(opt_parser);
in_data_filename <- opt$file
in_json_filename <- opt$results
out_png_filename <- opt$out
slope     <- 2
intercept <- 5 
data <- read.csv(in_data_filename)
results <- from_json(in_json_filename)
predicted_intercept <- as.numeric(results[1])
predicted_slope <- as.numeric(results[2])
png(out_png_filename)
ggplot(data, aes(x = domain, y = noisy_range)) +
       geom_point() +
       theme_classic() +
       geom_abline(slope = predicted_slope, intercept = predicted_intercept, color="blue") +
       geom_abline(slope = slope, intercept = intercept, color="red")
dev.off()
