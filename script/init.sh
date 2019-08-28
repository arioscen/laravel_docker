#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")
chmod 777 -R $LARAVEL_PATH/storage
cp -f $LARAVEL_PATH/.env.example $LARAVEL_PATH/.env
docker-compose -f $LARAVEL_PATH/docker-compose.yml up -d
docker-compose -f $LARAVEL_PATH/docker-compose.yml exec php /usr/share/nginx/html/laravel/artisan key:generate
sh $SCRIPT_FOLDER_PATH/update.sh