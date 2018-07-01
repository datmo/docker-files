ai-docker-files - [datmo DockerHub](https://hub.docker.com/u/datmo/)
====================================================================
The aim of this repository is to have one place location to find Dockerfiles for most AI
frameworks and tools. The docker images are pushed to public dockerhub/datmo
repository. This is used along with datmo workflow [tool](https://github.com/datmo/datmo) 

Structure
============
1. Base image: There are base image for CPU and GPU, followed by combination of py2.7 and py3.5 

    a. datmo/python-base:py35-cpu             
    b. datmo/python-base:py35-gpu   
    c. datmo/python-base:py27-cpu   
    d. datmo/python-base:py27-gpu
    
2. Environments: There are two ways in creating an environment,
 
    a. Using the above base image, environments are created. (e.g. datmo/keras-tensorflow:py27-cpu). This is reliable since these are by datmo team.     
    b. Using any dockerhub image, (e.g. kaggle/python:latest)      

3. Using environments as the base image, workspaces are added. Currently, there are three workspace. 
    a. Jupyter Notebook
    b. Jupyterlab
    c. RStudio
   
How to Build a new Environment?
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
 * XGBoost
   + This Dockerfile is for libraries such as sklearn, pandas, scipy and xgboost
   + https://xgboost.readthedocs.io/en/latest/
 * catboost
   + This Dockerfile is for libraries such as sklearn, pandas, scipy and catboost
   + https://tech.yandex.com/catboost/doc/dg/concepts/python-usages-examples-docpage/
 * kaggle
   + Gives the environment of running projects in kaggle environment along with jupyter notebook capability
 * datadotworld
   + This Dockerfile is for libraries such as sklearn, pandas, scipy, xgboost and datadotworld
   + You can learn more about datadotworld [here](https://data.world/)



