docker build -t xgboost:ubuntu-14.04 .
docker rm xgboost || true
docker run --rm --name xgboost xgboost:ubuntu-14.04 python /test/xgboost_test.py
