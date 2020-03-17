# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
pngPlots = reports/figures/linear_regression.png reports/figures/histogram.png

all: $(pngPlots)

# II. Declaración de las variables
# ===========================================================================
# Variables a resultados


# III. Reglas para construir los objetivos principales
# ===========================================================================

# IV. Reglas para construir las dependencias de los objetivos principales
# ===========================================================================

$(word 1, $(pngPlots)): src/generate_linear_data.R 
	if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
	src/generate_linear_data.R $@

$(word 2, $(pngPlots)): src/generate_linear_data.R 
	if [ ! -d reports/figures ]; then mkdir --parents reports/figures; fi
	src/play_rjags_example.R $(word 2, $(pngPlots))

# V. Reglas del resto de los phonies
# ===========================================================================

tests:
	R -e 'library(rjags)'

# Elimina los residuos de LaTeX

clean:
	rm --force --recursive reports/
