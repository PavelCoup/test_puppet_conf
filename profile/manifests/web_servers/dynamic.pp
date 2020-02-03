class profile::web_servers::dynamic {
  class { 'apache::mod::php': }
  class { 'php': }
}
