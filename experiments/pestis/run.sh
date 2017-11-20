#!/usr/bin/env bash

set -e TOIL_APPLIANCE_SELF=quay.io/ucsc_cgl/toil:3.11.0
#TOIL_APPLIANCE_SELF=quay.io/ucsc_cgl/toil:3.11.0 cactus --provisioner aws --nodeTypes c3.4xlarge --maxNodes 2 --minNodes 0 --retry 10 --batchSystem mesos --disableCaching --logDebug --logFile /logFile_pestis3 --configFile /tmp/blockTrim3.xml aws:us-west-2:bettiescactus-pestis /tmp/pestis-short-aws-seqFile.txt /tmp/pestis_output3.hal

blockTrim=(1 3)
maxNodes=(2 4)

for i in "${blockTrim[@]}"
do
    for j in "${maxNodes[@]}"
    do
        toil clean aws:us-west-2:bettiescactus-pestis

        cactus --provisioner aws --nodeTypes c3.4xlarge --maxNodes=$j \
        --minNodes 0 --retry 10 --batchSystem mesos --disableCaching --logDebug --logFile /logFile_pestis_$i-$j \
        --configFile /tmp/blockTrim$i.xml aws:us-west-2:bettiescactus-pestis /tmp/pestis-short-aws-seqFile.txt \
        /tmp/pestis_output_$i-$j.hal

        rm -r /tmp/ssh*

    done;
done;

exit 0