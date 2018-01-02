# Automating a MergeSort Toil Workflow to Run in AWS
This merge sort is *smart* because each step of the process--dividing the file of interest into separate chunks, sorting these chunks, and merging these sorted chunks back together--is compartmentalized into a "job" of a Toil workflow (see [Toil -- Quickstart Examples](https://toil.readthedocs.io/en/3.12.0/gettingStarted/quickStart.html#a-more-real-world-example)). 
Each "job" is able to specify its own resource requirements and will be run only after the jobs that it depends upon have run.
Jobs without dependencies can be run in parallel.

A user needs to type in merely one command--`popper check`--of the Popper CLI tool (if on a local machine, one command needed: `popper check`; if in cloud, two commands required: (1) `bash setup.sh`, and (2) `popper check --skip setup.sh`, which is because the value of flag `--mesosMaster <private-IP>:5050` cannot be obtained till the leader node is launched, the `<private-IP>` needs to be filled in one of the files, i.e. `leaderNode.sh`, uploaded to the leader node. *Cf.* 14 commands using a traditional method), and everything, including the parameter sweep if desired, works like a charm--exactly as expected.  

In this case, the parameters used, e.g. `--numLines` (number of lines), `--lineLength` (how many characters in each line), are not for optimization purposes since this sorting program is designed not to run fast but rather to showcase a Toil workflow and its capability--also to showcase Popper's user-friendliness and convenience.
More importantly, now that the `sort` example is a self-contained, Popper-compliant experiment, its reproducibility is warranted. 
