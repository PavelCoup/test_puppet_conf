node 'default' {
}

node 'slave1.puppet' {
  class 'test' {
    file { '/root/README':
    ensure => file,
    content => 'Hello, world',
    }  
  }
}
