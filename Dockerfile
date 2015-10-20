FROM debian

MAINTAINER Tobias Munk <schmunk@usrbin.de>

# Install system packages
RUN apt-get update && \
    apt-get -y install \
            curl \
            ca-certificates \
        --no-install-recommends && \
    rm -r /var/lib/apt/lists/* # 150901

RUN mkdir -p /opt/local/bin

RUN curl -L https://github.com/docker/machine/releases/download/v0.4.0/docker-machine_linux-amd64 > /opt/local/bin/docker-machine
RUN chmod +x /opt/local/bin/docker-machine

RUN curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose
RUN chmod +x /opt/local/bin/docker-compose

RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.8.2 > /opt/local/bin/docker
RUN chmod +x /opt/local/bin/docker
