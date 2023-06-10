#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
echo "<h1>Hello from Shreya, this is day6 of TerraWeek</h1>" > /var/www/html/index.html