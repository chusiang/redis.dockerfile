DOCKER_REPO = chusiang/redis

.PHONY: all build run run_conf logs clean stop rm prune

all: run logs

build:
	docker build -t ${DOCKER_REPO} .

run:
	docker run --name some-redis -p 6379:6379 -d ${DOCKER_REPO}

run_conf:
	docker run --name some-redis -p 6379:6379 -v redis.conf:/usr/local/etc/redis/redis.conf -d ${DOCKER_REPO}

logs:
	docker logs -f some-redis

clean: stop rm

stop:
	docker stop some-redis

rm:
	docker rm some-redis

prune:
	docker rmi ${DOCKER_REPO}
