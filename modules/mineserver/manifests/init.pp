# sudo yum -y install java-1.8.0-openjdk-devel
# sudo mkdir /opt/minecraft
# cd /opt/minecraft
# sudo curl -O https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
# sudo java -Xmx1024M -Xms1024M -jar server.jar nogui
# sudo chmod -R 777 /opt/minecraft
# sudo sed -i 's/false/true/g' /opt/minecraft/eula.txt
# sudo java -Xmx1024M -Xms1024M -jar server.jar nogui
# cat /opt/minecraft/eula.txt | grep -q eula=true
class mineserver {
  package { 'java-1.8.0-openjdk-devel':
    ensure => installed,
    }
  
  file { '/opt/minecraft':
    owner => 'root',
    group => 'root',
    ensure => "directory",
    purge => false,
    recurse => true,
    }
  
  file { '/opt/minecraft/server.jar':
    owner => 'root',
    group => 'root',
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar',
    replace => false,
    }

  file { '/opt/minecraft/eula.txt':
    owner => 'root',
    group => 'root',
    ensure => file,
    source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/modules/mineserver/files/eula.txt',
    onlyif => 'cat /opt/minecraft/eula.txt | grep -q eula=false',
    }
    
  exec { 'java -Xmx1024M -Xms1024M -jar server.jar nogui':
    cwd     => '/opt/minecraft',
    path    => ['/usr/bin', '/usr/sbin',],
    onlyif   => 'test ! -f /opt/minecraft/server.properties',
    }
}
