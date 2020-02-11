pngPlotLinearRegression.png:
	src/generate_linear_data.R

pngPlotHistogram.png:
	src/play_rjags_example.R

tests:
	R -e 'library(rjags)'
