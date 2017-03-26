docker build -t spacy:14.04 .
docker rm spacy || true
docker run --rm --name spacy spacy:14.04 python /test/spacy_test.py