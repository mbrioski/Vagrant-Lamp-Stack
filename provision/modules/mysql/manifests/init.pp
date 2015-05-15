class mysql {
package { "mysql-server":
ensure => present,
}
package { "mysql-client":
ensure => present,
}
package { "libmysqlclient15-dev":
ensure => present,
}
file { '/home/vagrant/resetmysqlpwd.sh':
  ensure=>'file',
  owner=>'root',
  group => 'root',
  mode => 771,
  source => 'puppet:///modules/mysql/resetpwd.sh',
  require => Package['mysql-server']
}
}
