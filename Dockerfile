FROM alpine:3.5

MAINTAINER Tobias Munk <tobias@diemeisterei.de>

# Install system packages
RUN apk add --no-cache \
        bash \
        curl \
        ca-certificates \
        expect \
        make \
        nano \
        openssh-client \
        sshpass \
        unzip


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

RUN ln -s /opt/local/bin/docker-1.13.0 /opt/local/bin/docker
RUN ln -s /opt/local/bin/docker-machine-0.9.0 /opt/local/bin/docker-machine
RUN ln -s /opt/local/bin/docker-compose-1.10.0 /opt/local/bin/docker-compose



### TODO: workaround for running docker-compose on alpine https://github.com/docker/compose/pull/3856/files
ENV GLIBC 2.23-r3
RUN apk update && apk add --no-cache openssl ca-certificates && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC/glibc-$GLIBC.apk && \
    apk add --no-cache glibc-$GLIBC.apk && rm glibc-$GLIBC.apk && \
    ln -s /lib/libz.so.1 /usr/glibc-compat/lib/ && \
    ln -s /lib/libc.musl-x86_64.so.1 /usr/glibc-compat/lib