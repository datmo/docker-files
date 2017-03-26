FROM ubuntu:14.04

MAINTAINER Acusense devs <dev@acusense.ai>

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev &&\
     rm -rf /var/lib/apt/lists/*

# Preferred to have anaconda
RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-4.2.12-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install conda-build -y && \
     /opt/conda/bin/conda create -y --name pytorch-py35 python=3.5.2 numpy scipy ipython mkl&& \
     /opt/conda/bin/conda clean -ya

ENV PATH /opt/conda/envs/pytorch-py35/bin:$PATH
ENV NO_CUDA=1

RUN conda install pytorch torchvision -c soumith -y

WORKDIR /opt/
RUN git clone https://github.com/pytorch/pytorch.git
WORKDIR /opt/pytorch

RUN cat requirements.txt | xargs -n1 pip install --no-cache-dir && \
    pip install -v .

RUN mkdir -p /test
COPY pytorch_test.py /test/

WORKDIR /workspace
RUN chmod -R a+w /workspace