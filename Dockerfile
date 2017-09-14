FROM python:2.7
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get install -y \
  git \
  nano
RUN pip install mesos.cli
RUN git clone https://github.com/ComparativeGenomicsToolkit/cactus && cd cactus && git checkout toil-docker
RUN pip install --upgrade cactus
RUN pip install toil
RUN pip install toil[aws,mesos]

