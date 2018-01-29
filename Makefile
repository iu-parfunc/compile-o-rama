# This Makefile just bundles together some convenient commands that
# you may want to run.

VERSION=0.1
TAG=compile-o-rama

docker:
	docker build -t ${TAG}:${VERSION} . 

run: run-docker
run-docker:
	docker run -it ${TAG}:${VERSION}



# The next layer includes systems for distributed, multi-node languages & runtimes:
DIST_TAG=dist-compile-o-rama
DIST_VERSION=0.1

docker2: docker
	docker build -t ${DIST_TAG}:${DIST_VERSION} -f Dockerfile.dist .

run2: run-docker2
run-docker2:
	docker run -it ${DIST_TAG}:${DIST_VERSION}


.PHONY: run docker run-docker docker2
