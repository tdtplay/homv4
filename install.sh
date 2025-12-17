#!/bin/bash

set -e

echo "Atualizando pacotes e instalando unzip..."
apt update
apt upgrade
apt install unzip software-properties-common

echo "Instalando ffmpeg..."
apt update && apt install -y sudo
apt install ffmpeg

echo "Baixando o arquivo zip..."
curl -L -o /tmp/homo11.zip "https://github.com/tdtplay/homv4/raw/refs/heads/main/homo11.zip"

unzip /tmp/homo11.zip -d /home
chmod -R 777 /home/o11
rm /tmp/homo11.zip

cd /home/o11

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash

apt install nodejs

npm install -g pm2

npm install express

pm2 start server.js --name licserver --silent

pm2 startup

pm2 save

nohup ./run.sh > /dev/null 2>&1 &
