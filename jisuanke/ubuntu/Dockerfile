# Set the base image to Ubuntu 18.04
FROM ubuntu:18.04

# Set the file maintainer
MAINTAINER iBug <docker@ibugone.com>

# Setup Ubuntu for building
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y update && \
    apt-get -y install gcc make libmariadbclient-dev libffi-dev libssl-dev \
               wget curl vim && \
    apt-get -y clean && rm -rf /var/cache/apt /var/lib/apt/lists

# Setup Python 3.7
ARG PYTHONVERSION=3.7.3
ENV PYTHONUNBUFFERED 1
RUN cd /tmp && \
    wget -O Python-${PYTHONVERSION}.tgz https://www.python.org/ftp/python/${PYTHONVERSION}/Python-${PYTHONVERSION}.tgz && \
    tar zxf Python-${PYTHONVERSION}.tgz && \
    cd Python-${PYTHONVERSION} && ./configure && \
    make -j8 && make install && cd .. && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip && \
    rm -rf /tmp/Python-${PYTHONVERSION}* && \
    /usr/local/bin/pip3 install --upgrade pip ipython bpython pipenv && \
    mkdir /code

WORKDIR /code
