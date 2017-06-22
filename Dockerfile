FROM ubuntu

RUN apt-get update && apt-get install -y python git git-core wget build-essential

RUN pwd
RUN wget https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz
RUN tar xzf cmake-3.8.2.tar.gz

WORKDIR /cmake-3.8.2
RUN ./configure --prefix=/opt/cmake
RUN make
RUN make install


WORKDIR /

RUN git clone --recursive https://github.com/Statoil/segyio

RUN mkdir -p /segyio/build

WORKDIR  /segyio/build
RUN ls -la /opt/cmake/bin/cmake
RUN apt-get install -y python2.7-dev python-numpy
RUN /opt/cmake/bin/cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
RUN make
RUN make install
