ai-docker-files - acusensehub
=============================
The aim of this repository is to have one place location to find Dockerfiles for most AI
frameworks and tools. The docker images are pushed to public dockerhub/acusensehub
repository.

How to Build
============

All the images can be built independently except keras. Please build tensorflow cpu
before building keras image. Base image for keras image is tensorflow:14.04.

Test script for each has been provided.

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
 * Pytorch
   + https://github.com/pytorch/pytorch/blob/master/Dockerfile
 * Spacy
   + https://spacy.io/docs/usage/