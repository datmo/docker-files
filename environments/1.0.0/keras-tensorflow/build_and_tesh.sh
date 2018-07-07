docker build -f Dockerfile.py2 -t datmo/keras-tensorflow:cpu-py27 .
docker build -f Dockerfile.py2.gpu -t datmo/keras-tensorflow:gpu-py27 .
docker build -f Dockerfile.py3 -t datmo/keras-tensorflow:cpu-py35 .
docker build -f Dockerfile.py3.gpu -t datmo/keras-tensorflow:gpu-py35 .
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:cpu-py27 python /tmp/keras_tensorflow_test.py
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:gpu-py27 python /tmp/keras_tensorflow_test.py
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:cpu-py35 python /tmp/keras_tensorflow_test.py
docker run -v $PWD:/tmp/ -t datmo/keras-tensorflow:gpu-py35 python /tmp/keras_tensorflow_test.py