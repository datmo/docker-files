FROM datmo/python-base:gpu-py27

MAINTAINER Datmo devs <dev@datmo.com>"

# Add Bazel distribution URI as a package source
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list \
    && curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

# Install some dependencies
RUN apt-get update && apt-get install -y \
        tcl \
        tk \
        ant \
        apt-utils \
        bazel \
        bc \
        build-essential \
        cmake \
        default-jdk \
        doxygen \
        gfortran \
        golang \
        iptables \
        libav-tools \
        libboost-all-dev \
        libeigen3-dev \
        libfreetype6-dev \
        libhdf5-dev \
        libjpeg-turbo8-dev \
        liblcms2-dev \
        libopenblas-dev \
        liblapack-dev \
        libpng12-dev \
        libprotobuf-dev \
        libsdl2-dev \
        libtiff-dev \
        libtiff5-dev \
        libvncserver-dev \
        libzmq3-dev \
        nano \
        net-tools \
        openmpi-bin \
    && update-alternatives --set libblas.so.3 /usr/lib/openblas-base/libblas.so.3

RUN pip --no-cache-dir install \
        Cython \
        h5py \
        matplotlib \
        numpy==1.14.5 \
        pandas \
        path.py \
        pyyaml \
        scipy \
        six \
        sklearn \
        sympy \
        Pillow \
        zmq \
        dlib \
        incremental \
        nltk \
        textacy \
        scikit-image \
        spacy \
        tqdm \
        wheel

# Install xgboost
RUN git clone --recursive https://github.com/dmlc/xgboost \
    && cd xgboost \
    && make -j$(nproc) \
    && cd python-package \
    && python setup.py install \
    && cd ../.. \
    && rm -rf xgboost