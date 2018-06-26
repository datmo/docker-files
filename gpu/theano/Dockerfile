FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04
MAINTAINER Datmo devs <dev@datmo.io>
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
    apt-get install -y cmake git
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

# Install other useful Python packages using pip
RUN pip --no-cache-dir install --upgrade ipython && \
	pip --no-cache-dir install \
		Cython \
		ipykernel \
		jupyter \
		path.py \
		Pillow \
		pygments \
		six \
		sphinx \
		wheel \
		zmq \
		&& \
	python -m ipykernel.kernelspec

# Install OpenCV
RUN apt-get update && apt-get install -y libopencv-dev python-opencv && \
    echo 'ln /dev/null /dev/raw1394' >> ~/.bashrc

#Jupyter notebook related configs
COPY jupyter_notebook_config.py /root/.jupyter/
# Expose Ports for Ipython (8888)
EXPOSE 8888

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /home/

#Adding flask
RUN pip install flask
EXPOSE 5000

WORKDIR /workspace
RUN chmod -R a+w /workspace
