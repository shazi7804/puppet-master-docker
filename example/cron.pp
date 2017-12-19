node default {
  $package_groups = ['ntpdate', 'cron']
  package { $package_groups:
    ensure => present,
  }

  # run 'crontab -l' verify.
  cron { 'ntpdate-update':
    ensure  => 'present',
    command => "/usr/sbin/ntpdate -s time.google.com 2>&1 > /dev/null",
    minute  => '*/5',
    target  => 'root',
    user    => 'root',
  }
}
