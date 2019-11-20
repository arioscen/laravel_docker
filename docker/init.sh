#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")

echo $LARAVEL_PATH/.env.example $LARAVEL_PATH/.env
sudo chmod 777 -R $LARAVEL_PATH/storage
sudo chmod 777 -R $LARAVEL_PATH/public
sudo docker run --rm -v $LARAVEL_PATH:/app -v /tmp:/tmp composer install
sudo docker-compose exec php php /usr/share/nginx/html/laravel/artisan key:generate
sudo docker-compose exec -T php php /usr/share/nginx/html/laravel/artisan migrate
