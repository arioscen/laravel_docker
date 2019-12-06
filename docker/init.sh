#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")

cp -f $LARAVEL_PATH/.env.example $LARAVEL_PATH/.env
echo 'LARAVEL_PATH='$LARAVEL_PATH >> .env
echo 'DOCKER_PATH='$LARAVEL_PATH'/docker' >> .env
chmod 777 -R $LARAVEL_PATH/storage
# sudo docker run --rm -v $LARAVEL_PATH:/app -v /tmp:/tmp composer install --ignore-platform-reqs
# sudo docker-compose up -d
# sudo docker-compose exec php php /usr/share/nginx/html/laravel/artisan key:generate

# sudo sh $SCRIPT_FOLDER_PATH/update.sh
