class role::slave1 (
$url_site_download = 'https://raw.githubusercontent.com/PavelCoup/test_puppet_conf/production/files/index.html',
) {
include profile::remove_readme
include profile::download_site
include profile::web_servers::static
}
