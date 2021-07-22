#!/bin/bash
sudo yum update -y
sudo yum install git docker* -y
sudo systemctl enable --now docker.service
sudo bash
sudo git clone https://github.com/skuzmin90/epam_project_python.git
sudo cd epam_project_python
sudo docker build -t webapp .
sudo docker run --name webapp -p 80:5000 -d webapp \
-e DB_NAME="${db_name}" -e DB_USER="${db_user}" -e DB_HOST="${db_host}" \
-e DB_PASSWORD="${db_password}" -e DB_PORT="${db_port}"