docker build -t theano:ubuntu-14.04 .
docker rm theano || true
docker run --rm --name theano theano:ubuntu-14.04 python /test/theano_test.py

