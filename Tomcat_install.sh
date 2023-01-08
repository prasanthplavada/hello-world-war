#!/bin/bash
sudo apt-cache search tomcat
sudo apt-get install -y tomcat9 tomcat9-admin
sudo ufw allow from any to any port 9090 proto tcp
sudo sed -i -r 's/port="[0-9]{4}"/port="9090"/g' /etc/tomcat9/server.xml
sudo sed -i '$d' /etc/tomcat9/tomcat-users.xml
sudo sh -c "echo '<role rolename=\"admin-gui\"/>' >> /etc/tomcat9/tomcat-users.xml"
sudo sh -c "echo '<role rolename=\"manager-gui\"/>' >> /etc/tomcat9/tomcat-users.xml"
sudo sh -c "echo '<user username=\"tomcat\" password=\"pass\" roles=\"admin-gui,manager-gui\"/>' >> /etc/tomcat9/tomcat-users.xml"
sudo sh -c "echo '</tomcat-users>' >> /etc/tomcat9/tomcat-users.xml"
sudo systemctl restart tomcat9
sudo sh -c "echo 'jenkins ALL=(ALL) NOPASSWD: /var/lib/jenkins/workspace' >> /etc/sudoers"
sudo sh -c "echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"
