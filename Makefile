#!/usr/bin/env bash

__REPOS_SH="repos/repos.sh"
__LINUX="extends/linux/build.sh"

all: help

help: ## ヘルプ表示
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init: ##: 初回セットアップ
	$(__REPOS_SH) init

clean: ##: 初期状態にリセット
	$(__REPOS_SH) clean

build: ##: docker build
	$(__LINUX)
	docker-compose -f docker-compose.yml up --build

build-detach: ##: docker build detach mode
	$(__LINUX)
	docker-compose -f docker-compose.yml up --build -d

dressup: ##: docker start
	docker-compose -f docker-compose.yml up

dressup-detach: ##: docker start detach mode
	docker-compose -f docker-compose.yml up -d

restart: ##: docker start
	docker-compose -f docker-compose.yml restart