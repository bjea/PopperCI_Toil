FROM python:2.7
#RUN pip install toil
#RUN pip install toil[aws,mesos]
RUN apt-get update && apt-get install -y git

# Install and configure virtualenv.
RUN pip install virtualenv
#RUN virtualenv cactdev
#RUN /bin/bash -c "source cactdev/bin/activate"

# Install Toil.
RUN git clone https://github.com/BD2KGenomics/toil.git && cd toil
RUN virtualenv cactdev
RUN /bin/bash -c "source cactdev/bin/activate && \
  cd toil && \
  make prepare && \
  make develop extras=[aws,mesos]"

# Install CGCloud.
RUN /bin/bash -c "source cactdev/bin/activate && \
  cd .. && \
  git clone https://github.com/BD2KGenomics/cgcloud.git && \
  cd cgcloud && \
  make develop sdist"
