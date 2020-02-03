class profile::download_site (
  String $url_site_download,
  String $format_file,
)

{
  file { "/var/www/html/index.${format_file}":
      ensure => file,
      source => $url_site_download,
      replace => false,
      }
}
