docker build -f Dockerfile.py2 -t datmo/pytorch:cpu-py27 .
docker build -f Dockerfile.py2.gpu -t datmo/pytorch:gpu-py27 .
docker build -f Dockerfile.py3 -t datmo/pytorch:cpu-py35 .
docker build -f Dockerfile.py3.gpu -t datmo/pytorch:gpu-py35 .
docker run -v $PWD:/tmp/ -t datmo/pytorch:cpu-py27 python /tmp/pytorch_test.py
docker run -v $PWD:/tmp/ -t datmo/pytorch:gpu-py27 python /tmp/pytorch_test.py
docker run -v $PWD:/tmp/ -t datmo/pytorch:cpu-py35 python /tmp/pytorch_test.py
docker run -v $PWD:/tmp/ -t datmo/pytorch:gpu-py35 python /tmp/pytorch_test.py