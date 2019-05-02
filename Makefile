.PHONY: install
install:
	docker run --volume `pwd`/services/neos:/app -it --rm composer install

.PHONY: start-db-in-docker
start-db-in-docker:
	docker-compose up -d db

.PHONY: start-in-docker
start-in-docker:
	docker-compose up app

.PHONY: start
start: start-db-in-docker
	./services/neos/flow server:run
