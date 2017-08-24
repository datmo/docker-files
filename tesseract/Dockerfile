FROM ubuntu:14.04
MAINTAINER Datmo devs <dev@datmo.io>

RUN apt-get update && apt-get install -y \
	autoconf \
	automake \
	libtool \
	autoconf-archive \
	pkg-config \
	libpng12-dev \
	libjpeg8-dev \
	libtiff5-dev \
	zlib1g-dev \
	libicu-dev \
	libpango1.0-dev \
	libcairo2-dev \
	python-numpy \
    python-scipy \
    python-dev \
    python-nose \
    g++ \
    libopenblas-dev \
	git \
	curl && \
	rm -rf /var/lib/apt/lists/*

RUN curl http://www.leptonica.org/source/leptonica-1.74.1.tar.gz -o leptonica-1.74.1.tar.gz && \
	tar -zxvf leptonica-1.74.1.tar.gz && \
	cd leptonica-1.74.1 && ./configure && make && make install && \
	cd .. && rm -rf leptonica*

RUN git clone --depth 1 https://github.com/tesseract-ocr/tesseract.git && \
	cd tesseract && \
	./autogen.sh && \
	./configure && \
	LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make && \
	make install && \
	ldconfig && \
	make training && \
	make training-install && \
	cd .. && rm -rf tesseract

# Get basic traineddata
RUN curl -LO https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata && \
	mv eng.traineddata /usr/local/share/tessdata/

RUN curl -LO https://github.com/tesseract-ocr/tessdata/raw/master/fra.traineddata && \
	mv fra.traineddata /usr/local/share/tessdata/

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# Install other useful Python packages using pip
RUN pip --no-cache-dir install --upgrade ipython && \
	pip --no-cache-dir install \
                        Cython \
                        ipykernel \
                        jupyter \
                        path.py \
                        Pillow \
                        pygments \
                        six \
                        sphinx \
                        wheel \
                        zmq \
                        && \
                    python -m ipykernel.kernelspec

#Jupyter notebook related configs
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /home/

#Adding flask
RUN pip install flask
EXPOSE 5000

WORKDIR /workspace
RUN chmod -R a+w /workspace