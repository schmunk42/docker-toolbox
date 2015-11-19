# docker-toolbox

## What is this?

- `docker` (client only)
- `docker-compose`
- `docker-machine`

see [CHANGELOG](CHANGELOG.md) for a version overview

## Why did we build it?

This Docker image is for mainly for usage with remote-hosts.







Troubleshooting
---------------

*Problem*

    Error response from daemon: client is newer than server (client API version: 1.21, server API version: 1.20)

*Solution*

Upgrade your docker host or use a compatible docker version from this toolbox image, eg. `1.0.0`.