__REPOS_SH="./repos/repos.sh"

init:
	@sh "${__REPOS_SH}" init

build:
	docker-compose -f docker-compose.yml build --no-cache

dressup:
	docker-compose -f docker-compose.yml up --remove-orphans
