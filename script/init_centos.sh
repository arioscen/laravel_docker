#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_FOLDER_PATH=$(dirname "$SCRIPT_PATH")
LARAVEL_PATH=$(dirname "$SCRIPT_FOLDER_PATH")

echo 'install environment...'
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl enable docker
sudo systemctl restart docker
docker --version
docker-compose --version
echo 'install environment done'

echo 'setting work path for drone update...'
echo LARAVEL_PATH=$LARAVEL_PATH >> ~/.bashrc
source ~/.bashrc
echo 'setting work path for drone update done'

echo 'workspace default setting...'
cd $LARAVEL_PATH
cp -f .env.example .env
chmod 777 -R storage
echo 'workspace default setting done'

echo 'run docker...'
cd $LARAVEL_PATH
sudo docker run --rm -v $LARAVEL_PATH:/app -v /tmp:/tmp composer install
sudo docker-compose up -d
sudo docker-compose exec php php /usr/share/nginx/html/laravel/artisan key:generate
echo 'run docker done'

echo 'run update script...'
sudo sh $SCRIPT_FOLDER_PATH/update.sh
echo 'run update script done'
