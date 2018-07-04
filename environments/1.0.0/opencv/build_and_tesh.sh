docker build -f Dockerfile.py2 -t datmo/opencv:py27-cpu .
docker build -f Dockerfile.py2.gpu -t datmo/opencv:py27-gpu .
docker build -f Dockerfile.py3 -t datmo/opencv:py35-cpu .
docker build -f Dockerfile.py3.gpu -t datmo/opencv:py35-gpu .
docker run -v $PWD:/tmp/ -t datmo/opencv:py27-cpu python /tmp/opencv_test.py
docker run -v $PWD:/tmp/ -t datmo/opencv:py27-gpu python /tmp/opencv_test.py
docker run -v $PWD:/tmp/ -t datmo/opencv:py35-cpu python /tmp/opencv_test.py
docker run -v $PWD:/tmp/ -t datmo/opencv:py35-gpu python /tmp/opencv_test.py