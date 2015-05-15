class php54 {
  exec{'add-apt-repository ppa:ondrej/php5':
		command=>'/usr/bin/add-apt-repository ppa:ondrej/php5'
	}
	exec{'apt-get update':
		command=>'/usr/bin/apt-get update',
		require => Exec['add-apt-repository ppa:ondrej/php5']
	}

  package { "php5":
  ensure => latest,
  }
  package { "php5-fpm":
  ensure => present,
  }
  package { "php5-mysql":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-dev":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-curl":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-gd":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-imagick":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-mcrypt":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-memcache":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-mhash":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-pspell":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-snmp":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-xmlrpc":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-xsl":
  ensure => present,
  require => Package['php5']
  }
  package { "php5-cli":
  ensure => latest,
  require => Package['php5']
  }
  package { "php-pear":
  ensure => present,
  require => Package['php5']
  }
  package { "libapache2-mod-php5":
  ensure => present,
  require => [Package['php5'], Package['apache2']]
  }
  package{ 'php5-xdebug':
    name => 'php5-xdebug',
    ensure=> installed,
    require=>Package["php5"]
  }
  file { '/etc/php5/conf.d/xdebug.ini':
      source => 'puppet:///modules/php/xdebug.ini',
      require => Package['php5-xdebug'],
  }
  file { '/etc/php5/cli/conf.d/xdebug.ini':
      source => 'puppet:///modules/php/xdebug.ini',
      require => [Package['php5-xdebug'],Package['php5-cli']]
  }
  file { '/etc/php5/fpm/conf.d/xdebug.ini':
      source => 'puppet:///modules/php/xdebug.ini',
      require => [Package['php5-xdebug'],Package['php5-fpm']]
  }

  file { '/etc/php5/apache2/php.ini':
    ensure=>present
  }

  file_line { 'zend_extension=/usr/lib/php5/20121212/xdebug.so':
    path=>'/etc/php5/apache2/php.ini',
    line=>'zend_extension=/usr/lib/php5/20121212/xdebug.so'
  }
  file_line { 'xdebug.remote_connect_back=1':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.remote_connect_back=1',
  }

  file_line { 'xdebug.remote_enable= 1':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.remote_enable= 1',
  }

  file_line { 'xdebug.remote_handler= dbgp':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.remote_handler= dbgp',
  }

  file_line { 'xdebug.remote_port= 9000':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.remote_port= 9000',
  }

  file_line { 'xdebug.remote_host=127.0.0.1':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.remote_host=127.0.0.1',
  }

  file_line { 'xdebug.profiler_enable= 1':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.profiler_enable= 1',
  }

  file_line { 'xdebug.idekey= "vagrant"':
    path=>'/etc/php5/apache2/php.ini',
    line=>'xdebug.idekey= "vagrant"',
  }
  exec{'/etc/init.d/php5-fpm restart':
    command=>'/etc/init.d/php5-fpm restart',
    require=>File['/etc/php5/cli/conf.d/xdebug.ini']
  }
}
