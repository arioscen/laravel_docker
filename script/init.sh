#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")
sh $SCRIPT_FOLDER_PATH/update.sh
cd $LARAVEL_PATH
chmod 777 -R storage
cp -f .env.example .env
docker-compose up -d
docker-compose exec php php /usr/share/nginx/html/laravel/artisan key:generate