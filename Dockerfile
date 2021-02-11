# Based on the official Debian image
FROM debian:stable-slim

# Install required additional packages
RUN apt update && apt -y install build-essential g++ wget

# Boost
RUN wget --progress=dot:mega -O boost_1_75_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.75.0/boost_1_75_0.tar.gz/download &&\
    tar xzf boost_1_75_0.tar.gz &&\
    cd boost_1_75_0/ &&\
    ./bootstrap.sh --prefix=/usr/ --with-libraries=all --with-toolset=gcc &&\
    ./b2 toolset=gcc &&\
    ./b2 install --prefix=/usr &&\
    cd .. &&\
    rm -rf boost_1_75_0/ && rm boost_1_75_0.tar.gz
