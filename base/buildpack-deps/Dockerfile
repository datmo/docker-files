FROM buildpack-deps:xenial

MAINTAINER datmo "dev@datmo.com"

RUN apt-get update && apt-get install -y --no-install-recommends \
		sudo \
	&& rm -rf /var/lib/apt/lists/*