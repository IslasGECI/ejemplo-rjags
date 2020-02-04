FROM rocker/tidyverse:latest
RUN apt-get update && apt-get install --yes r-cran-rjags
CMD ["make"]
