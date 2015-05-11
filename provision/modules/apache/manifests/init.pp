class apache {
package {"apache2":
ensure => present
}
file { '/var/www/html':
ensure => 'link',
target => '/vagrant/src',
require => Package['apache2']
}
#file { '/etc/apache2/sites-available/default':
#source => 'puppet:///modules/apache/files/default',
#owner => 'root',
#group => 'root',
#require => Package['apache2']
#}
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
