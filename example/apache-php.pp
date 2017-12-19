node default {
  $package_groups = ['apache2', 'php7.0', 'libapache2-mod-php7.0']

  package { $package_groups:
    ensure => present,
    notify => Service['apache2'],
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # if index.html found then remove it.
  file { '/var/www/html/index.html':
    ensure => absent,
  }

  file { '/var/www/html/index.php':
    ensure  => file,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0400',
    content => '<?php phpinfo(); ?>',
  }
}
