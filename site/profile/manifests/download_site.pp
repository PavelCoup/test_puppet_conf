class profile::download_site (
  String $url_site_download = 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.html',
)

{
  file { '/var/www/html/index.html':
      ensure => file,
      source => '$url_site_download',
      replace => false,
      }
}
