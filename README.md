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

There are two approaches in creating an environment. 

1. Using the base images provided by datmo. These are following images,

   i. datmo/python-base:py35-cpu             
   ii. datmo/python-base:py35-gpu   
  iii. datmo/python-base:py27-cpu   
   iv. datmo/python-base:py27-gpu
  
  You can now create new installation as follows, 
  
    # the tag z is dependent on py27, py35 and cpu, gpu. one of the above images
    FROM datmo/python-base:z    
    
    # To install a python package
    RUN pip install <python-package-name>
    
    # To install apt-get package
    RUN apt-get install <package-name>
  
  This is a reliable image for ubuntu OS since these are maintained by datmo team. We also accepts PRs for any new environments.

2.Using any dockerhub image, (e.g. kaggle/python:latest).
  You can create new environment over this as the base image with new installation as follows,
   
    # an example for the base docker images is x/y:z is kaggle/python:latest
    FROM x/y:z    
    
    # To install a python package, based on what's installable on this base image
    RUN pip install <python-package-name>
    
    # To install apt-get package, based on what's installable on this base image
    RUN apt-get install <package-name>          

How to plugin workspaces to an Environment?
============

1. You can add Jupyter notebook to an environment along with files in `workspace-patches`, by adding the following code to your base environment docker image,

        # Jupyter
        RUN pip --no-cache-dir install \
                ipykernel \
                jupyter \
                && \
            python -m ipykernel.kernelspec
        
        # Set up our notebook config.
        COPY jupyter_notebook_config_py2.py /root/.jupyter/
        RUN mv /root/.jupyter/jupyter_notebook_config_py2.py /root/.jupyter/jupyter_notebook_config.py
        
        # Jupyter has issues with being run directly:
        #   https://github.com/ipython/ipython/issues/7062
        # We just add a little wrapper script.
        
        COPY run_jupyter.sh /
        RUN chmod +x /run_jupyter.sh
        
        # IPython
        EXPOSE 8888

2. You can add Jupyterlab to an environment along with files in `workspace-patches`, by adding the following code to your base environment docker image,

        # Jupyter
        RUN pip --no-cache-dir install \
                ipykernel \
                jupyter \
                && \
            python -m ipykernel.kernelspec
        
        # Set up our notebook config.
        COPY jupyter_notebook_config_py2.py /root/.jupyter/
        RUN mv /root/.jupyter/jupyter_notebook_config_py2.py /root/.jupyter/jupyter_notebook_config.py
        
        # Jupyter has issues with being run directly:
        #   https://github.com/ipython/ipython/issues/7062
        # We just add a little wrapper script.
        
        COPY run_jupyter.sh /
        RUN chmod +x /run_jupyter.sh
        
        # Jupyter lab
        RUN pip install jupyterlab==0.32.1
        
        # IPython
        EXPOSE 8888

3. You can add RStudio to an environment along with files in `workspace-patches`, by adding the following code to your base or environment docker image,

        # Rstudio
        ENV DEBIAN_FRONTEND noninteractive
        ENV CRAN_URL https://cloud.r-project.org/
        
        RUN set -e \
              && ln -sf /bin/bash /bin/sh
        
        RUN set -e \
              && apt-get -y update \
              && apt-get -y dist-upgrade \
              && apt-get -y install apt-transport-https gdebi-core libapparmor1 libcurl4-openssl-dev \
                                    libssl-dev libxml2-dev pandoc r-base \
              && apt-get -y autoremove \
              && apt-get clean
        
        RUN set -e \
              && R -e "\
              update.packages(ask = FALSE, repos = '${CRAN_URL}'); \
              pkgs <- c('dbplyr', 'devtools', 'docopt', 'doParallel', 'foreach', 'gridExtra', 'rmarkdown', 'tidyverse'); \
              install.packages(pkgs = pkgs, dependencies = TRUE, repos = '${CRAN_URL}'); \
              sapply(pkgs, require, character.only = TRUE);"
        
        RUN set -e \
              && curl -sS https://s3.amazonaws.com/rstudio-server/current.ver \
                | xargs -I {} curl -sS http://download2.rstudio.org/rstudio-server-{}-amd64.deb -o /tmp/rstudio.deb \
              && gdebi -n /tmp/rstudio.deb \
              && rm -rf /tmp/rstudio.deb
        
        RUN set -e \
              && useradd -m -d /home rstudio \
              && echo rstudio:rstudio \
                | chpasswd
        
        # expose for rstudio
        EXPOSE 8787

Reference
=========
 * Nvidia docker images
   + https://hub.docker.com/r/nvidia/cuda/
   + https://github.com/NVIDIA/nvidia-docker/wiki/Third-party 
   + https://devblogs.nvidia.com/parallelforall/nvidia-docker-gpu-server-application-deployment-made-easy/      
 * Tensorflow
   + https://www.tensorflow.org/install/install_linux  
   + https://github.com/floydhub/dockerfiles
   + https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker
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
 * kaggle
   + Gives the environment of running projects in kaggle environment along with jupyter notebook capability



