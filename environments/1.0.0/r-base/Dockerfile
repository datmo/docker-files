FROM datmo/buildpack-deps:cpu

MAINTAINER Datmo devs <dev@datmo.com>

# Rstudio
ENV DEBIAN_FRONTEND noninteractive
ENV CRAN_URL https://cloud.r-project.org/

RUN set -e \
      && ln -sf /bin/bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install apt-transport-https gdebi-core libapparmor1 libcurl4-openssl-dev \
                            libssl-dev libxml2-dev pandoc r-base \
      && apt-get -y autoremove \
      && apt-get clean