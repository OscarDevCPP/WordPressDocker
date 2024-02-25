#!/bin/bash
DOCKER_COMPOSE_PATH = .docker
DOCKER_COMPOSE_FILE = ${DOCKER_COMPOSE_PATH}/docker-compose.yml

ifneq (,$(wildcard ${DOCKER_COMPOSE_PATH}/.env))
    include ${DOCKER_COMPOSE_PATH}/.env
    export
endif

DATABASE_CONTAINER = ${APP_NAME}-database

UID = $(shell id -u)

help: ## Show this help message
	@echo 'Welcome to ${APP_NAME} make'
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

run: ## Start the containers
	docker network create ${APP_NAME}-network || true
	U_ID=${UID} docker compose --project-directory=${DOCKER_COMPOSE_PATH} --file ${DOCKER_COMPOSE_FILE} up ${params}
	@echo 'SUCCESS!!! Start Work In WordpressDocker'
	docker ps

stop: ## Stop the containers
	U_ID=${UID} docker compose --project-directory=${DOCKER_COMPOSE_PATH} --file ${DOCKER_COMPOSE_FILE} stop
	@echo 'Stop WordpressDocker'
	docker ps

restart: ## Restart the containers
	$(MAKE) stop && $(MAKE) run
	@echo 'SUCCESS!!! Restart Work In WordpressDocker'
	docker ps

rebuild: ## Rebuilds all the containers
	U_ID=${UID} docker compose --project-directory=${DOCKER_COMPOSE_PATH} --file ${DOCKER_COMPOSE_FILE} build

mysql_cli: ## ssh's into the be container
	U_ID=${UID} docker exec -it --user ${UID} ${DATABASE_CONTAINER} mysql -u root -p${DB_ROOT_PASSWORD}
