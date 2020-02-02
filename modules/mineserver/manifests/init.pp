sudo yum -y install java-1.8.0-openjdk-devel
sudo mkdir /opt/minecraft
cd /opt/minecraft
sudo curl -O https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
sudo java -Xmx1024M -Xms1024M -jar server.jar nogui
sudo chmod -R 777 /opt/minecraft
sudo sed -i 's/false/true/g' /opt/minecraft/eula.txt
sudo java -Xmx1024M -Xms1024M -jar server.jar nogui
