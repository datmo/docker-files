docker build -t keras:14.04 .
docker rm keras || true
docker run --rm --name keras keras:14.04 python /test/keras_test.py

