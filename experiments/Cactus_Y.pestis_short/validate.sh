#!/bin/bash
set -e TOIL_AWS_ZONE=us-west-2c

blockTrim=(1 3)
minNodes=(0 2)

for i in "${blockTrim[@]}"
do
    for j in "${minNodes[@]}"
    do
        docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 550:550 -e "TOIL_AWS_ZONE=us-west-2c" \
        quay.io/ucsc_cgl/toil:3.11.0 toil rsync-cluster --insecure cactuscluster :/tmp/pestis_output_$i-$j.hal \
        /curr/experiments/Cactus_Y.pestis_short/

    done;
done;


for i in "${blockTrim[@]}"
do
    for j in "${minNodes[@]}"
    do
        docker run --rm -ti -v `pwd`:/root --entrypoint=h5diff hdfgroup/hdf5-json \
        /root/experiments/Cactus_Y.pestis_short/pestis_output$i.hal \
        /root/experiments/Cactus_Y.pestis_short/pestis_output_$i-$j.hal

    done;
done;


exit 0