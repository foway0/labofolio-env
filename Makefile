#!/usr/bin/env bash

__REPOS_SH="repos/repos.sh"

help: ## ヘルプ表示
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init: ##: 初回セットアップ
	$(__REPOS_SH)

build: ##: docker build
	docker-compose -f docker-compose.yml up --build

dressup: ##: docker start
	docker-compose -f docker-compose.yml up

setup: ##: cp env file
	cp -ir ./env_template/ .