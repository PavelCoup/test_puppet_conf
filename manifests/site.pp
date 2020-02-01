node 'default' {
}

node 'slave1.puppet' {
   file { '/root/README':
   ensure => file,
   content => 'Hello, world',
  }
}
