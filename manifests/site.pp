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


node 'slave2.puppet' {
   
   include '::php'
   
   class { 'apache': }
   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.php'
      }

}
