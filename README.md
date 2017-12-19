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
$ docker exec -it puppet-master netstat -tunlp
tcp 0 0 0.0.0.0:8140  0.0.0.0:* LISTEN -
```

---

### Apply puppet agent

```
$ make build
or
$ docker exec -it puppet-master puppet agent -t
```
