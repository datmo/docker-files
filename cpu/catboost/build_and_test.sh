docker build -t catboost:ubuntu-14.04 .
docker rm catboost || true
docker run --rm --name catboost catboost:ubuntu-14.04 python /test/catboost_test.py
