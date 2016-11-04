EXERCISM_LANG := ecmascript

include ../docker.mk

install:: build deps

test::
	$(DOCKER_RUN) npm test

clean::
	rm -rf node_modules
	rm -rf jest

deps:
	$(DOCKER_RUN) yarn install
