#!/bin/sh
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
DEBIAN_FRONTEND=noninteractive apt-get update -q
DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    python-pip \
    python-git \
    python-software-properties \
    salt-minion \
    gpgv \
    gpgv2

pip install "GitPython>=0.3.2.1" "docker-py>=1.4" "pip"

# Setup GPG keys
/opt/server.eligundry.com/bin/salt-setup-gpg.sh --setup-salt-gpg

# Run salt bootstrap
curl -o /tmp/.bootstrap_salt.sh -L https://bootstrap.saltstack.com
chmod a+x /tmp/.bootstrap_salt.sh

/tmp/.bootstrap_salt.sh -P
