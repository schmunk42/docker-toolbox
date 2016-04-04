FROM debian:8

MAINTAINER Tobias Munk <schmunk@usrbin.de>

# Install system packages
RUN apt-get update && \
    apt-get -y install \
            curl \
            ca-certificates \
            expect \
            make \
            nano \
            openssh-client \
            sshpass \
            unzip \
        --no-install-recommends && \
    rm -r /var/lib/apt/lists/* # 151110

RUN mkdir -p /opt/local/bin

# Legacy versions
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 > /opt/local/bin/docker-1.9.1 && \
    chmod +x /opt/local/bin/docker-1.9.1

# Current stable versions
RUN curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine && \
    chmod +x /opt/local/bin/docker-machine

RUN curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose && \
    chmod +x /opt/local/bin/docker-compose

RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 > /opt/local/bin/docker && \
    chmod +x /opt/local/bin/docker

# Beta/rc versions
RUN curl -L https://github.com/docker/compose/releases/download/1.7.0-rc1/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-1.7.0-rc1 && \
    chmod +x /opt/local/bin/docker-compose-1.7.0-rc1

ENV PATH=/opt/local/bin:$PATH
