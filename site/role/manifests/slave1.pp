class role::slave2 {
include profile::remove_readme
include profile::web_servers::dynamic
class { 'profile::download_site' : 
  url_site_download => 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.html',
  format_file => 'html'
  }
}
