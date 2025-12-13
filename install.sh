#!/bin/bash

set -e

echo "Atualizando pacotes e instalando unzip..."
apt update
apt upgrade
apt install unzip software-properties-common

echo "Instalando ffmpeg..."
apt update && apt install -y sudo
apt install ffmpeg
apt install python3-pip
pip install curl-cffi
pip install bs4
pip install rich
pip install lxml
pip install requests
pip install colorama

echo "Baixando o arquivo zip..."
curl -L -o /tmp/o11Hom.zip "https://github.com/tdtplay/homv4/raw/refs/heads/main/o11Hom.zip"

unzip /tmp/v4p.zip -d /home/o11
chmod -R 777 /home/o11
rm /tmp/o11Hom.zip

cd /home/o11

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash

apt install nodejs

npm install -g pm2

npm install express

pm2 start server.js --name licserver --silent

pm2 startup

pm2 save

nohup ./run.sh > /dev/null 2>&1 &
