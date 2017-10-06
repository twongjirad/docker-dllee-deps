FROM ubuntu:14.04
FROM twongjirad/docker-ubuntu14.04-root-6.04.18:latest

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
			python-numpy \
			python-pip \
			python-pandas && \
    pip install root_numpy && \
    apt-get autoremove -y & apt-get clean -y & \
    mkdir -p /tmp/build && cd /tmp/ && \
    git clone https://github.com/opencv/opencv source && cd source && \
    git checkout 3.1.0 && cd /tmp/build && \
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local /tmp/source && \
    make -j4 && make install -j4 && \
    rm -r /tmp/build && rm -r /tmp/source && \
    apt-get autoremove -y && apt-get clean -y
