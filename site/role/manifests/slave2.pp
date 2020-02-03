class role::slave2 (
$url_site_download = 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.php',
) {
include profile::remove_readme
include profile::web_servers::dynamic
profile::download_site { 192.168.1.10:80' :
  source => $url_site_download,
  }

}
