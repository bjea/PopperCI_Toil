#!/usr/bin/env bash

set -e TOIL_APPLIANCE_SELF=quay.io/ucsc_cgl/toil:3.11.0
#TOIL_APPLIANCE_SELF=quay.io/ucsc_cgl/toil:3.11.0 cactus --provisioner aws --nodeTypes c3.4xlarge --maxNodes 2 --minNodes 0 --retry 10 --batchSystem mesos --disableCaching --logDebug --logFile /logFile_pestis3 --configFile /tmp/blockTrim3.xml aws:us-west-2:bettiescactus-pestis /tmp/pestis-short-aws-seqFile.txt /tmp/pestis_new_output3.hal

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install git
sudo pip install mesos.cli
sudo apt-get install nano
virtualenv --system-site-packages cact_venv
source cact_venv/bin/activate
git clone https://github.com/ComparativeGenomicsToolkit/cactus
cd cactus
pip install --upgrade .

blockTrim=(1 3)
minNodes=(0 2)

for i in "${blockTrim[@]}"
do
    for j in "${minNodes[@]}"
    do
        toil clean aws:us-west-2:bettiescactus-pestis

        cactus --provisioner aws --nodeTypes c3.2xlarge --minNodes=$j --maxNodes 5 \
        --retry 10 --batchSystem mesos --disableCaching --logDebug --logFile /logFile_pestis_$i-$j \
        --configFile /tmp/blockTrim$i.xml aws:us-west-2:bettiescactus-pestis /tmp/pestis-short-aws-seqFile.txt \
        /tmp/pestis_output_new_$i-$j.hal

        rm -r /tmp/ssh*

    done;
done;

exit 0