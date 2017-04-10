FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

MAINTAINER Acusense devs <dev@acusense.ai>

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install --upgrade ipython && \
    pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        sklearn \
        pandas \
        Pillow \
        && \
    python -m ipykernel.kernelspec


# Install TensorFlow CPU version from central repo
RUN pip --no-cache-dir install \
    https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.0.1-cp27-none-linux_x86_64.whl

ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Expose Ports for Tensorboard (6006) and Ipython (8888)
EXPOSE 6006 8888

WORKDIR /workspace
RUN chmod -R a+w /workspace
