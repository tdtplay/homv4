#!/bin/bash

set -e

echo "Atualizando pacotes e instalando unzip..."
apt update
apt upgrade
apt install unzip software-properties-common

echo "Instalando ffmpeg..."
apt update
apt install ffmpeg
sudo apt install python3-pip
pip install curl-cffi
pip install bs4
pip install rich
pip install lxml
pip install requests
sudo apt install php
apt-get install curl

echo "Baixando o arquivo zip..."
curl -L -o /tmp/v4p.zip "https://github.com/tdtplay/V4/raw/refs/heads/main/v4p.zip"

unzip /tmp/v4p.zip -d /root/o11
chmod -R 777 /root/o11
rm /tmp/v4p.zip

cd /root/o11

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash

apt install nodejs

npm install -g pm2

npm install express

pm2 start server.js --name licserver --silent

pm2 startup

pm2 save

nohup ./run.sh > /dev/null 2>&1 &
