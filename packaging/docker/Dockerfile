FROM debian:jessie

RUN apt-get update && apt-get install -y \
cmake \
git \
libeigen3-dev \
libgmp-dev \
libmpfr-dev \
libgmpxx4ldbl \
libumfpack5.6.2 \
libboost-dev \
libboost-thread-dev \
python-nose \
python-numpy \
python-scipy \
python-setuptools \
python \
swig \
&& apt-get clean

WORKDIR /root/
RUN git clone https://github.com/qnzhou/PyMesh.git
RUN cd PyMesh && git submodule init && git submodule update

ENV PYMESH_PATH /root/PyMesh

RUN mkdir -p $PYMESH_PATH/third_party/build && mkdir -p $PYMESH_PATH/build
WORKDIR $PYMESH_PATH/third_party/build
RUN cmake .. && make -j 2 && make install && make clean
WORKDIR $PYMESH_PATH/build
RUN cmake .. && make -j 2 && make tools -j 2 && make all_tests
WORKDIR $PYMESH_PATH
RUN ./setup.py build && ./setup.py install && rm -rf build third_party/build && python -c "import pymesh; pymesh.test()"
WORKDIR /root/
RUN rm -rf PyMesh
