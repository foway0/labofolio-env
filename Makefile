#!/usr/bin/env bash

__PWD=$(shell pwd)
__REPOS_SH="repos/repos.sh"

all: help

help: ## ヘルプ表示
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init: ##: 初回セットアップ
	$(__REPOS_SH) init

clean: ##: 初期状態にリセット
	$(__REPOS_SH) clean