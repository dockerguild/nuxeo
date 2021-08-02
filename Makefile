-include .env
-include .env.local
-include .env.$(APP_ENV)
-include .env.$(APP_ENV).local
export

COMPOSE_PROJECT_NAME := "$(APP_NAME)_$(APP_INSTANCE)"

CONTAINER_APP := app
CONTAINER_DATABASE := database

DOCKER_APP := "$(APP_NAME)_$(CONTAINER_APP)_$(APP_INSTANCE)"
DOCKER_DATABASE := "$(APP_NAME)_$(CONTAINER_DATABASE)_$(APP_INSTANCE)"

SUDO := $(shell sh -c "if [ 0 != $EUID ]; then echo 'sudo'; fi")
KERNEL := $(shell sh -c "uname")

-include ./.make/docker
-include ./.make/git

## ----------------------------------------------------------
## Main
## ----------------------------------------------------------
.PHONY: install update start restart down

install:
	make docker/start
	$(SUDO) cp "$(PWD)/config/nginx/proxy.conf" "/etc/nginx/sites-enabled/nuxeo.conf"
	$(SUDO) service nginx restart

update:
	make docker/down
	make git/update
	make docker/start

start:
	make docker/start

restart:
	make docker/restart

down:
	make docker/down
