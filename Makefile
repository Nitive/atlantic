NEOS_DIR=./services/neos

.PHONY: install-composer
install-composer:
	sh ./install-composer.sh

.PHONY: install
install: install-composer
	cd $(NEOS_DIR) && composer install

.PHONY: start-db-in-docker
start-db-in-docker:
	docker-compose up -d db

.PHONY: start
start: start-db-in-docker
	cd $(NEOS_DIR) && ./flow server:run
