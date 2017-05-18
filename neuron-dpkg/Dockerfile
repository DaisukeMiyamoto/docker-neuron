FROM ubuntu:16.04

ARG NRN_VERSION="7.4"
ARG NRN_ARCH="x86_64"

RUN apt-get update \
    && apt-get install -y \
        locales \
        wget \
        python \
    && mkdir work \
    && cd work \
    && wget http://www.neuron.yale.edu/ftp/neuron/versions/v${NRN_VERSION}/nrn-${NRN_VERSION}.${NRN_ARCH}.deb \
    && apt-get install -y ./nrn-${NRN_VERSION}.${NRN_ARCH}.deb \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-get clean

ENV LANG en_US.utf8
