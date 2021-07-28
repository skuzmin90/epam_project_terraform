#!/bin/bash
sudo yum update -y
sudo yum install git docker* -y
sudo systemctl enable --now docker.service
sudo mkdir /epam_project && cd /epam_project
sudo git clone https://github.com/skuzmin90/epam_project_python.git
cd ./epam_project_python
env DB_HOST=${db_host}
sudo docker build -t webapp .
sudo docker run -d --name webapp -p 80:5000 -e "DB_HOST=${db_host}" webapp