FROM tensorflow:14.04

# h5py is optional dependency for keras
RUN apt-get update && apt-get install -y libhdf5-dev libhdf5-serial-dev
RUN pip install keras h5py

RUN mkdir -p /test/
COPY keras_test.py /test/keras_test.py
