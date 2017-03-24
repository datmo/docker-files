FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

MAINTAINER Acusense devs <dev@acusense.ai>
RUN apt-get update && apt-get install -y \
    python-numpy \
    python-scipy \
    python-dev \
    python-nose \
    g++ \
    libopenblas-dev \
    git \
    curl

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install Theano

RUN mkdir -p /test
COPY theano_test.py /test/
 
