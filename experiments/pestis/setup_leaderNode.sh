#!/bin/bash
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

exit