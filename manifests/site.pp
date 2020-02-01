node default {
}

node 'slave1.puppet' {
   class apache { 'apache': }
   file { '/root/README':
   ensure => file,
   content => 'Hello, world',
  }
}
