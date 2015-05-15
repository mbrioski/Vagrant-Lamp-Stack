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
  package{ 'xdebug':
    name => 'php5-xdebug',
    ensure=> installed,
    require=>Package["php5"]
  }

}
