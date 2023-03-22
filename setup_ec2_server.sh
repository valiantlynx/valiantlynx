#!/bin/bash
echo "logged in"
echo "Update ubuntu"
sleep 3
sudo apt-get update
echo "Initialize install git"
sleep 3
sudo apt-get install git
echo "Initialize install ca-certificates"
sleep 3
#sudo git clone https://github.com/edatut/gunidocker.git
sudo apt-get install  ca-certificates
echo "Initialize install curl"
sleep 3
sudo apt-get install  curl
echo "Initialize install gnupg"
sleep 3
sudo apt-get install gnupg
echo "Initialize install ca-certificates"
sleep 3
sudo apt-get install lsb-release
echo "starting docker setup"
sleep 3

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Initialize install docker.io"
sleep 3

sudo apt install docker.io
echo "Initialize install docker compose"
sleep 3
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "Initialize execute permissions for docker compose"
sleep 3
sudo chmod +x /usr/local/bin/docker-compose
echo "starting nginx setup"
echo "Initialize install nginx "
sleep 3

sudo apt install nginx
echo "Initialize install snapd "
sleep 3
sudo apt install snapd
echo "Initialize install core "
sleep 3
sudo snap install core
echo "Initialize refresh core "
sleep 3
sudo snap refresh core
echo "Initialize install certbot "
sleep 3
sudo snap install --classic certbot
echo "Initialize ln -s /snap/bin/certbot /usr/bin/certbot "
sleep 3
sudo ln -s /snap/bin/certbot /usr/bin/certbot
echo "Initialize certbot certonly --nginx "
sleep 3
sudo certbot certonly --nginx
echo "Checking nginx status install docker "
sleep 3
#cd /etc/nginx/sites-enabled/
sudo systemctl status nginx
echo "Finished set up"
