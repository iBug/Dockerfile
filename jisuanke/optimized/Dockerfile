# Set the base image to use to CentOS 7
FROM centos:7

# Set the file maintainer
MAINTAINER iBug <docker@ibugone.com>

# Setup CentOS for building
RUN yum -y install wget make yum-utils gcc vim mariadb-devel && \
    yum-builddep python -y && \
    yum clean all

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
