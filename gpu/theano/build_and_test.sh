docker build -t theano_gpu:14.04 .
docker rm theano_gpu || true
nvidia-docker run --rm --name theano_gpu theano_gpu:14.04 python /test/theano_test.py

