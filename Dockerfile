# Based on the official Debian image
FROM debian:stable-slim

# Boost version to install
ARG BOOST_MAJOR=1
ARG BOOST_MINOR=87
ARG BOOST_PATCH=0
# Additional variables for convenience
ARG BOOST_FOLDER=boost_${BOOST_MAJOR}_${BOOST_MINOR}_${BOOST_PATCH}
ARG BOOST_TARFILE=boost_${BOOST_MAJOR}_${BOOST_MINOR}_${BOOST_PATCH}.tar.gz

# Install required additional packages
RUN apt-get update && apt-get -y install git build-essential g++ wget

# Compile and install Boost
# See https://www.boost.org/doc/libs/1_87_0/more/getting_started/unix-variants.html
RUN wget --progress=dot:mega -O ${BOOST_TARFILE} https://sourceforge.net/projects/boost/files/boost/${BOOST_MAJOR}.${BOOST_MINOR}.${BOOST_PATCH}/${BOOST_TARFILE}/download &&\
    tar xzf ${BOOST_TARFILE} &&\
    cd ${BOOST_FOLDER} &&\
    ./bootstrap.sh --prefix=/usr/ --with-libraries=all --with-toolset=gcc &&\
    ./b2 toolset=gcc &&\
    ./b2 install --prefix=/usr &&\
    cd .. &&\
    rm -rf ${BOOST_FOLDER} && rm ${BOOST_TARFILE}

# TODO: Use CMD here instead of RUN
#RUN echo "*** BUILD COMPLETE ***" &&\
#    cat /usr/include/boost/version.hpp | grep "BOOST_LIB_VERSION"
