docker build -t tensorflow:14.04 .
docker rm tf || true
docker run --rm --name tf tensorflow:14.04 python /test/tensorflow_test.py

