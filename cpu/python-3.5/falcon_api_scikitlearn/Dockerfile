FROM ubuntu
RUN \
    apt-get update \
    && apt-get install -y \
        build-essential \
        libatlas-dev \
        libatlas3-base \
        python3 \
        python3-dev \
        python3-setuptools \
        python3-pip \
        python3-numpy \
        python3-matplotlib \
        python3-scipy \
        python3-pandas \
        ipython3 \
    && update-alternatives --set libblas.so.3      /usr/lib/atlas-base/atlas/libblas.so.3 \
    && update-alternatives --set liblapack.so.3    /usr/lib/atlas-base/atlas/liblapack.so.3 \
    && pip3 install -U scikit-learn \
    && pip3 install falcon \
    && pip3 install gunicorn \
    && /usr/bin/python3 -c "import matplotlib.pyplot"
EXPOSE 8000