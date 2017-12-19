# Puppet Master in Docker

The example is puppet master in docker 

## HowTo

### Setup

- build docker for puppet master

```
$ cd puppet-master-docker/
$ docker build -t="shazi7804/puppet:master" .
```

- run docker for puppet master

```
$ docker run -itd -P --name puppet-master -v $(pwd):/etc/puppetlabs/code/environments/production shazi7804/puppet:master
```

- verify puppetserver running

```
$ docker exec -it puppet-master netstat -tunlp
tcp 0 0 0.0.0.0:8140  0.0.0.0:* LISTEN -
```

---

### manifests test

```
$ docker exec -it puppet-master puppet agent -t
```