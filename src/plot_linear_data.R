#!/usr/bin/env Rscript
#
# Genera una linea recta con ruido

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
data <- read.csv(in_file)
model       <- lm(noisy_range ~ domain, data)
intercept_model <- coefficients(model)[1]
slope_model     <- coefficients(model)[2]
png(out_filename)
ggplot(data, aes(x = domain, y = noisy_range)) +
       geom_point() +
       theme_classic() +
       geom_abline(slope = slope_model, intercept = intercept_model, color="red") 
dev.off()
