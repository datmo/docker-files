FROM datmo/opencv:cpu-py35

MAINTAINER Datmo devs <dev@datmo.com>

# Install datmo
RUN pip install datmo

ARG PYTORCH_VERSION=0.4.0

# Install pytorch
RUN pip install http://download.pytorch.org/whl/cpu/torch-${PYTORCH_VERSION}-cp35-cp35m-linux_x86_64.whl
RUN pip install torchvision

# install tensorboardx
RUN pip install tensorboardX

# export port for tensorboard
EXPOSE 6006