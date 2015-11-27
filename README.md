etcd
====

etcd is a distributed, consistent key-value store for shared configuration and
service discovery, with a focus on being:

Simple: curl'able user-facing API (HTTP+JSON)
Secure: optional SSL client cert authentication
Fast: benchmarked 1000s of writes/s per instance
Reliable: properly distributed using Raft

etcd is written in Go and uses the Raft consensus algorithm to manage a
highly-available replicated log.

etcd is used in production by many companies, and the development team stands
behind it in critical deployment scenarios, where etcd is frequently teamed with
applications such as Kubernetes, fleet, locksmith, vulcand, and many others.

See etcdctl for a simple command line client. Or feel free to just use curl.

Notes
-----

This module only works on the redhat family and version 7.

Samples
-------
```
include etcd
```
```
class { 'etcd':
  version => 'latest'
}
```
```
etcd::config {
  'ETCD_LISTEN_CLIENT_URLS': value => 'http://127.0.0.1:2379'; 
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
