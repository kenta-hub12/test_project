build:
	docker-compose build
	docker-compose up -d

build-no-cache:
	docker-compose build --no-cache
	docker-compose up -d

start:
	docker-compose up -d

restart:
	docker-compose down
	docker-compose up -d

init-setting:
	docker-compose exec test_project-php-apache bash -c "composer install"
	docker-compose exec test_project-php-apache bash -c "cp .env.example_for_docker .env"
	docker-compose exec test_project-php-apache bash -c "php artisan key:generate"
	docker-compose exec test_project-php-apache bash -c "php artisan storage:link"
	docker-compose exec test_project-php-apache bash -c "cp -r tmp/hp storage/app/public"
	docker-compose exec test_project-php-apache bash -c "cp -r tmp/top storage/app/public"
	docker-compose exec test_project-php-apache bash -c "npm install"

run-dev:
	docker-compose exec test_project-php-apache bash -c "npm run dev"

migrate:
	docker-compose exec test_project-php-apache bash -c "php artisan migrate:fresh"

migrate-seed:
	docker-compose exec test_project-php-apache bash -c "php artisan migrate:fresh --seed"

init-build:
	make build; make start; make init-setting; make migrate-seed; make run-dev;

init-img:
	storage/app/public
