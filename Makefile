#!/usr/bin/env bash

__REPOS_SH="repos/repos.sh"

help: ## ヘルプ表示
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init: ##: 初回セットアップ
	$(__REPOS_SH)