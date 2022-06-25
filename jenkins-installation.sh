#!/bin/bash

#Java installation
apt update
apt install openjdk-11-jre
java -version

#Jenkins installation
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update
apt-get install jenkins

#Enable and check Jenkins service
systemctl enable jenkins
systemctl start
systemctl status jenkins

#Firewall setup
ufw allow 8080
ufw enable
ufw status

#Read Jenkins admin password
cat /var/lib/jenkins/secrets/initialAdminPassword
