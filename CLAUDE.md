# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Docker toolbox image containing Docker CLI tools (docker client, docker-compose, docker-machine) for use in CI/CD pipelines and remote hosts. Published to Docker Hub as `schmunk42/docker-toolbox`.

## Build Commands

```bash
# Build the image
docker compose build

# Build with fresh base image
docker compose build --pull

# Test the built image
docker compose run --rm toolbox docker --version
docker compose run --rm toolbox docker-compose version
docker compose run --rm toolbox docker-machine version
```

## Architecture

Single Dockerfile based on Debian 12 that downloads and installs specific versions of:
- `docker` (client only) - installed to `/opt/local/bin/docker-{VERSION}`
- `docker-compose` - installed to `/opt/local/bin/docker-compose-{VERSION}`
- `docker-machine` - installed to `/opt/local/bin/docker-machine-{VERSION}`

Symlinks without version suffix point to the current versions. All binaries are in `/opt/local/bin` which is added to PATH.

## Version Management

Tool versions are defined as ENV variables at the top of the Dockerfile:
- `DOCKER_VERSION_CURRENT`
- `COMPOSE_VERSION_CURRENT`
- `MACHINE_VERSION_CURRENT`

When updating versions, update both the ENV variable and ensure the download URLs still work (Docker switched from GitHub releases to download.docker.com for the client).

## CI/CD

GitLab CI pipeline (`.gitlab-ci.yml`) builds and tests the image by verifying all tools report their versions correctly.
