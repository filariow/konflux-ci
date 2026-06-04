#!/bin/bash

set -euo pipefail

## Create the kind cluster
kind create cluster --name konflux-ci-policies-test --image kindest/node:v1.36.1

