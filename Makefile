.PHONY: help build

image_tag ?= $(shell git rev-parse HEAD)

help: ## display this help text and exit.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build an image from the Dockerifle in the directory.
	docker build --rm  -t dev.nryotaro/track-activity:$(image_tag) .