node default {
}

node 'slave1.puppet' {
   class { 'apache': }
   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.html',
      replace => false,
      }
}

node 'slave2.puppet' {
   class { 'apache::mod::php': }
   
   class { 'php': }
   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.php':
      ensure => file,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.php',
      replace => false,
      }
}

node 'master.puppet' {
   include nginx

   nginx::resource::server { '192.168.1.10:80':
      ensure      => present,
      listen_port => 80,
      proxy       => 'http://192.168.1.12:80',
   }

   nginx::resource::server { '192.168.1.10:81':
      ensure      => present,
      listen_port => 81,
      proxy       => 'http://192.168.1.12:80',
   }
}

node 'mineserver.puppet' {
   include mineserver
}
