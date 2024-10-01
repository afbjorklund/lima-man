
DOCKER = docker

IMAGE = pandoc

UID = $(shell id -u)
GID = $(shell id -g)

.PHONY: build
build: .image
	$(DOCKER) run --rm -v $(PWD):/pwd -w /pwd -u $(UID):$(GID) $(IMAGE) make -C manual dist

.image: Dockerfile
	$(DOCKER) build -t $(IMAGE) . && echo $(IMAGE) >$@

