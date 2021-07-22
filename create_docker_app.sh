#!/bin/bash
sudo yum update -y
sudo yum install git docker* -y
sudo systemctl enable --now docker.service
sudo mkdir /epam_project && cd /epam_project
sudo git clone https://github.com/skuzmin90/epam_project_python.git
cd ./epam_project_python
sudo pwd >> test.txt
sudo echo ${db_name} >> test.txt
sudo docker build -t webapp .
sudo docker run --name webapp -p 80:5000 -d \
-e DB_NAME=${db_name} -e DB_USER=${db_user} -e DB_HOST=${db_host} \
-e DB_PASSWORD=${db_password} -e DB_PORT=${db_port} webapp