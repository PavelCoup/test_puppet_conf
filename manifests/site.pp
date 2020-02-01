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
   
   class { '::php':
      settings   => {
         'PHP/max_execution_time'  => '90',
         'PHP/max_input_time'      => '300',
         'PHP/memory_limit'        => '64M',
         'PHP/post_max_size'       => '32M',
         'PHP/upload_max_filesize' => '32M',
         'Date/date.timezone'      => 'Europe/Minsk',
         },
      }
   
   class { 'apache': }
   
   file { '/root/README':
      ensure => absent,
      }
   
   file { '/var/www/html/index.html':
      ensure => file,
      source => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.php'
      }

}
