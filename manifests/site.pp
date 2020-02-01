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
   
   class { 'apache': }   
   apache :: fastcgi :: server  {  'php' : 
      host        =>  '127.0.0.1:9000' , 
      timeout     =>  15 , 
      flush       =>  false , 
      faux_path   =>  '/var/www/php.fcgi' , 
      fcgi_alias  =>  '/php.fcgi' , 
      file_type   =>  'application / x-httpd-php' 
      }
   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.php':
      ensure => present,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.php'
      }

}
