#!/bin/bash
# Use this setup.sh to launch a leader node (`toil launch-cluster`) on AWS and upload required files to such leader
# node (`toil rsync-cluster`). Before running this shell script (`bash setup.sh`), a user needs to copy the .aws/ and
# .ssh/ (or create a new ssh key) folders to the home directory (~/) if they are not already there.

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 quay.io/ucsc_cgl/toil:3.11.0 toil launch-cluster \
    cactuscluster --leaderNodeType t2.medium --keyPairName bjea-US-WEST-2 --zone us-west-2c

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/pestis-short-aws-seqFile.txt :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/GCF_000169655.1_ASM16965v1_genomic.fna :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/GCF_000006645.1_ASM664v1_genomic.fna :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/GCF_000182485.1_ASM18248v1_genomic.fna :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/GCF_000013805.1_ASM1380v1_genomic.fna :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/leaderNode.sh :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/blockTrim1.xml :/tmp

docker run --rm -v $HOME:/root -v `pwd`:/curr --workdir=/curr -p 5050:5050 -e "TOIL_AWS_ZONE=us-west-2c" quay.io/ucsc_cgl/toil:3.11.0 \
    toil rsync-cluster --insecure cactuscluster /curr/experiments/Cactus_Y.pestis_short/datapackages/blockTrim3.xml :/tmp



exit 0