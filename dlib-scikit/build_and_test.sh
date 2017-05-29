docker build -t dlib-scikit:ubuntu-14.04 .
docker rm dlib-scikit || true
docker run --rm --name dlib-scikit dlib-scikit:ubuntu-14.04 python /test/dlib_scikit_test.py

