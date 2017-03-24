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

# Optional dependencies for Theano

# Install cmake
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:george-edison55/cmake-3.x && \
    apt-get update && \
    apt-get install -y cmake
RUN pip install cython

RUN git clone https://github.com/Theano/libgpuarray.git && \
    cd libgpuarray && mkdir Build && cd Build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make && make install && \
    cd .. && python setup.py build && \
    python setup.py install

# Because for nvidia docker image LD_LIBRARY_PATH comes changed.
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

RUN pip install pycuda pydot-ng \
    git+https://github.com/lebedov/scikit-cuda.git#egg=scikit-cuda

RUN mkdir -p /test
COPY theano_test.py /test/
 
