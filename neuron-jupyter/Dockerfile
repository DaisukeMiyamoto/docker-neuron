FROM dmiyamoto/neuron:gcc-ompi
MAINTAINER Daisuke Miyamoto <miyamoto@brain.imi.i.u-tokyo.ac.jp>
WORKDIR /work

#COPY requirements.txt /work
#RUN pip install --upgrade pip \
#    && pip install -r /work/requirements.txt

COPY jupyter_notebook_config.py /etc/jupyter/

RUN cd /work/nrn-7.4/src/nrnpython \
    && python setup.py install

EXPOSE 8888
RUN useradd neuron
USER neuron
CMD jupyter notebook
