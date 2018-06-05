#!/usr/bin/env bash

all: help

help: ## ヘルプ表示
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

dressup: ##: docker start
	docker-compose build --force-rm && docker-compose up

run: ##: docker-compose up
	docker-compose up

clean: ##: docker clean up
	make clean-container && make clean-image

clean-image: ##: docker remove unused images
	docker image prune -f

clean-container: ##: docker remove all stopped containers
	docker container prune -f