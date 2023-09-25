# default make task
all: build

# generate updated requirements.txt
requirements.txt:
	pdm export -f requirements -p ./src --without-hashes > src/requirements.txt

# generate the built container from updated requirements.txt
build: requirements.txt
	docker-compose build

# start services
start:
	docker-compose up -d --build

# stop the services
stop:
	docker-compose stop

# remove all containers/services and volumes
clean:
	docker-compose down --volumes

# view logs from web service
logs:
	docker-compose logs -f web

# start a shell inside the web container
shell:
	docker-compose exec web /bin/sh

# run unit tests
test:
	docker-compose exec web pytest .

# run psql shell inside db container
psql:
	docker-compose exec db psql --username=hello_fastapi --dbname=hello_fastapi_dev

# targets that don't refer to actual files
.PHONY: all build start stop clean psql
