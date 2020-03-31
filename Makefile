# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all: reports/figures/linear_regression.png reports/figures/histogram.png reports/tables/resultados.csv


# II. Declaración de las variables
# ===========================================================================
# Variables a resultados


# III. Reglas para construir los objetivos principales
# ===========================================================================

reports/figures/linear_regression.png reports/tables/resultados.csv: src/generate_linear_data.R 
	mkdir --parents $(@D)
	$< $@

reports/figures/histogram.png: src/play_rjags_example.R 
	mkdir --parents $(@D)
	$< $@

# IV. Reglas para construir las dependencias de los objetivos principales
# ===========================================================================



# V. Reglas del resto de los phonies
# ===========================================================================

tests:
	R -e 'library(rjags)'

# Elimina los residuos de LaTeX

clean:
	rm --force --recursive reports/
