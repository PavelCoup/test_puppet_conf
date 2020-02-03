class mineserver {
  
  include systemd::systemctl::daemon_reload
  
  package { 'java-1.8.0-openjdk-devel':
    ensure => installed,
    }

  group { 'minecraft':
    ensure => 'present',
    system  => 'true',
  	#gid    => '502',
  }

  user { 'minecraft':
    ensure  => present,
    comment => 'minecraft,,,',
    system  => 'true',
    #gid     => '1001',
    groups  => 'minecraft',
    home    => '/opt/minecraft',
    shell   => '/bin/bash',
    #uid     => '1001',
  }

  file { '/opt/minecraft':
    owner => 'minecraft',
    group => 'minecraft',
    ensure => "directory",
    purge => false,
    recurse => true,
    mode => '0777',
    }
  
  file { '/opt/minecraft/server.jar':
    owner => 'minecraft',
    group => 'minecraft',
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar',
    replace => false,
    mode => '0777',
    }

  file { '/opt/minecraft/eula.txt':
    owner => 'minecraft',
    group => 'minecraft',
    ensure => file,
    #source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/modules/mineserver/files/eula.txt',
    content => 'eula=true',
    replace => false,
    mode => '0777',
    }
  
  file { '/etc/systemd/system/minecraft.service':
    owner => 'root',
    group => 'root',
    ensure => file,
    mode   => '0644',
    source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/modules/mineserver/files/minecraft.service',
    replace => false,
    notify => [
      Class['systemd::daemon_reload'],
      Service['minecraft'],
      ],
    }
  
  service { 'minecraft':
    ensure    => 'running',
    enable => 'true',
    subscribe => File['/etc/systemd/system/minecraft.service'],
    require => Class['systemd::daemon_reload'],
    }
}
