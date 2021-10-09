#!/bin/bash
clear
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
clear
echo "KEY'S DOWNLOADED"
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
clear
echo "ADRESSES SUCSESSFULY ADDED TO SOURSES LIST"
apt update
echo ""
clear
echo "INSTALLING LATEST JAVA VERSION"
apt install default-jre -y
echo "JAVA INSTALLED"
echo ""
clear
echo "JENKINS INSTALLATION STARTED"
apt install jenkins -y
echo "INSTALLATION COMPLETE"
echo ""
clear
echo "START JENKINS SERVER"
systemctl start jenkins
systemctl ststus jenkins
clear
echo "ALLOW PORT 8080 via FIREWALL"
ufw allow 8080
echo "ALMOST DONE"
echo "NEXT YOU NEED TO FOLLOW https://<ip_addr_of_your_host>:8080 IN YOUR BROWSER"
