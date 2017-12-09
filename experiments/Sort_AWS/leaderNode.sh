#!/bin/bash
# This file contains the series of steps that are required to execute
# the experiment, which is a parameter sweep, on the leader node in cloud.
# The value of flag --mesosMaster <private-IP>:5050 cannot be obtained till the leader node is launched.

numLines=(1000 2000)
lineLength=(50 25)

for i in "${numLines[@]}"
do
    for j in "${lineLength[@]}"
    do
        toil clean aws:us-west-2:autoscaling-sort-jobstore

        python /tmp/sort.py aws:us-west-2:autoscaling-sort-jobstore --numLines=$i --lineLength=$j \
        --provisioner aws --nodeTypes c3.large --batchSystem mesos --mesosMaster 172.31.14.242:5050 \
        --logLevel DEBUG --maxNodes 8
        rm fileToSort.txt
        rm -r /tmp/ssh*

    done;
done;


exit 0