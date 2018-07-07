docker build -f Dockerfile.py2 -t datmo/data-analytics:cpu-py27 .
docker build -f Dockerfile.py2.gpu -t datmo/data-analytics:gpu-py27 .
docker build -f Dockerfile.py3 -t datmo/data-analytics:cpu-py35 .
docker build -f Dockerfile.py3.gpu -t datmo/data-analytics:gpu-py35 .
docker run -v $PWD:/tmp/ -t datmo/data-analytics:cpu-py27 python /tmp/data_analytics_test.py
docker run -v $PWD:/tmp/ -t datmo/data-analytics:gpu-py27 python /tmp/data_analytics_test.py
docker run -v $PWD:/tmp/ -t datmo/data-analytics:cpu-py35 python /tmp/data_analytics_test.py
docker run -v $PWD:/tmp/ -t datmo/data-analytics:gpu-py35 python /tmp/data_analytics_test.py