docker build -f Dockerfile.py2 -t datmo/data-analytics:py27-cpu .
docker build -f Dockerfile.py2.gpu -t datmo/data-analytics:py27-gpu .
docker build -f Dockerfile.py3 -t datmo/data-analytics:py35-cpu .
docker build -f Dockerfile.py3.gpu -t datmo/data-analytics:py35-gpu .
docker run -v $PWD:/tmp/ -t datmo/data-analytics:py27-cpu python /tmp/data_analytics_test.py
docker run -v $PWD:/tmp/ -t datmo/data-analytics:py27-gpu python /tmp/data_analytics_test.py
docker run -v $PWD:/tmp/ -t datmo/data-analytics:py35-cpu python /tmp/data_analytics_test.py
docker run -v $PWD:/tmp/ -t datmo/data-analytics:py35-gpu python /tmp/data_analytics_test.py