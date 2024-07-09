FROM ubuntu:24.04

# https://hmli.ustc.edu.cn/doc/linux/slurm-install/slurm-install.html
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -Ei 's/(archive|security)\.ubuntu\.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && \
    apt-get -y install libmunge-dev libmariadb-dev libpam0g-dev libcgroup-dev libhwloc-dev build-essential fakeroot devscripts equivs \
        wget && \
    apt-get clean
WORKDIR /src

ARG SLURM_VERSION=24.05.1
RUN wget https://download.schedmd.com/slurm/slurm-${SLURM_VERSION}.tar.bz2 && \
    tar axf slurm-${SLURM_VERSION}.tar.bz2 && \
    cd slurm-${SLURM_VERSION} && \
    mk-build-deps -i debian/control -t 'apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y' && \
    debuild -b -uc -us
