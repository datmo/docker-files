FROM datmo/theano:cpu
MAINTAINER Datmo devs <dev@datmo.io>

# h5py is optional dependency for keras
RUN apt-get update && apt-get install -y libhdf5-dev libhdf5-serial-dev
RUN pip install keras h5py

WORKDIR /workspace
RUN chmod -R a+w /workspace
