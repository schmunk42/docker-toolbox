FROM debian:8

MAINTAINER Tobias Munk <tobias@diemeisterei.de>

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

# Docker tools

# v2
RUN curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine-0.6.0 && \
    chmod +x /opt/local/bin/docker-machine-0.6.0
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 > /opt/local/bin/docker-1.9.1 && \
    chmod +x /opt/local/bin/docker-1.9.1
RUN curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-1.6.2 && \
    chmod +x /opt/local/bin/docker-compose-1.6.2

# v3
RUN curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine-0.7.0 && \
    chmod +x /opt/local/bin/docker-machine-0.7.0
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 > /opt/local/bin/docker-1.10.3 && \
    chmod +x /opt/local/bin/docker-1.10.3
RUN curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-1.7.1 && \
    chmod +x /opt/local/bin/docker-compose-1.7.1

# v4
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.11.2.tgz > /tmp/docker-1.11.2.tgz && \
    cd /tmp && tar -xzf ./docker-1.11.2.tgz && \
    rm /tmp/docker-1.11.2.tgz && \
    mv /tmp/docker/docker /opt/local/bin/docker-1.11.2 && \
    chmod +x /opt/local/bin/docker-1.11.2

# v5
RUN curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine-0.8.2 && \
    chmod +x /opt/local/bin/docker-machine-0.8.2
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.12.6.tgz > /tmp/docker-1.12.6.tgz && \
    cd /tmp && tar -xzf ./docker-1.12.6.tgz && \
    rm /tmp/docker-1.12.6.tgz && \
    mv /tmp/docker/docker /opt/local/bin/docker-1.12.6 && \
    chmod +x /opt/local/bin/docker-1.12.6
RUN curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-1.8.1 && \
    chmod +x /opt/local/bin/docker-compose-1.8.1

# dev
RUN curl -L https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine-0.9.0 && \
    chmod +x /opt/local/bin/docker-machine-0.9.0
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.13.0.tgz > /tmp/docker-1.13.0.tgz && \
    cd /tmp && tar -xzf ./docker-1.13.0.tgz && \
    rm /tmp/docker-1.13.0.tgz && \
    mv /tmp/docker/docker /opt/local/bin/docker-1.13.0 && \
    chmod +x /opt/local/bin/docker-1.13.0
RUN curl -L https://github.com/docker/compose/releases/download/1.10.0/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-1.10.0 && \
    chmod +x /opt/local/bin/docker-compose-1.10.0

ENV PATH=/opt/local/bin:$PATH

RUN ln -s /opt/local/bin/docker-1.12.6 /opt/local/bin/docker
RUN ln -s /opt/local/bin/docker-machine-0.8.2 /opt/local/bin/docker-machine
RUN ln -s /opt/local/bin/docker-compose-1.8.1 /opt/local/bin/docker-compose

