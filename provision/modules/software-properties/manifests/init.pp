class software{
  package{'software-properties-common':
    ensure => present,
  }
  package{'python-software-properties':
    ensure => present,
  }
}
