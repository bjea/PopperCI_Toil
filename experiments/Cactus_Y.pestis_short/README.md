Cactus, which uses Toil to coordinate its jobs, is a reference-free, whole-genome multiple-sequence alignment program.
The sequence used in this example is *Yersinia pestis* (~4.6 megabases), which is a Gram-negative, rod-shaped coccobacillus, a facultative anaerobic organism that can infect humans via the oriental rat flea and can cause the deadly disease called Bubonic Plague (or "the Plague") . 

When we run Cactus in AWS, it is running inside a Docker container -- a runtime instance of the Docker image [quay.io/ucsc_cgl/toil](quay.io/ucsc_cgl/toil) -- which contains the Mesos scheduler and other requirements. 
Then, the Cactus script gets installed in a virtual environment (or `virtualenv`) within such container, and a number of other containers (with the same [quay.io/ucsc_cgl/toil](quay.io/ucsc_cgl/toil) image) are spun up on worker nodes launched by the leader node. 
The virtual environment is faithfully copied over to all the workers so that they all have a copy of the pipeline orchestrated by Toil.

A user can type in merely one command, `popper check`, of the [Popper CLI](https://github.com/systemslab/popper/tree/master/popper#install) tool (*cf.* 31 commands (if a traditional method is used, and it starts from preparing for and installing the Toil software, see [Toil - Installation](https://toil.readthedocs.io/en/3.12.0/gettingStarted/install.html), but does not take encryption into consideration, and if only four genomic sequences are used as samples to run Cactus), and everything, including the parameter sweep if desired, works like a charm -- exactly as expected.

In this case, the parameters used include `--configFile` (a Cactus parameter); `--minNodes`, `--maxNodes`, and `--nodeTypes` (Toil parameters, which should not change the output results).
