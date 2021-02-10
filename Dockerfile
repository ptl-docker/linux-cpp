# Based on the official Debian image
FROM debian:stable-slim

# Boost
RUN apt update && apt -y install build-essential g++ wget

RUN wget --progress=dot:mega -O boost_1_75_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.75.0/boost_1_75_0.tar.gz/download &&\
    tar xzf boost_1_75_0.tar.gz &&\
    cd boost_1_75_0/ &&\
    ls -l  &&\
    ./bootstrap.sh --prefix=/usr/  &&\
    cd ..  &&\
    rm -rf boost_1_75_0/ &&\
    ls -l
