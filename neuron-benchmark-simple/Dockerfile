FROM dmiyamoto/neuron:gcc-ompi
MAINTAINER Daisuke Miyamoto <miyamoto@brain.imi.i.u-tokyo.ac.jp>
WORKDIR /work

USER root
ADD hoc /work/hoc
ADD mod /work/mod
COPY run.sh /work
RUN chown -R neuron /work

USER neuron

RUN nrnivmodl mod \
    && mkdir log \
    && chmod +x run.sh

