#! /bin/env bash

# Docker version
echo "Check docker version"
sudo docker version

# Docker-compose version
echo "Check docker-compose version"
sudo docker-compose version

# Launch docker-compose
echo "Launch project"
sudo docker-compose up -d