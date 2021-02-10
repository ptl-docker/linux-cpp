# Based on the official Debian image
FROM debian:stable-slim

# Boost
RUN apt update
RUN apt -y install build-essential g++ wget

RUN wget -O boost_1_75_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.75.0/boost_1_75_0.tar.gz/download
RUN tar xzf boost_1_75_0.tar.gz
RUN cd boost_1_75_0/

RUN ./bootstrap.sh --prefix=/usr/

RUN rm -rf boost_1_75_0/
