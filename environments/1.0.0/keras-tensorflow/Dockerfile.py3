FROM datmo/dl-deps:cpu-py35

MAINTAINER Datmo devs <dev@datmo.com>

ARG TENSORFLOW_VERSION=1.8.0
ARG TENSORFLOW_ARCH=cpu
ARG KERAS_VERSION=2.1.6

# Install TensorFlow
RUN pip --no-cache-dir install \
	https://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_ARCH}/tensorflow_${TENSORFLOW_ARCH}-${TENSORFLOW_VERSION}-cp27-none-linux_x86_64.whl

# Install Keras
RUN pip --no-cache-dir install git+git://github.com/fchollet/keras.git@${KERAS_VERSION}