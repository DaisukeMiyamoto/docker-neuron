docker-neuron
---

[![Build Status](https://travis-ci.org/DaisukeMiyamoto/docker-neuron.svg?branch=master)](https://travis-ci.org/DaisukeMiyamoto/docker-neuron)

docker containers for NEURON simulator

# Basic Usage

## run NERUON GCC+OpenMPI+Python version

```
$ docker run -it dmiyamoto/neuron:gcc-ompi
```


- you could run python with neuron in docker image

```
$ python
Python 2.7.12 (default, Nov 19 2016, 06:48:10)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import neuron
NEURON -- Release 7.4 (1370:16a7055d4a86) 2015-11-09
Duke, Yale, and the BlueBrain Project -- Copyright 1984-2015
See http://www.neuron.yale.edu/neuron/credits

>>>
```

## run NEURON with Jupyter Notebook

```
$ docker run -it dmiyamoto/neuron:jupyter
```



## run NEURON dpkg distributed version

```
$ docker run -it dmiyamoto/neuron:dpkg
```

# simulation built-in version
## benchmark of the multi compartment hodgkin-huxley model (devel)

```
$ docker pull dmiyamoto/neuron:bench
```


# Reference
- https://hub.docker.com/r/dmiyamoto/neuron/
- http://neuron.yale.edu

