.PHONY: build rstudio

build:
	docker build --tag islasgeci/ejemplo-rjags .

rstudio: build
	docker run --detach --interactive --publish 8787:8787 --rm --tty --volume ${PWD}:/home/rstudio islasgeci/ejemplo-rjags
