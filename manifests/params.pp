# Class: etcd::params
#
# This class set parameters used in this module
#
# Actions:
#   - Filters rhel6 usage - not supported
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class etcd::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '6': {
          fail("${::osfamily} v${::lsbmajdistrelease} is not supported.")
        }
        default: {
          $etcd_config        = '/etc/etcd/etcd.conf'

          $etcd_package       = 'etcd'

          $etcd_service       = 'etcd'

          group { 'etcd':
            ensure => present,
            gid    => 2379,
          }

          user { 'etcd':
            ensure     => present,
            gid        => 2379,
            home       => '/var/lib/etcd',
            shell      => '/sbin/nologin',
            managehome => true,
            uid        => 2379,
          }

        }
      }
    }
    default: { }
  }

}
