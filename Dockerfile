FROM r-base:3.6.2
RUN apt-get update && apt-get install --yes \
    libcurl4-openssl-dev \
    libssl-dev \
    r-cran-rjags
RUN R -e "install.packages(c('covr','jsonify','optparse','testthat','tidyverse'), repos='http://cran.rstudio.com')"
CMD ["make"]
