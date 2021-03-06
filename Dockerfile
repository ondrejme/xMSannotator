FROM rocker/r-ver:4.0.0

RUN apt-get update && apt-get install -yq \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("remotes")'
RUN Rscript -e 'install.packages("tibble")'
RUN Rscript -e 'install.packages("tidyr")'
RUN Rscript -e 'install.packages("dplyr")'
RUN Rscript -e 'install.packages("purr")'
RUN Rscript -e 'install.packages("flashClust")'
RUN Rscript -e 'install.packages("data.table")'
RUN Rscript -e 'install.packages("BiocManager")'
RUN Rscript -e 'BiocManager::install(version = "3.11")'
RUN Rscript -e 'BiocManager::install("WGCNA")'
RUN Rscript -e 'BiocManager::install("rhdf5")'

ADD xmsannotator /xmsannotator
RUN R CMD INSTALL /xmsannotator \
 && rm -rf /xmsannotator
