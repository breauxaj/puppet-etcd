# Define: etcd::config
#
# This define configures etcd
#
# Parameters:
#
#  value:
#    The corresponding value for the associated key (title/name)
#
# Actions:
#   - Applies settings to the etcd.conf file
#
# Sample Usage:
#
#  To configure the service, use:
#
#    etcd::config {
#      'ETCD_LISTEN_CLIENT_URLS': value => 'http://127.0.0.1:2379'; 
#    }
#
define etcd::config (
  $value
) {
  include ::etcd

  $key = $title

  augeas { "etcd_conf/${key}":
    lens    => 'PHP.lns',
    incl    => $::etcd::params::etcd_config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$::etcd::params::etcd_service],
  }

}