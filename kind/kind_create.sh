#! /bin/env bash

source ./env.sh

# create kind cluster
envsubst < config.yaml | kind create cluster --config=-

# install Calico
echo "Install Calico CNI..."
kubectl apply -f calico.yaml
# curl https://docs.projectcalico.org/manifests/calico.yaml | kubectl apply -f -

# scale down CoreDNS
echo "Scale down coreNDS..."
kubectl scale deployment --replicas 1 coredns --namespace kube-system

# install Nginx ingress controller
echo "Install Ingress NGINX..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

# install Metrics-server
echo "Install Metrics-server..."
kubectl apply -f metrics-server.yaml

# get kubernetes cluster info
kubectl cluster-info