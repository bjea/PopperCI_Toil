#!/bin/bash
# The point of entry to the validation of results produced by the experiment.
# Any non-zero exit code will be interpreted as a failure by the 'popper check'
# command. Additionally, the command should print "true" or "false" for each
# validation (one per line, each interpreted as a separate validation).

set -e TOIL_AWS_ZONE=us-west-2c

numLines=(1000 2000)
lineLength=(50 25)

for i in "${numLines[@]}"
do
    for j in "${lineLength[@]}"
    do
        docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 550:550 -e "TOIL_AWS_ZONE=us-west-2c" \
        quay.io/ucsc_cgl/toil:3.11.0 toil rsync-cluster --insecure sortcluster :/sortedFile-$i-$j.txt \
        /curr/experiments/Sort_AWS/

    done;
done;

exit 0
