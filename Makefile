# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all: reports/figures/linear_regression.png reports/figures/histogram.png reports/tables/noisy_data.csv reports/figures/fitted_model.png


# II. Declaración de las variables
# ===========================================================================
# Variables a resultados

csvNoisyData = \
	reports/tables/noisy_data.csv

pngFittedModel = \
	reports/figures/fitted_model.png


# III. Reglas para construir los objetivos principales
# ===========================================================================

reports/figures/linear_regression.png: src/plot_linear_data.R
	mkdir --parents $(@D)
	$< \
	--file $(csvNoisyData) \
	--out $@

reports/figures/histogram.png: src/play_rjags_example.R 
	mkdir --parents $(@D)
	$< $@

$(csvNoisyData): src/make_noisy_data.R 
	mkdir --parents $(@D)
	$< \
	--out $@

$(pngFittedModel) : src/plot_linear_model_rjags.R $(noisy_data)
	mkdir --parents $(@D)
	$< \
	--file $(csvNoisyData) \
	--out $(pngFittedModel)

# IV. Reglas para construir las dependencias de los objetivos principales
# ===========================================================================



# V. Reglas del resto de los phonies
# ===========================================================================
.PHONY: all clean tests

tests:
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
	R -e 'library(rjags)'

# Elimina los residuos de LaTeX

clean:
	rm --force --recursive reports/
