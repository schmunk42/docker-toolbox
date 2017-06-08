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

# v6.1
ENV MACHINE_VERSION_CURRENT=0.12.0 \
    DOCKER_VERSION_CURRENT=17.05.0-ce \
    COMPOSE_VERSION_CURRENT=1.13.0
RUN curl -L https://github.com/docker/machine/releases/download/v${MACHINE_VERSION_CURRENT}/docker-machine-`uname -s`-`uname -m` >/opt/local/bin/docker-machine-${MACHINE_VERSION_CURRENT} && \
    chmod +x /opt/local/bin/docker-machine-${MACHINE_VERSION_CURRENT}
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION_CURRENT}.tgz > /tmp/docker-${DOCKER_VERSION_CURRENT}.tgz && \
    cd /tmp && tar -xzf ./docker-${DOCKER_VERSION_CURRENT}.tgz && \
    rm /tmp/docker-${DOCKER_VERSION_CURRENT}.tgz && \
    mv /tmp/docker/docker /opt/local/bin/docker-${DOCKER_VERSION_CURRENT} && \
    chmod +x /opt/local/bin/docker-${DOCKER_VERSION_CURRENT}
RUN curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION_CURRENT}/docker-compose-`uname -s`-`uname -m` > /opt/local/bin/docker-compose-${COMPOSE_VERSION_CURRENT} && \
    chmod +x /opt/local/bin/docker-compose-${COMPOSE_VERSION_CURRENT}

RUN ln -s /opt/local/bin/docker-machine-${MACHINE_VERSION_CURRENT} /opt/local/bin/docker-machine
RUN ln -s /opt/local/bin/docker-${DOCKER_VERSION_CURRENT} /opt/local/bin/docker
RUN ln -s /opt/local/bin/docker-compose-${COMPOSE_VERSION_CURRENT} /opt/local/bin/docker-compose

ENV PATH=/opt/local/bin:$PATH
