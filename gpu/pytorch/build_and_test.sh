docker build -t pytorch_gpu:14.04 .
docker rm pytorch_gpu || true
nvidia-docker run --rm --name pytorch_gpu pytorch_gpu:14.04 python /test/pytorch_test.py