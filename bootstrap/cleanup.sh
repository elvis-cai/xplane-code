#!/bin/bash
export KUBECONFIG=/tmp/awx-code-challenge.config
kubectl delete application cloud-resources   -n argocd
kubectl delete managed --all
k3d cluster delete awx-code-challenge
