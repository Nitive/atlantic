.PHONY: install-composer
install-composer:
	sh ./install-composer.sh

.PHONY: install
install: install-composer
	docker run --volume `pwd`/services/neos:/app -it --rm composer install

create-project:
	docker run --volume `pwd`/services/neos:/app -it --rm composer create-project neos/neos-base-distribution /app

.PHONY: update
update:
	docker run --volume `pwd`/services/neos:/app -it --rm composer update

.PHONY: start-db-in-docker
start-db-in-docker:
	docker-compose up -d db

.PHONY: start-in-docker
start-in-docker:
	docker-compose up app

.PHONY: start
start: start-db-in-docker
	./services/neos/flow server:run
