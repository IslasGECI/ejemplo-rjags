FROM r-base:3.6.2
RUN apt-get update && apt-get install --yes r-cran-rjags
CMD ["make"]
