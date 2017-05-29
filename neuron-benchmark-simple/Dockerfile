FROM dmiyamoto/neuron:gcc-ompi
MAINTAINER Daisuke Miyamoto <miyamoto@brain.imi.i.u-tokyo.ac.jp>
WORKDIR /work
USER neuron

ADD hoc /work/hoc
ADD mod /work/mod
COPY run.sh /work

RUN nrnivmodl mod \
    && chmod +x run.sh

