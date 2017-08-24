FROM ubuntu:14.04
MAINTAINER Datmo devs <dev@datmo.io>

RUN apt-get update; \
    apt-get install -y \
      python python-pip \
      python-numpy \
      python-scipy \
      build-essential \
      python-dev \
      python-setuptools \
      libatlas-dev \
      libatlas3gf-base

RUN update-alternatives --set libblas.so.3 \
      /usr/lib/atlas-base/atlas/libblas.so.3; \
    update-alternatives --set liblapack.so.3 \
      /usr/lib/atlas-base/atlas/liblapack.so.3

RUN pip install -U scikit-learn

# All other dependencies are more or less needed by building phase of OpenCV.
# The last "apt-get clean" command is needed to reduce Docker image size.
RUN apt-get upgrade -y \
&& apt-get install software-properties-common -y && add-apt-repository ppa:saiarcot895/myppa && apt-get update && apt-get -y install apt-fast \
&& apt-fast install -y \
                    build-essential \
                    cmake \
                    git \
                    pkg-config \
                    libgtk2.0-dev \
                    libavcodec-dev \
                    libavformat-dev \
                    libswscale-dev \
                    libtbb2 \
                    libtbb-dev \
                    libjpeg-dev \
                    libpng-dev \
                    libtiff-dev \
                    libjasper-dev \
                    libdc1394-22-dev \
                    libdc1394-22 \
                    libdc1394-utils \
                    libv4l-0 \
                    libv4l-dev \
                    libgl1-mesa-dev \
                    libgles1-mesa-dev \
                    libgles2-mesa-dev \
                    libopenvg1-mesa-dev \
                    libglu1-mesa-dev \
                    libgtkglext1 \
                    libgtkglext1-dev \
                    openjdk-7-jdk \
                    ant \
                    vtk6 \
                    libvtk6-dev \
                    && apt-get clean

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# Install other useful Python packages using pip
RUN pip install --upgrade ipython && \
	pip install \
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

# git clone the repo from OpenCV official repository on GitHub.
RUN mkdir /opt/opencv-build && cd /opt/opencv-build \
&& git clone https://github.com/Itseez/opencv && cd opencv \
&& git checkout master && mkdir build

WORKDIR /opt/opencv-build/opencv/build

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64

# OpenCV repository is kept but all building intermediate files are removed.
# All other dependencies is using the default settings from CMake file of OpenCV.
RUN cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/opt .. \
&& make -j2 && make install && make clean && cd .. && rm -rf build

# Let python can find the newly install OpenCV modules.
RUN echo '/opt/lib/python2.7/dist-packages/'>/usr/lib/python2.7/dist-packages/cv2.pth
RUN echo 'ln /dev/null /dev/raw1394' >> ~/.bashrc

#Jupyter notebook related configs
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /home/

#Adding flask
RUN pip install flask
EXPOSE 5000

WORKDIR /workspace
RUN chmod -R a+w /workspace

