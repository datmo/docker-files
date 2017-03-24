docker build -t theano_gpu:14.04 .
docker rm theano_gpu || true
nvidia-docker run --rm --name theano_gpu -e 'THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32' theano_gpu:14.04 python /test/theano_test.py

