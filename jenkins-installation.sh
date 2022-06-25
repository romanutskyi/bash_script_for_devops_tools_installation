#!/bin/bash

#Java installation
apt update
sleep 10
apt install openjdk-11-jre
sleep 30
java -version
sleep 1
#Jenkins installation
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sleep 1
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sleep 1
apt-get update
sleep 10
apt-get install jenkins
sleep 60
#Enable and check Jenkins service
systemctl enable jenkins
sleep 1
systemctl start
sleep 1
systemctl status jenkins
sleep 1

#Firewall setup
ufw allow 8080
sleep 1
ufw enable
sleep 1
ufw status
sleep 1

#Read Jenkins admin password
cat /var/lib/jenkins/secrets/initialAdminPassword
