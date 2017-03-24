docker build -t theano:14.04 .
docker rm theano || true
docker run --rm --name theano theano:14.04 python /test/theano_test.py

