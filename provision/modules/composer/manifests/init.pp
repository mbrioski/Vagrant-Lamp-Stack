class composer {
package { "curl":
ensure => present
}
exec { 'installcomposer':
command => '/usr/bin/curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant',
require => Package['curl','php5'],
before => Exec['movecomposerglobally']
}
file{ '/home/vagrant/composer.phar':
  ensure=>file,
  require => Exec['installcomposer']
}
exec { 'movecomposerglobally':
command => '/bin/mv /home/vagrant/composer.phar /usr/bin/composer',
require => File['/home/vagrant/composer.phar']
}

}
