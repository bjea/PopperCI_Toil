#!/bin/bash

docker run --rm -it -v `pwd`:/root --workdir=/root -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" \
    quay.io/ucsc_cgl/toil:3.11.0 toil ssh-cluster cactuscluster bash /tmp/leaderNode.sh

exit 0