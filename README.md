# Puppet Master in Docker

![Build Status](https://travis-ci.org/shazi7804/puppet-master-docker.svg?branch=master)

The example is puppet master in docker 

## HowTo

### Automake Setup

- build docker for puppet master

```
$ cd puppet-master-docker/
$ make install
```

- verify puppetserver running

```
$ make status
or
$ docker exec -it puppet-master netstat -tunlp
```

---

### Example code

- install apache2

```
# site.pp
node default {
  package { 'apache2':
    ensure => present,
  }
}
```

### Apply puppet agent

```
$ make deploy
or
$ docker exec -it puppet-master puppet agent -t
```
