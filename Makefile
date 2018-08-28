
.PHONY: all build_docker_images

DOCKER_BUILDS = $(shell ls ./docker)

all: build_docker_images

build_docker_images: $(DOCKER_BUILDS)

$(DOCKER_BUILDS):
	cd docker/$@ && \
	docker build -t mozillarelops/bsdpy_$@:latest .
	docker push mozillarelops/bsdpy_$@:latest

