FROM rocker/r-ubuntu:18.04
RUN apt-get update && apt-get install --yes r-cran-rjags
