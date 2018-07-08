FROM datmo/opencv:cpu-py35

MAINTAINER Datmo devs <dev@datmo.com>

# Install datmo
RUN pip install datmo

ARG MXNET_VERSION=1.1.0

RUN pip --no-cache-dir install numpy==1.14.5 mxnet==${MXNET_VERSION}

# install tensorboardx and graphviz
RUN pip install tensorboardX graphviz

# export port for tensorboard
EXPOSE 6006