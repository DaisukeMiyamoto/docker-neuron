FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y \
        locales \
        wget \
        gcc \
        g++ \
        build-essential \
        libncurses-dev \
        python \
        libpython-dev \
        cython \
    && mkdir work \
    && cd work \
    && wget http://www.neuron.yale.edu/ftp/neuron/versions/v7.4/nrn-7.4.tar.gz \
    && tar xvzf nrn-7.4.tar.gz \
    && cd nrn-7.4 \
    && ./configure --prefix=`pwd` --without-iv --with-nrnpython=/usr/bin/python \
    && make \
    && make install \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-get clean

ENV LANG en_US.utf8

# CMD /work/nrn-7.4/x86_64/bin/nrniv -python
