node default {
  package { 'apache2':
    ensure => present,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  file { '/var/www/html/index.html':
    content => "The Apache demo for puppet master",
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0400',
  }
}
