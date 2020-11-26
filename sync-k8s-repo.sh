#!/bin/bash

git remote add kubernetes https://github.com/kubernetes/kubernetes.git
git fetch kubernetes --depth=1
git checkout kubernetes/master cluster/addons/fluentd-elasticsearch/fluentd-es-image/*

