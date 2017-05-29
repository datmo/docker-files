docker build -t tensorflow_gpu:ubuntu-14.04 .
docker rm tf_gpu || true
nvidia-docker run --rm --name tf_gpu tensorflow_gpu:ubuntu-14.04 python /test/tensorflow_gpu_test.py

