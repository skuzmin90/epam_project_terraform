#!/bin/bash
sudo yum update -y
sudo yum install git docker* -y
sudo systemctl enable --now docker.service
sudo mkdir /epam_project && cd /epam_project
sudo git clone https://github.com/skuzmin90/epam_project_python.git
cd ./epam_project_python
sudo pwd >> test.txt
sudo docker build -t webapp .
sudo docker run --name webapp -p 80:5000 -d --env-file env.dev webapp