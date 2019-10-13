ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND noninteractive

# Development deps
RUN apt update && apt install -y \
    software-properties-common \
    build-essential \
    git \
    wget \
    cmake \
    libjpeg-dev \
    sudo \
    curl

# Realsense keys and repo
RUN apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE \
    || \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u

# Realsense libraries, apps and utils
RUN apt install -y \
    librealsense2-dkms \
    librealsense2-utils \
    librealsense2-dev \
    librealsense2-dbg \
    librealsense2-udev-rules \
    usbutils

ENTRYPOINT /bin/bash