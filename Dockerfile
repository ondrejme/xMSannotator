FROM rocker/r-ver:3.6.3

RUN apt-get update && apt-get install -yq \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng-dev \
    libssl-dev \
    libxml2-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("dplyr")'
RUN Rscript -e 'install.packages("flashClust")'
RUN Rscript -e 'install.packages("tidyr")'
RUN Rscript -e 'install.packages("purrr")'
RUN Rscript -e 'install.packages("tibble")'
RUN Rscript -e 'install.packages("arrow")'
RUN Rscript -e 'install.packages("BiocManager")'
RUN Rscript -e 'BiocManager::install("rhdf5 ")'
RUN Rscript -e 'BiocManager::install("WGCNA ")'

ADD xmsannotator /xmsannotator
RUN R CMD INSTALL /xmsannotator \
 && rm -rf /xmsannotator
