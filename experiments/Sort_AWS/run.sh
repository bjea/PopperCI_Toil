#!/bin/bash
# The value of flag --mesosMaster <private-IP>:5050 in leaderNode.sh cannot be obtained till the leader node is
# launched (after setup.sh is run), and the value of <private-IP> should be filled in before this file is run..

# This file contains the series of steps that are required to execute
# the experiment. Any non-zero exit code will be interpreted as a failure
# by the 'popper check' command.

set -e TOIL_AWS_ZONE=us-west-2c

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" \
    quay.io/ucsc_cgl/toil:3.11.0 toil rsync-cluster --insecure sortcluster /curr/experiments/Sort_AWS/leaderNode.sh :\tmp

docker run --rm -it -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" \
    quay.io/ucsc_cgl/toil:3.11.0 toil ssh-cluster sortcluster bash /tmp/leaderNode.sh

exit 0