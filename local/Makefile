#!/usr/bin/env bash

all: help

help: ## ヘルプ表示
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

dressup-store-init: ##: docker store build && up
	docker-compose -f docker-compose.store.yml up --build

dressup-build: ##: docker build && up
	docker-compose -f docker-compose.yml up --build

dressup: ##: docker start
	docker-compose -f docker-compose.yml up

clean: ##: docker clean up
	make clean-container && make clean-image

clean-image: ##: docker remove unused images
	docker image prune -f

clean-container: ##: docker remove all stopped containers
	docker container prune -f