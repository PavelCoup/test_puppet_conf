class profile::web_servers::reverse_proxy (
  String $port_proxy = '80',
  String $ip_proxy = '192.168.1.12',
)
{
  include nginx
  nginx::resource::server { '$ip_proxy:$port_proxy' :
     ensure      => present,
     listen_port => 80,
     proxy       => 'http://192.168.1.12:$port_proxy',
     }
}
