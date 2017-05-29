docker build -t opencv-scikit:ubuntu-14.04 .
docker rm opencv-scikit || true
docker run --rm --name opencv-scikit opencv-scikit:ubuntu-14.04 python /test/opencv_scikit_test.py