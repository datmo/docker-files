FROM datmo/pytorch:cpu-py35

MAINTAINER Datmo devs <dev@datmo.com>

# Jupyter
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        notebook==5.4.0 \
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