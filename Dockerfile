# Pull base image.
FROM ubuntu:18.04

# Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip wget && \
  rm -rf /var/lib/apt/lists/*

# Files
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

CMD ["bash <( curl https://raw.githubusercontent.com/bulwark-crypto/Bulwark-MN-Install/master/install.sh )"]