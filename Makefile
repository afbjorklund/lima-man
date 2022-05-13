
DOCKER = docker

IMAGE = pandoc

.PHONY: build
build: .image
	$(DOCKER) run --rm -v $(PWD):/pwd -w /pwd $(IMAGE) make -C manual dist

.image: Dockerfile
	$(DOCKER) build -t $(IMAGE) . && echo $(IMAGE) >$@

