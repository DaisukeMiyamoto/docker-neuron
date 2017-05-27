FROM dmiyamoto/neuron:gcc-ompi
MAINTAINER Daisuke Miyamoto <miyamoto@brain.imi.i.u-tokyo.ac.jp>
WORKDIR /work
USER root

COPY jupyter_notebook_config.py /etc/jupyter/

RUN cd /work/nrn-7.4/src/nrnpython \
    && python setup.py install

EXPOSE 8888
USER neuron
CMD jupyter notebook
