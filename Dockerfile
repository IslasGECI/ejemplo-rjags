FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=US/Pacific
RUN apt-get update && apt-get install --yes r-cran-rjags 