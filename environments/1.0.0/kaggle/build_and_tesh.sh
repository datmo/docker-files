docker build -f Dockerfile.kaggle -t datmo/kaggle:latest .
docker run -v $PWD:/tmp/ -t datmo/kaggle:latest python /tmp/kaggle_test.py