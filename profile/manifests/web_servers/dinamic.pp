class profile::web_servers::dinamic {
  class { 'apache::mod::php': }
  class { 'php': }
}
