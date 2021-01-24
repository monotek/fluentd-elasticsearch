#!/bin/bash

set -e

if ! git remote | grep -q kubernetes;then
    echo "kubernetes remote not found... adding it..."
    git remote add kubernetes https://github.com/kubernetes/kubernetes.git
fi

echo "fetching kubernetes..."
git fetch kubernetes --depth=1

echo "checking out kubernetes master..."
git checkout kubernetes/master cluster/addons/fluentd-elasticsearch/fluentd-es-image/*

