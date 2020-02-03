class profile::download_site (
  String $url_site_download,
)

{
  file { '/var/www/html/index.html':
      ensure => file,
      source => $url_site_download,
      replace => false,
      }
}
