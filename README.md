# docker-toolbox

## What is this?

Just the basic set of Docker tooling in a Docker image.

- `docker-machine` https://github.com/docker/machine
- `docker` (client only) https://github.com/docker/docker
- `docker-compose` https://github.com/docker/compose

see [CHANGELOG](CHANGELOG.md) for a version overview

## Why did we build it?

This Docker image is for mainly for usage in continuous integration 
systems and remote-hosts.


Resources
---------

- [GitHub](https://github.com/schmunk42/docker-toolbox)
- [Docker Hub](https://hub.docker.com/r/schmunk42/docker-toolbox/)


Troubleshooting
---------------

*Problem*

    Error response from daemon: client is newer than server (client API version: 1.21, server API version: 1.20)

*Solution*

Upgrade your docker host or use a compatible docker version from this toolbox image, eg. `1.0.0`.

---

Built by [dmstr](http://diemeisterei.de)
