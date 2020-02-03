class profile::remove_readme {
  file { '/root/README':
      ensure => absent,
      }
}
