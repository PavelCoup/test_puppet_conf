class profile::web_servers::reverse_proxy (
  String $port_proxy,
  String $ip_proxy,
)
{
  include nginx
  nginx::resource::server { '192.168.1.10:80' :
     ensure      => present,
     listen_port => 80,
     proxy       => "http://${ip_proxy}:${port_proxy}",
     }
}
