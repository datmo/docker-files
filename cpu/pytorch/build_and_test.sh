docker build -t pytorch:14.04 .
docker rm pytorch || true
docker run --rm --name theano pytorch:14.04 python /test/theano_test.py

