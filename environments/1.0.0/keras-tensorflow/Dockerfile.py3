FROM datmo/opencv:cpu-py35

MAINTAINER Datmo devs <dev@datmo.com>

# Install datmo
RUN pip install datmo

ARG TENSORFLOW_VERSION=1.9.0
ARG KERAS_VERSION=2.1.6

RUN pip install tensorflow==${TENSORFLOW_VERSION}

# Install Keras and tflearn
# TODO: move h5py into dl-python base
RUN pip --no-cache-dir install \
        git+git://github.com/fchollet/keras.git@${KERAS_VERSION} \
        tflearn==0.3.2 \
    && rm -rf /pip_pkg \
    && rm -rf /tmp/* \
    && rm -rf /root/.cache

# export port for tensorboard
EXPOSE 6006