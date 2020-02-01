node default {
}

node 'slave1.puppet' {
   class { 'apache': }
   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.html'
      }
}

node 'slave2.puppet' {
   
   class { 'apache::mod::php': }


   
   
   class { 'php': }

   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.php':
      ensure => present,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.php'
      }

}
