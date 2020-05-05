#!/usr/bin/env Rscript
#
# Genera datos de una linea recta con ruido
library(optparse)
option_list = list(
	make_option(c("-o", "--out"), type="character", default=NULL, 
              help="output file name [default= %default]", metavar="character")
);
opt_parser <- OptionParser(option_list=option_list);
opt <- parse_args(opt_parser);

slope     <- 2
intercept <- 5 
domain    <- c(1:10)
range     <- (slope * domain) + intercept
seed_number <- 5
set.seed(seed_number)
noise <- runif(10, -2, 2)
noisy_range <- range + noise
data <- data.frame(domain, noisy_range)
out_filename_table <- opt$out
write.csv(data,out_filename_table)