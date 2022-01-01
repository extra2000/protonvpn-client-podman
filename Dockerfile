FROM docker.io/library/ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

RUN apt update && apt install -y openvpn \
    curl \
    dialog \
    git \
    python3 \
    python3-dev \
    python3-distutils \
    python3-setuptools \
    python3-pip \
    iputils-ping \
    iptables \
    dos2unix

WORKDIR /opt/
RUN git clone https://github.com/ProtonVPN/linux-cli-community protonvpn-cli-community
WORKDIR /opt/protonvpn-cli-community
RUN python3 -m pip install .
WORKDIR /

COPY entrypoint.sh /bin/entrypoint.sh
RUN dos2unix /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]
