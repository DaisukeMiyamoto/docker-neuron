FROM dmiyamoto/neuron:gcc-ompi
MAINTAINER Daisuke Miyamoto miyamoto@brain.imi.i.u-tokyo.ac.jp
WORKDIR /work

RUN cd /work/nrn-7.4/src/nrnpython \
    && python setup.py install

RUN useradd neuron
USER neuron

CMD python

