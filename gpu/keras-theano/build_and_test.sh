docker build -t keras-theano:gpu .
docker rm keras-theano || true
docker run --rm --name keras-theano keras-theano:gpu python /test/keras_test.py

