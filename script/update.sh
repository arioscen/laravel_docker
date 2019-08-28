#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")
docker run --rm -i -t -v $LARAVEL_PATH:/app -v /tmp:/tmp composer install
docker-compose exec php php /usr/share/nginx/html/laravel/artisan migrate
