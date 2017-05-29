docker build -t caffe:ubuntu-14.04 .
docker rm keras || true
docker run --rm --name caffe caffe:ubuntu-14.04 python /test/caffe_test.py