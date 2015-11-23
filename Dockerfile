FROM ubuntu:14.04
MAINTAINER marazmiki <marazmiki@gmail.com>

RUN apt-get update -y
RUN apt-get install -y\
 build-essential\
 git-core\
 qt4-qmake\
 libqt4-webkit\
 libqt4-dev\
 "g++"\
 xvfb


# Clone patched version of CutyCapt
RUN git clone https://github.com/marazmiki/CutyCapt.git /tmp/CutyCapt

# Build it from sources
WORKDIR /tmp/CutyCapt
RUN qmake
RUN make

# Put the CutyCapt binary into /usr/bin
RUN cp /tmp/CutyCapt/CutyCapt /usr/bin/cutycapt

# Clean package cache
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
