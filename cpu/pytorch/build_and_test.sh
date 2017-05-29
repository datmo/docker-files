docker build -t pytorch:ubuntu-14.04 .
docker rm pytorch || true
docker run --rm --name theano pytorch:ubuntu-14.04 python /test/pytorch_test.py