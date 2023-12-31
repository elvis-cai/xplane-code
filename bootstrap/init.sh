#!/bin/bash

colored_echo() {
  echo -e "\033[1;32m$1\033[0m"
}

MYDIR=$(dirname $0)
colored_echo "1. bootstrap k8s & install argoCD"
MYDIR=$(dirname $0)
k3d cluster delete awx-code-challenge
k3d cluster create awx-code-challenge
k3d kubeconfig get awx-code-challenge  > /tmp/awx-code-challenge.config
export KUBECONFIG=/tmp/awx-code-challenge.config

helm repo add argo https://argoproj.github.io/argo-helm && helm repo update
helm install --repo https://argoproj.github.io/argo-helm --create-namespace --namespace argocd argocd argo-cd --version 5.51.2 --set "configs.cm.application\.resourceTrackingMethod=annotation" --set "server.extraArgs[0]=--disable-auth" --set "server.extraArgs[1]=--insecure" --wait
kubectl -n argocd apply -f $MYDIR/../argocd-applications

colored_echo "2. apply provider config"
kubectl create ns crossplane-system
kubectl create secret generic gcp-secret -n crossplane-system --from-file=creds=$MYDIR/gcp-credentials.json
