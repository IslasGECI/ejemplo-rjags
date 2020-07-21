FROM r-base:4.0.0
RUN apt-get update && apt-get install --yes \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    r-cran-rjags
RUN R -e "install.packages(c('covr','devtools','jsonify','optparse','testthat','tidyverse'), repos='http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
CMD ["make"]
