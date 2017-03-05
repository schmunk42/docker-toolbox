FROM debian:8

MAINTAINER Tobias Munk <tobias@diemeisterei.de>

# Install system packages
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        bash \
        curl \
        ca-certificates \
        expect \
        make \
        nano \
        openssh-client \
        sshpass \
        unzip \
 && apt-get clean

# Docker tools, installed to /opt/local
# for older versions, use a schmunk42/toolbox:5.x.x image
RUN mkdir -p /opt/local/bin


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

# v6
RUN curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine-0.10.0 && \
    chmod +x /opt/local/bin/docker-machine-0.10.0
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz > /tmp/docker-1.13.1.tgz && \
    cd /tmp && tar -xzf ./docker-1.13.1.tgz && \
    rm /tmp/docker-1.13.1.tgz && \
    mv /tmp/docker/docker /opt/local/bin/docker-1.13.1 && \
    chmod +x /opt/local/bin/docker-1.13.1
RUN curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-1.11.2 && \
    chmod +x /opt/local/bin/docker-compose-1.11.2



ENV PATH=/opt/local/bin:$PATH

RUN ln -s /opt/local/bin/docker-1.13.1 /opt/local/bin/docker
RUN ln -s /opt/local/bin/docker-machine-0.10.0 /opt/local/bin/docker-machine
RUN ln -s /opt/local/bin/docker-compose-1.11.2 /opt/local/bin/docker-compose
