Docker-files - acusensehub
==========================
This provides one place location for Dockerfiles for most AI frameworks and tools.
The docker images are pushed to public dockerhub/acusensehub repository. Aim of this
repository is to find all dependencies and being able to build stable images to be
usable for all dev/production AI applications.

How to Build
============

All the images can be built independently except keras. Please build tensorflow cpu
before building keras image. Base image for keras image is tensorflow:14.04.


Caffe already provides Dockerfiles for both gpu and cpu.

Reference
=========
 * Nvidia docker images
   + https://hub.docker.com/r/nvidia/cuda/
   + https://github.com/NVIDIA/nvidia-docker/wiki/Third-party
   + https://devblogs.nvidia.com/parallelforall/nvidia-docker-gpu-server-application-deployment-made-easy/
 * Tensorflow
   + https://www.tensorflow.org/install/install_linux  
   + https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker
 * Theano
   + http://deeplearning.net/software/theano/install_ubuntu.html
 * Keras
   + https://keras.io/#installation
 * Caffe
   + https://github.com/BVLC/caffe/tree/master/docker
