FROM debian

MAINTAINER Tobias Munk <schmunk@usrbin.de>

# Install system packages
RUN apt-get update && \
    apt-get -y install \
            curl \
            ca-certificates \
            openssh-client \
            sshpass \
            unzip \
            make \
            nano \
        --no-install-recommends && \
    rm -r /var/lib/apt/lists/* # 151110

RUN mkdir -p /opt/local/bin

RUN curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip >machine.zip && \
      unzip machine.zip && \
      rm machine.zip && \
      mv -f docker-machine* /opt/local/bin
RUN chmod +x /opt/local/bin/docker-machine

RUN curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose && \
    chmod +x /opt/local/bin/docker-compose

RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.9.0 > /opt/local/bin/docker && \
    chmod +x /opt/local/bin/docker
