class role::master {
  class { 'profile::web_servers::reverse_proxy' :
    port_proxy => '80',
    ip_proxy => '192.168.1.12',
    }
}

