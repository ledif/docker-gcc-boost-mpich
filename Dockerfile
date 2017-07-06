FROM ubuntu:16.04

ENV CXX=g++-4.9

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get install -y build-essential \
                       gcc-4.9 \
                       g++-4.9 \
                       gfortran-4.9 \
                       make \
                       autoconf \
                       git \
                       autotools-dev \
                       mpich
                       
RUN apt-get install -y wget

Run wget -O /boost_1_63_0.tar.bz2 -c 'http://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.tar.bz2/download' --max-redirect=100 \
 && cd / && tar xjf /boost_1_63_0.tar.bz2 \
 && cd /boost_1_63_0/ \
 && ./bootstrap.sh --prefix=/opt/boost_1_63_0 --with-libraries=atomic,chrono,container,context,coroutine,date_time,exception,filesystem,graph,iostreams,locale,log,math,program_options,random,regex,serialization,signals,system,test,thread,timer,wave

RUN cd /boost_1_63_0 && ./b2 toolset=gcc-4.9 install || true
