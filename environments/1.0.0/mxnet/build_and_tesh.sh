docker build -f Dockerfile.py2 -t datmo/mxnet:cpu-py27 .
docker build -f Dockerfile.py2.gpu -t datmo/mxnet:gpu-py27 .
docker build -f Dockerfile.py3 -t datmo/mxnet:cpu-py35 .
docker build -f Dockerfile.py3.gpu -t datmo/pytorch:gpu-py35 .
docker run -v $PWD:/tmp/ -t datmo/mxnet:cpu-py27 python /tmp/mxnet_test.py
docker run -v $PWD:/tmp/ -t datmo/mxnet:gpu-py27 python /tmp/mxnet_test.py
docker run -v $PWD:/tmp/ -t datmo/mxnet:cpu-py35 python /tmp/mxnet_test.py
docker run -v $PWD:/tmp/ -t datmo/mxnet:gpu-py35 python /tmp/mxnet_test.py