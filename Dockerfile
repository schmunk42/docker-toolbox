FROM debian

MAINTAINER Tobias Munk <schmunk@usrbin.de>

# Install system packages for PHP extensions required for Yii 2.0 Framework
RUN apt-get update && \
    apt-get -y install \
            curl \
            ca-certificates \
        --no-install-recommends && \
    rm -r /var/lib/apt/lists/* # 150901
  
RUN curl -L https://github.com/docker/machine/releases/download/v0.4.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine
RUN chmod +x /usr/local/bin/docker-machine

RUN curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
