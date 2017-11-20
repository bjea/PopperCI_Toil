#!/usr/bin/env bash
set -e TOIL_AWS_ZONE=us-west-2c

blockTrim=(1 3)
maxNodes=(2 4)

for i in "${blockTrim[@]}"
do
    for j in "${maxNodes[@]}"
    do
        docker run --rm -v `pwd`:/root --workdir=/root -p 550:550 -e "TOIL_AWS_ZONE=us-west-2c" \
        quay.io/ucsc_cgl/toil:3.11.0 toil rsync-cluster --insecure cactuscluster :/tmp/pestis_output_$i-$j.hal

    done;
done;

exit