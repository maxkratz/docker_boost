FROM ubuntu:24.04
LABEL maintainer="Max Kratz <account@maxkratz.com>"
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# Update and install various packages
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq \
        build-essential g++ python3-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev wget make cmake

RUN mkdir -p /tmp/boost-build
WORKDIR /tmp/boost-build

# e.g., boost_version = 1.81.0
ARG boost_version
ENV boost_version="$boost_version"

RUN wget https://boostorg.jfrog.io/artifactory/main/release/${boost_version}/source/boost_${boost_version//./_}.tar.gz
RUN tar xvf boost_${boost_version//./_}.tar.gz
RUN cd /tmp/boost-build/boost_${boost_version//./_} && ./bootstrap.sh --prefix=/usr/
RUN cd /tmp/boost-build/boost_${boost_version//./_} &&./b2 install

# Remove src folder of the build (for storage efficiency)
RUN rm -rf /tmp/boost-build
# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD ["bash"]
