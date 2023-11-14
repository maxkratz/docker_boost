FROM ubuntu:22.04
LABEL maintainer="Max Kratz <account@maxkratz.com>"
ENV DEBIAN_FRONTEND=noninteractive

# Update and install various packages
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq \
        build-essential g++ python3-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev wget make cmake

RUN mkdir -p /tmp/boost-build
WORKDIR /tmp/boost-build
RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.gz
RUN tar xvf boost_1_81_0.tar.gz
WORKDIR /tmp/boost-build/boost_1_81_0
RUN ./bootstrap.sh --prefix=/usr/
RUN ./b2 install

RUN rm -rf /tmp/boost-build
# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD ["bash"]