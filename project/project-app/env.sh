#!/usr/bin/env bash

export TOPIC="diplom-project"
export DEPLOY_TYPE="$TOPIC programm"
export DEPLOYDATE=$(date +%Y%m%d-%H%M)
export NAMESPACE="default"
export RELEASE_VER="${TOPIC,,}"
export GITHUB_REGISTRY_OWNER="kpk666"
export REGISTRY="ghcr.io/${GITHUB_REGISTRY_OWNER}"
export GITHUB_REGISTRY_SECRET="github-cred"
export GITHUB_REGISTRY_SECRET_FILE="./secrets/.dockerconfigjson"
