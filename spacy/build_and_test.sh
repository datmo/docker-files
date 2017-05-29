docker build -t spacy:ubuntu-14.04 .
docker rm spacy || true
docker run --rm --name spacy spacy:ubunut-14.04 python /test/spacy_test.py