FROM r-base:3.6.2
RUN apt-get update && apt-get install --yes r-cran-rjags
RUN R -e "install.packages(c('optparse','testthat','tidyverse'), repos='http://cran.rstudio.com')"
CMD ["make"]
