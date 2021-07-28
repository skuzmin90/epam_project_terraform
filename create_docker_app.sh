#!/bin/bash
sudo yum update -y
sudo yum install git docker* -y
sudo systemctl enable --now docker.service
sudo mkdir /epam_project && cd /epam_project
sudo git clone https://github.com/skuzmin90/epam_project_python.git
cd ./epam_project_python
sudo echo -e "\nENV DB_HOST=${db_host}\nENV DB_PORT=${db_port}\nENV DB_USER=${db_user}\nENV DB_PASSWORD=${db_password}\nENV DB_NAME=${db_name}" >> Dockerfile
sudo docker build -t webapp .
sudo docker run -d --name webapp -p 80:5000 webapp