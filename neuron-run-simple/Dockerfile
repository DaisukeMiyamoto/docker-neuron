MAINTAINER Daisuke Miyamoto miyamoto@brain.imi.i.u-tokyo.ac.jp

FROM dmiyamoto/neuron:gcc-ompi

ARG NRN=/work/nrn-7.4/x86_64/bin/nrniv
RUN useradd neuron

USER neuron
WORKDIR /work
CMD $NRN
