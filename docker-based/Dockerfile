FROM ubuntu:18.04

MAINTAINER Maxron zero.maxima@gmail.com

ARG DEBIAN_FRONTEND=noninteractive

# Change apt source to NCHC
RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list

# Install dependencies
RUN apt-get update && \
    apt-get install -yq apt-utils --no-install-recommends && \
    apt-get clean

#Setup timezone
RUN apt-get -y install --reinstall locales && \
    dpkg-reconfigure locales && \
    echo 'zh_TW.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen zh_TW zh_TW.UTF-8 en_US.UTF-8 && \
    localedef --list-archive && locale -a &&  \
    update-locale && \
    apt-get clean

# Setup ssh server
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:toor' | chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#-----------------------------------------------
# Setup workspace
ENV WORKSPACE /root
WORKDIR $WORKSPACE

USER root

# Execute sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
