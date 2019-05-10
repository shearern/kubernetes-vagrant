#!/bin/bash

NODE_TYPE=`/vagrant/calc_node_type.py`

if [ "$NODE_TYPE" == 'master' ]; then
	docker node ls
fi
