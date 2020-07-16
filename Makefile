.PHONY: all

DOCKER  ?= docker
DOCKER_COMPOSE  ?= docker-compose
DOCKER_HOST_IP ?= 127.0.0.1
OPEN_CMD ?= open
GROUP ?= all
PROJECT_NAME ?= bi_tools_docker

build: docker-build
up: docker-up 
down: docker-down
kill: docker-kill
clean: docker-kill docker-clean

docker-build:	##@development build images
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) build --force-rm
docker-up:		##@development start stack
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) up -d
docker-down:	##@development kill process
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) down
docker-kill:	##@development kill process
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) kill
docker-clean:	 ##@development remove all containers in stack
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) rm -fv --all
	$(DOCKER_COMPOSE) down --rmi local --remove-orphans

docker-ls:
	$(DOCKER) container ls -a
docker-prune:
	$(DOCKER) image prune -f

bash-jupyter:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec jupyter bash
bash-mysql:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec mysql bash
bash-metabase:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec metabase bash
