#!/usr/bin/env bash
APT_SOURCE="deb http://apt.puppetlabs.com bionic puppet6"
APT_KEYID="EF8D349F"

printf "\n>>> Configure timezone & locale\n"
sudo timedatectl set-timezone Asia/Taipei
sudo locale-gen zh_TW.UTF-8
echo 'export LC_ALL=en_US.UTF-8' >> "$HOME/.profile"

printf "\n>>> Install required packages\n"
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common lsb-release curl ca-certificates cloud-utils

printf "\n>>> Install Puppet Agent\n"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "$APT_KEYID"
sudo tee /etc/apt/sources.list.d/puppet6.list << EOF
${APT_SOURCE}
EOF
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y puppet-agent

printf "\n>>> Clean APT caches\n"
sudo apt-get -y clean

printf "\n>>> Done!\n"