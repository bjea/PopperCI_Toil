# Reproducibility: Combination of PopperCI and Toil
This repo shows how to leverage PopperCI and Toil to automate the process of running Cactus program reproducibly and conduct a parameter sweep thereof.

[PopperCI](http://popper.readthedocs.io/en/latest/index.html)--the integration of the Popper Convention and existing continuous integration (CI) systems/services--enables researchers to automate end-to-end execution and validation of computer science experiments.

[Toil](http://toil.readthedocs.io/en/latest/index.html) is an open-source, portable, and pure-Python workflow software package that supports contemporary workflow definition languages and can be used to securely,  reproducibly run scientific workflows efficiently on a grand scale in cloud or high-performance computing environments.

[Cactus](https://github.com/ComparativeGenomicsToolkit/cactus) is a reference-free, whole-genome multiple-sequence alignment program and uses [Toil](https://github.com/BD2KGenomics/toil) to coordinate its jobs.

This repo demonstrates a couple of examples of leveraging PopperCI to fully automate and further simplify the process of running Toil workflows reproducibly.
