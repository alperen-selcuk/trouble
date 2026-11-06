FROM alpine:3.24

# Only stable v3.24 repos are used; edge/testing is pinned with the @testing tag
# and used solely for packages that do not exist in stable (swaks).
RUN set -ex \
    && echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk upgrade --no-cache \
    && apk add --no-cache \
    apache2-utils \
    bash \
    bind-tools \
    busybox-extras \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ethtool \
    file \
    iputils \
    httpie \
    jq \
    liboping \
    ltrace \
    mtr \
    net-snmp-tools \
    netcat-openbsd \
    net-tools \
    nftables \
    ngrep \
    nmap \
    nmap-nping \
    nmap-scripts \
    openssl \
    scapy \
    socat \
    speedtest-cli \
    openssh-client \
    oh-my-zsh \
    zsh-autosuggestions \
    strace \
    tcpdump \
    tcptraceroute \
    tshark \
    util-linux \
    vim \
    git \
    zsh \
    websocat \
    swaks@testing \
    perl-net-ssleay \
    perl-io-socket-ssl \
    postgresql-client \
    valkey-cli \
    mongodb-tools \
    && ln -s /usr/bin/valkey-cli /usr/local/bin/redis-cli

USER root
WORKDIR /root
ENV HOSTNAME=trouble

COPY zshrc .zshrc
COPY motd motd

RUN chmod -R g=u /root
RUN chown root:root /usr/bin/dumpcap

# Running ZSH
CMD ["zsh"]
