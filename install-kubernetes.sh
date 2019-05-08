#!/bin/bash

cd `dirname "$0"`

NODE_TYPE=`./calc_node_type.py`

echo "Node Type: $NODE_TYPE"

function abort {
	echo "ERROR: $0"
	exit 2
}

if ! apt-get install docker.io -y; then
	abort "Failed to install docker.io"
fi

if ! apt-get install kublet -y; then
	abort "Failed to install kublet"
fi

if ! apt-get install kubeadm -y; then
	abort "Failed to install kubadm"
fi

if [ $NODE_TYPE == 'master']; then
	if ! apt-get install kubectl; then
		abort "Failed to install kubectl"
	fi
fi

echo "Success"