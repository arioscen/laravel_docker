#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")

# sudo docker run --rm -v $LARAVEL_PATH:/app -v /tmp:/tmp composer install --ignore-platform-reqs
# sudo docker-compose exec -T php php /usr/share/nginx/html/laravel/artisan migrate
# sudo docker-compose exec -T php php /usr/share/nginx/html/laravel/artisan db:seed
# sudo docker run --rm -v $LARAVEL_PATH/:/home/node/app -w /home/node/app node npm install
# sudo docker run --rm -v $LARAVEL_PATH/:/home/node/app -w /home/node/app node npm run production
