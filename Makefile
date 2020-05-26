# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all: \
	tests \
	reports/non-tabular/results.json reports/figures/linear_regression.png \
	reports/figures/histogram.png reports/tables/noisy_data.csv reports/figures/fitted_model.png

define checkDirectories
mkdir --parents $(@D)
endef

# II. Declaración de las variables
# ===========================================================================
# Variables a resultados

csvNoisyData = \
	reports/tables/noisy_data.csv

pngFittedModel = \
	reports/figures/fitted_model.png

jsonFittedModel = \
	reports/non-tabular/results.json


# III. Reglas para construir los objetivos principales
# ===========================================================================

reports/figures/linear_regression.png: src/plot_linear_data.R $(csvNoisyData)
	$(checkDirectories)
	$< \
	--file $(word 2, $^) \
	--out $@

reports/figures/histogram.png: src/play_rjags_example.R 
	$(checkDirectories)
	$< $@

$(csvNoisyData): src/make_noisy_data.R 
	$(checkDirectories)
	$< \
	--out $@

$(pngFittedModel): src/plot_linear_model_rjags.R $(csvNoisyData) $(jsonFittedModel)
	$(checkDirectories)
	$< \
	--file $(word 2, $^) \
	--results $(word 3, $^) \
	--out $@

$(jsonFittedModel): src/make_results.R $(csvNoisyData)
	$(checkDirectories)
	$< \
	--file $(word 2, $^) \
	--out $@

# IV. Reglas para construir las dependencias de los objetivos principales
# ===========================================================================



# V. Reglas del resto de los phonies
# ===========================================================================
.PHONY: all clean tests

tests: $(csvNoisyData)
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
	R -e 'library(covr)'

# Elimina los residuos de LaTeX

clean:
	rm --force --recursive reports/
