pngPlots = reports/figures/linear_regression.png reports/figures/histogram.png

.PHONY: all clean tests

all: tests $(pngPlots)

reports/figures/linear_regression.png:
	mkdir --parents $(@D) 
	src/generate_linear_data.R

reports/figures/histogram.png:
	mkdir --parents $(@D)
	src/play_rjags_example.R

tests:
	R -e 'library(rjags)'

clean:
	rm --force --recursive reports/
