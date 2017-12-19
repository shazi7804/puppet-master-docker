node default {
  exec { 'demo-touch-commandh':
    command => 'touch /tmp/demo.txt',
    path    => '/usr/bin',
    unless  => 'test -e /tmp/demo.txt',
  }
}
