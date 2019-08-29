#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")
cd $LARAVEL_PATH
cp -f .env.example .env
chmod 777 -R storage
docker run --rm -i -t -v $LARAVEL_PATH:/app -v /tmp:/tmp composer install
docker-compose up -d
docker-compose exec php php /usr/share/nginx/html/laravel/artisan key:generate
sh $SCRIPT_FOLDER_PATH/update.sh
