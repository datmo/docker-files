docker build -t keras:ubuntu-14.04 .
docker rm keras || true
docker run --rm --name keras keras:ubuntu-14.04 python /test/keras_test.py

