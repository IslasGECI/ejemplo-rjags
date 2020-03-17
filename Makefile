# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
pngPlots = reports/figures/linear_regression.png reports/figures/histogram.png

.PHONY: all clean tests

# II. Declaración de las variables
# ===========================================================================
# Variables a resultados


# III. Reglas para construir los objetivos principales
# ===========================================================================

# IV. Reglas para construir las dependencias de los objetivos principales
# ===========================================================================

	src/generate_linear_data.R $@

reports/figures/histogram.png:
	mkdir --parents $(@D)
	src/play_rjags_example.R

# V. Reglas del resto de los phonies
# ===========================================================================

tests:
	R -e 'library(rjags)'

# Elimina los residuos de LaTeX

clean:
	rm --force --recursive reports/
