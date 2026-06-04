#!/bin/bash

set -euo pipefail

## Create the kind cluster
kind create cluster --name konflux-ci-chainsaw

## Install kyverno
kustomize build --enable-helm dependencies/kyverno | \
  kubectl apply -f - --server-side

## wait for kyverno to rollout
kubectl rollout status deployment \
  --namespace konflux-kyverno \
  --selector '!job-name' \
  --timeout=300s

