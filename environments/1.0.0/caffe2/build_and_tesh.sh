docker build -f Dockerfile -t datmo/caffe2:cpu .
docker build -f Dockerfile.gpu -t datmo/caffe2:gpu .
docker run -v $PWD:/tmp/ -t datmo/caffe2:cpu python /tmp/caffe_test.py
docker run -v $PWD:/tmp/ -t datmo/caffe2:gpu python /tmp/caffe_test.py