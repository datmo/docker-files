FROM ubuntu:14.04

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

RUN pip install -U spacy
RUN python -m spacy.en.download

RUN pip --no-cache-dir install jupyter

WORKDIR /workspace
RUN chmod -R a+w /workspace
