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
$ docker run -itd -P --name puppet-master -v $(pwd)/manifests:/etc/puppetlabs/code/environments/production/manifests shazi7804/puppet:master
```

---

### manifests test

```
$ docker exec -it puppet-master puppet agent -t
```

