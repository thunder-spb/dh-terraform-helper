.ONESHELL:
SHELL := /bin/bash
.DEFAULT_GOAL := help
$(V).SILENT:

DIR := ${CURDIR}

IMAGE_NAME := thunderspb/terraform-helper
DOCKER := $(shell command -v docker)

build:
	$(DOCKER) build --tag $(IMAGE_NAME):latest .

push: ## Push built container to Docker Hub
	$(DOCKER) push $(IMAGE_NAME):latest

.PHONY: help
help: ## Show this usage message
	@printf "\n%s\n\n" "usage: make <target>"
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"
