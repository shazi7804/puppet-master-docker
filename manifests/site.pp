node default {
  package { 'apache2':
    ensure => present,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }
}
