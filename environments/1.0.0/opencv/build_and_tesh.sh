docker build -f Dockerfile.py2 -t datmo/opencv:cpu-py27 .
docker build -f Dockerfile.py2.gpu -t datmo/opencv:gpu-py27 .
docker build -f Dockerfile.py3 -t datmo/opencv:cpu-py35 .
docker build -f Dockerfile.py3.gpu -t datmo/opencv:gpu-py35 .
docker run -v $PWD:/tmp/ -t datmo/opencv:cpu-py27 python /tmp/opencv_test.py
docker run -v $PWD:/tmp/ -t datmo/opencv:gpu-py27 python /tmp/opencv_test.py
docker run -v $PWD:/tmp/ -t datmo/opencv:cpu-py35 python /tmp/opencv_test.py
docker run -v $PWD:/tmp/ -t datmo/opencv:gpu-py35 python /tmp/opencv_test.py