docker build -t datadotworld:ubuntu-14.04 .
docker rm datadotworld || true
docker run --rm --name datadotworld datadotworld:ubuntu-14.04 python /test/datadotworld_test.py
