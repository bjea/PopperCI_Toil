#!/bin/bash
# Use this setup.sh to launch a leader node (`toil launch-cluster`) on AWS and upload required files to such leader
# node (`toil rsync-cluster`). Before running this shell script (`bash setup.sh`), a user needs to copy the .aws/ and
# .ssh/ (or create a new ssh key) folders to the home directory (~/) if they are not already there.

set -e TOIL_AWS_ZONE=us-west-2c

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 quay.io/ucsc_cgl/toil:3.11.0 \
    toil launch-cluster sortcluster --leaderNodeType t2.medium --keyPairName bjea-US-WEST-2 --zone us-west-2c

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" \
    quay.io/ucsc_cgl/toil:3.11.0 toil rsync-cluster --insecure sortcluster /curr/experiments/Sort_AWS/sort.py :\tmp

exit 0
