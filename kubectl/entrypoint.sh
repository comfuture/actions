#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/kubeconfig
export KUBECONFIG=/tmp/kubeconfig

sh -c "kubectl $*"
