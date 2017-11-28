#!/usr/bin/env bash
set -e TOIL_AWS_ZONE=us-west-2c

blockTrim=(1 3)
minNodes=(0 2)

for i in "${blockTrim[@]}"
do
    for j in "${minNodes[@]}"
    do
        docker run --rm -v `pwd`:/root --workdir=/root -p 550:550 -e "TOIL_AWS_ZONE=us-west-2c" \
        quay.io/ucsc_cgl/toil:3.11.0 toil rsync-cluster --insecure cactuscluster :/tmp/pestis_output_new_$i-$j.hal \
        /root/experiments/pestis/

    done;
done;


for i in "${blockTrim[@]}"
do
    for j in "${minNodes[@]}"
    do
        docker run --rm -ti -v `pwd`:/root --entrypoint=h5diff hdfgroup/hdf5-json \
        /root/experiments/pestis/pestis_output$i.hal /root/experiments/pestis/pestis_output_new_$i-$j.hal

    done;
done;


exit