node default {
  package { 'ntp':
    ensure => present,
  }

  service { 'ntp':
    ensure  => running,
    enable  => true,
    require => Package['ntp'],
  }
}
