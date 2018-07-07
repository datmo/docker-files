FROM datmo/opencv:cpu-py35

MAINTAINER Datmo devs <dev@datmo.com>

ARG TENSORFLOW_VERSION=1.8.0
ARG KERAS_VERSION=2.1.6

# Install TensorFlow
RUN pip --no-cache-dir install tensorflow==${TENSORFLOW_VERSION}

# Install Keras
RUN pip --no-cache-dir install git+git://github.com/fchollet/keras.git@${KERAS_VERSION}

# Export port for tensorboard
EXPOSE 6006