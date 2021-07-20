#!/bin/bash
sudo yum update -y
sudo yum install git docker* -y
sudo git clone https://github.com/skuzmin90/epam_project_python.git
sudo cd epam_project_python
sudo docker build -t webapp .
sudo docker run --name webapp -p 80:5000 -d webapp