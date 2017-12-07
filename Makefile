# This Makefile just bundles together some convenient commands that
# you may want to run.

VERSION=0.1
TAG=compile-o-rama

docker:
	docker build -t ${TAG}:${VERSION} . 

run: run-docker
run-docker:
	docker run -it ${TAG}:${VERSION}


.PHONY: run docker run-docker
