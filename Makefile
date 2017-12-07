# This Makefile just bundles together some convenient commands that
# you may want to run.


docker:
	docker build -t compile-o-rama . 

run: run-docker
run-docker:
	docker run -it compile-o-rama


.PHONY: run docker run-docker
