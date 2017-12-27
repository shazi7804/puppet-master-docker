#
.PHONY: default

#
default: help

help:
	@echo 'Use "make <status, install, deploy>".'

status:
	@echo ">>> Check Puppet Master status ..."
	docker exec -it puppet-master netstat -tunlp | grep -q 8140 && echo "\nPuppet Master is running." || echo "\nPuppet Master not running."

install:
	@echo ">>> Docker building ..."
	docker build -t="shazi7804/puppet:master" .
	@echo ">>> Docker runing puppet master ..."
	docker run -itd --name puppet-master -p 8080:80 -v $(shell pwd):/etc/puppetlabs/code/environments/production shazi7804/puppet:master

deploy:
	@echo ">>> puppet deploy ..."
	docker exec -it puppet-master puppet agent -t
