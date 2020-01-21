#!/usr/bin/env bash
#
# Crea imagen y corre RStudio en un contenedor

docker build --tag islasgeci/ejemplo-rjags .
docker run --detach --interactive --publish 8787:8787 --rm --tty --volume ${PWD}:/home/rstudio islasgeci/ejemplo-rjags
