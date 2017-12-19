FROM ubuntu:16.04
MAINTAINER scott.liao <scott.liao@104.com.tw>

ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

RUN set -ex \
      && apt-get update && apt-get install -y wget

RUN set -ex \
      && wget https://apt.puppetlabs.com/puppet5-release-xenial.deb \
      && dpkg -i puppet5-release-xenial.deb \
      && apt-get update && apt-get install puppetserver -y

COPY config/default.puppetserver /etc/default/puppetserver
COPY config/puppet.conf /etc/puppetlabs/puppet/puppet.conf

EXPOSE 8140

CMD ["/opt/puppetlabs/bin/puppetserver","foreground"]
