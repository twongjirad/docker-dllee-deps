FROM ubuntu:16.10

FROM twongjirad/cern-root6-yakkety:6.08.06

MAINTAINER taritree.wongjirad@tufts.edu

# OPENCV3
RUN apt-get update && \
    apt-get install -y build-essential \
	    	    	cmake \
			git \
			libavcodec-dev \
			libavformat-dev \
			libdc1394-22-dev \
			libgtk2.0-dev \
			libjasper-dev \
			libjpeg-dev \
			libpng-dev \
			libswscale-dev \
			libtiff-dev \
			libtbb2 \
			libtbb-dev \
			pkg-config \
			python-dev \
			python-numpy && \
    apt-get autoremove -y & apt-get clean -y & \
    mkdir -p /tmp/build && cd /tmp/ && \
    git clone https://github.com/Itseez/opencv source && cd source && \
    git checkout 3.2.0 && cd /tmp/build && \
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local /tmp/source && \
    make -j4 && make install -j4 && \
    rm -r /tmp/build && rm -r /tmp/source && \
    apt-get autoremove -y && apt-get clean -y
