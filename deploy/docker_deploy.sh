#! /bin/env bash

# Docker version
echo "Check docker version"
docker version

# Docker-compose version
echo "Check docker-compose version"
docker compose version

# Launch docker-compose
echo "Launch project"
docker compose up -d