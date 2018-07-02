FROM datmo/python-base:gpu-py27

MAINTAINER Datmo devs <dev@datmo.com>"

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

RUN set -e \
      && R -e "\
      update.packages(ask = FALSE, repos = '${CRAN_URL}'); \
      pkgs <- c('dbplyr', 'devtools', 'docopt', 'doParallel', 'foreach', 'gridExtra', 'rmarkdown', 'tidyverse'); \
      install.packages(pkgs = pkgs, dependencies = TRUE, repos = '${CRAN_URL}'); \
      sapply(pkgs, require, character.only = TRUE);"

RUN set -e \
      && curl -sS https://s3.amazonaws.com/rstudio-server/current.ver \
        | xargs -I {} curl -sS http://download2.rstudio.org/rstudio-server-{}-amd64.deb -o /tmp/rstudio.deb \
      && gdebi -n /tmp/rstudio.deb \
      && rm -rf /tmp/rstudio.deb

RUN set -e \
      && useradd -m -d /home rstudio \
      && echo rstudio:rstudio \
        | chpasswd

# Jupyter

RUN pip --no-cache-dir install \
        Cython \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        path.py \
        pyyaml \
        scipy \
        six \
        sklearn \
        sympy \
        Pillow \
        zmq \
        && \
    python -m ipykernel.kernelspec

# Set up our notebook config.
COPY jupyter_notebook_config_py2.py /root/.jupyter/
RUN mv /root/.jupyter/jupyter_notebook_config_py2.py /root/.jupyter/jupyter_notebook_config.py

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.

COPY run_jupyter.sh /
RUN chmod +x /run_jupyter.sh

# Jupyter lab
RUN pip install jupyterlab==0.32.1

# IPython and Rstudio
EXPOSE 8888 8787