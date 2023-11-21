#!/bin/bash
kubectl delete application cloud-resources   -n argocd
kubectl delete managed --all
k3d cluster delete code-challenge
