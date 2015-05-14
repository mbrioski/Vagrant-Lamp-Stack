class apache {
package {"apache2":
ensure => present
}
service { "apache2":
require => Package["apache2",'php5', 'php5-mysql', 'php5-dev', 'php5-curl',
'php5-gd', 'php5-imagick', 'php5-mcrypt', 'php5-memcache',
'php5-mhash', 'php5-pspell', 'php5-snmp', 'php5-xmlrpc',
'php5-xsl', 'php-pear', 'libapache2-mod-php5']
}
}

class modrewrite{
exec { 'enabledmodrewrite':
command => '/usr/sbin/a2enmod rewrite',
require => Package['apache2']
}
}

class apacheconf{
  file { '/var/www/html':
  ensure => 'directory',
  owner=>'root',
  group => 'root',
  mode => 777,
  require => Exec['enabledmodrewrite']
  }
  file { '/var/www/html/myapp':
  ensure => 'directory',
  owner=>'root',
  group => 'root',
  mode => 777,
  require => File['/var/www/html']
  }
  file { '/var/www/html/myapp/index.php':
    ensure=>'file',
    owner=>'root',
    group => 'root',
    mode => 777,
    source => 'puppet:///modules/apache/index.php',
    require => File['/var/www/html/myapp']
  }
  file { '/etc/apache2/sites-available/myapp.conf':
    ensure=>'file',
    owner=>'root',
    group => 'root',
    source => 'puppet:///modules/apache/default.conf',
    require => File['/var/www/html/myapp/index.php']
  }
  exec { 'a2ensite':
    command => '/usr/sbin/a2ensite myapp.conf',
    require => File['/etc/apache2/sites-available/myapp.conf']
  }
  exec { 'apacherestart':
  command => '/etc/init.d/apache2 restart',
  require => Exec['a2ensite']
  }
  file { '/etc/hosts':
    ensure=>'file',
    owner=>'root',
    group => 'root',
    source => 'puppet:///modules/apache/hosts',
    require => Exec['apacherestart']
  }
}
