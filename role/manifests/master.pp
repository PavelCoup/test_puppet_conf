class role::master (
  $port_proxy = '80',
  $ip_proxy = '192.168.1.12',
) {
  include profile::web_servers::reverse_proxy
}

