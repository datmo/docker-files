docker build -t keras-theano:cpu .
docker rm keras-theano || true
docker run --rm --name keras-theano keras-theano:cpu python /test/keras_test.py

