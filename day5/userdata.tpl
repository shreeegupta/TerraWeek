#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
echo "<h1>Hello from Shreya</h1>" > /var/www/html/index.html