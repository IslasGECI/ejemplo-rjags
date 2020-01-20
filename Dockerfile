FROM rocker/tidyverse:latest
ENV DISABLE_AUTH=true
RUN apt-get update && apt-get install --yes r-cran-rjags
CMD ["/init"]
