#
.PHONY: default

#
default: help

help:
	@echo 'Use "make <something>" to build.'

install:
	@echo ">>> Docker building ..."
	docker build -t="shazi7804/puppet:master" .
	@echo ">>> Docker runing puppet master ..."
	docker run -itd --name puppet-master -p 8080:80 -v $(shell pwd):/etc/puppetlabs/code/environments/production shazi7804/puppet:master

build:
	@echo ">>> puppet deploy ..."
	docker exec -it puppet-master puppet agent -t
