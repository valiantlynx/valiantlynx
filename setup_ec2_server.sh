#!/bin/bash
echo "logged in"
echo "Update ubuntu"
sleep 3
apt-get update
echo "Initialize install git"
sleep 3
 apt-get install git
echo "Initialize install ca-certificates"
sleep 3
# git clone https://github.com/edatut/gunidocker.git
 apt-get install  ca-certificates
echo "Initialize install curl"
sleep 3
 apt-get install  curl
echo "Initialize install gnupg"
sleep 3
 apt-get install gnupg
echo "Initialize install ca-certificates"
sleep 3
 apt-get install lsb-release
echo "starting docker setup"
sleep 3

 curl -fsSL https://download.docker.com/linux/ubuntu/gpg  |  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg -y
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Initialize install docker.io"
sleep 3

 apt install docker.io -y
echo "Initialize install docker compose"
sleep 3
 curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "Initialize execute permissions for docker compose"
sleep 3
 chmod +x /usr/local/bin/docker-compose
echo "starting nginx setup"
echo "Initialize install nginx "
sleep 3

 apt install nginx -y
echo "Initialize install snapd "
sleep 3
 apt install snapd -y
echo "Initialize install core "
sleep 3
 snap install core 
echo "Initialize refresh core "
sleep 3
 snap refresh core 
echo "Initialize install certbot "
sleep 3
 snap install --classic certbot
echo "Initialize ln -s /snap/bin/certbot /usr/bin/certbot "
sleep 3
 ln -s /snap/bin/certbot /usr/bin/certbot
echo "Initialize certbot certonly --nginx "
sleep 3
 certbot certonly --nginx
echo "Checking nginx status install docker "
sleep 3
#cd /etc/nginx/sites-enabled/
 systemctl status nginx
echo "Finished set up"

echo "Do you want to clone a github repo (y/n): "
read want

if [[ $want == "y" || $want == "yes" ]]; then
    echo "Great, is it public or private? (1-public / 2-private)"
    read status
    if [[ $status == "1" || $status == "public" || $status == "1-public" ]]; then
        echo "You chose public, what is your github account name: "
        read account
        echo "what is the repo name: "
        read repo
        echo $(git clone https://github.com/$account/$repo.git)
        echo "we are done"
    else
        echo "You chose private, what is your github account name: "
        read account
        echo "what is the repo name: "
        read repo
        echo "what is your git token, you can get it from(https://github.com/settings/tokens), when making it make sure the "repo" checkbox is checked: "
        read token
        echo $(git clone https://$token@github.com/$account/$repo.git)
        echo "we are done"
        exit 1   
    fi
else
    echo "You chose no"
    exit 1
fi


