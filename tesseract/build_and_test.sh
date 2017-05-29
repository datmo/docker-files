docker build -t tesseract:ubuntu-14.04 .
docker rm tesseract || true
docker run --rm --name tesseract tesseract:ubuntu-14.04 bash /test/tesseract_test.py