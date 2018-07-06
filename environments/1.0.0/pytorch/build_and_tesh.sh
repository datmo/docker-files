docker build -f Dockerfile.py2 -t datmo/pytorch:py27-cpu .
docker build -f Dockerfile.py2.gpu -t datmo/pytorch:py27-gpu .
docker build -f Dockerfile.py3 -t datmo/pytorch:py35-cpu .
docker build -f Dockerfile.py3.gpu -t datmo/pytorch:py35-gpu .
docker run -v $PWD:/tmp/ -t datmo/pytorch:py27-cpu python /tmp/pytorch_test.py
docker run -v $PWD:/tmp/ -t datmo/pytorch:py27-gpu python /tmp/pytorch_test.py
docker run -v $PWD:/tmp/ -t datmo/pytorch:py35-cpu python /tmp/pytorch_test.py
docker run -v $PWD:/tmp/ -t datmo/pytorch:py35-gpu python /tmp/pytorch_test.py