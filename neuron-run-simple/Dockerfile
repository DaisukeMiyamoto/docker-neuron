FROM dmiyamoto/neuron:gcc-ompi

MAINTAINER Daisuke Miyamoto miyamoto@brain.imi.i.u-tokyo.ac.jp

ARG NRN=/work/nrn-7.4/x86_64/bin/nrniv
ARG HOC_FILE=
RUN useradd neuron

USER neuron
WORKDIR /work

COPY test.hoc /work

CMD nrniv test.hoc
