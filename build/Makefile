.PHONY: build run

build:
	docker build --tag islasgeci/ejemplo-rjags .

run: build
	docker run --detach --interactive --publish 8787:8787 --rm --tty --volume ${PWD}:/home/rstudio islasgeci/ejemplo-rjags