docker build -t opencv-scikit:14.04 .
docker rm opencv-scikit || true
docker run --rm --name opencv-scikit opencv-scikit:14.04 python /test/opencv_scikit_test.py