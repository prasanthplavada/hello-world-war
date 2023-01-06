#!/bin/bash
#instal tom cat & java
sudo apt update -y
sudo apt install default-jdk -y
sudo apt-cache search tomcat
sudo apt install tomcat9 tomcat9-admin -y
sudo ufw allow from any to any port 9090 proto tcp

#Change the port number from 8080 to 9090
sudo sed -i 's/Connector port ="8080"/Connector port ="9090"/lg' /etc/tomcat9/server.xml

#To set usern name and password in user.xml
sudo sed -i '56 i   <role rolename="admin-gui"/>' /etc/tomcat9/tomcat-users.xml
sudo sed -i '57 i   <role rolename="manager-gui"/>' /etc/tomcat9/tomcat-users.xml
sudo sed -i '58 i   <user username="tomcat" password="pass" roles="admin-gui,manager-gui"/>' /etc/tomcat9/tomcat-users.xml

#Restart tomcat
sudo systemctl restart tomcat9
sudo systemctl status tomcat9

#sudoesrs permission
sudo sed -i '45 i jenkins ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
sudo sed -i '46 i jenkins ALL=(ALL) NOPASSWD: /var/lib/jenkins/workspace' /etc/sudoers
