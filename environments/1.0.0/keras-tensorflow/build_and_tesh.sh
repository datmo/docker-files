docker build -f Dockerfile.py2 -t datmo/keras-tensorflow:py27-cpu .
docker build -f Dockerfile.py2.gpu -t datmo/keras-tensorflow:py27-gpu .
docker build -f Dockerfile.py3 -t datmo/keras-tensorflow:py35-cpu .
docker build -f Dockerfile.py3.gpu -t datmo/keras-tensorflow:py35-gpu .
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:py27-cpu python /tmp/keras_tensorflow_test.py
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:py27-gpu python /tmp/keras_tensorflow_test.py
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:py35-cpu python /tmp/keras_tensorflow_test.py
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:py35-gpu python /tmp/keras_tensorflow_test.py