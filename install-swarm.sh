#!/bin/bash

cd `dirname "$0"`

NODE_TYPE=`./calc_node_type.py`

function abort {
	echo "ERROR: $0"
	exit 2
}

if ! apt install docker-ce -y; then
	abort "Failed in install docker-ce"
fi

if ! usermod -aG docker vagrant; then
	abort "Failed to add vagrant to docker group"
fi

if ! docker -v; then
	echo "Failed to execute docker -v"
fi

# Configure cluster
if [ $NODE_TYPE == 'master' ]; then
	if ! docker swarm init --advertise-addr 10.99.0.10; then # Can use hostname master?
	 	abort "Failed to init swarm"
	fi
	if ! docker swarm join-token worker -q > /vagrant/.swarm-token; then
		abort "Failed to retrieve swarm token"
	fi		
fi

SWARM_TOKEN=`cat /vagrant/.swarm-token`
if [ -z "$SWARM_TOKEN" ]; then
	abort "Missing /vagrant/.swarm-token"
fi

if [ $NODE_TYPE == 'worker' ]; then
	if ! docker swarm join --token "$SWARM_TOKEN" master:2377; then
		abort "Failed to join swarm"
	fi
fi

echo ""
echo "$0 Finished on $HOSTNAME"
echo ""

echo ""
echo "docker info"
docker info

if [ $NODE_TYPE == 'master' ]; then
	echo "docker node ls" >> /home/vagrant/.bashrc
fi

