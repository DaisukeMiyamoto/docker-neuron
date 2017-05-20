FROM ubuntu:16.04

MAINTAINER Daisuke Miyamoto miyamoto@brain.imi.i.u-tokyo.ac.jp

ARG NRN_VERSION="7.4"
ARG NRN_ARCH="x86_64"
ARG NRN_CONFIGURE_OPT="--without-iv --with-nrnpython=/usr/bin/python --with-paranrn"
ARG NRN_CFLAGS="-O3"
ARG NRN_CXXFLAGS="-O3"

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
        openmpi-bin \
        openmpi-common \
        libopenmpi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN mkdir work \
    && cd work \
    && wget http://www.neuron.yale.edu/ftp/neuron/versions/v${NRN_VERSION}/nrn-${NRN_VERSION}.tar.gz \
    && tar xvzf nrn-${NRN_VERSION}.tar.gz \
    && cd nrn-${NRN_VERSION} \
    && ./configure --prefix=`pwd` ${NRN_CONFIGURE_OPT} CFLAGS=${NRN_CFLAGS} CXXFLAGS=${NRN_CXXFLAGS} \
    && make \
    && make install

ENV LANG en_US.utf8
