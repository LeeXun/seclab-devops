#!/usr/bin/env bash

MASTER_HOSTNAME="puppet.seclab.internal"
# Modify to your id here
WORKER_HOSTNAME="seclab.{your_gitlab_id}"
WORKER_ENV="production"
WORKER_ROLE="agent"

sudo echo "35.229.251.235 $MASTER_HOSTNAME" >> /etc/hosts

echo "\n>>> Configure Puppet Agent \n"
sudo tee /etc/default/puppet << EOF
# You may specify parameters to the puppet client here
# 更改 agent log，預設是寫在 syslog，但不易 debug，所以把 log 寫在這裡
PUPPET_EXTRA_OPTS=--logdest /var/log/puppetlabs/puppet/puppetd.log
EOF
sudo tee /etc/puppetlabs/puppet/puppet.conf << EOF
[main]
  puppetdlog = $logdir/puppetd.log
  rundir = /var/run/puppetlabs/puppet
  server = $MASTER_HOSTNAME
  certname = $WORKER_HOSTNAME
  report = true
  environment = $WORKER_ENV
  runinterval = 300
EOF

echo "\n>>> Configure Puppet Agent hostname\n"
sudo tee /etc/hostname << EOF
$WORKER_HOSTNAME
EOF
sudo hostname $WORKER_HOSTNAME
cat <<EOF >> /home/ubuntu/.profile
export HOSTNAME=$WORKER_HOSTNAME
EOF

echo "\n>>> Link Puppet Agent to sbin \n"
sudo ln -s  /opt/puppetlabs/bin/puppet /usr/sbin/puppet

echo "\n>>> Configure Facter\n"
sudo mkdir -p /etc/facter/facts.d
sudo tee /etc/facter/facts.d/instance_role.txt << EOF
instance_role=$WORKER_ROLE
EOF

echo "\n>>> Run Puppet Agent \n"
sudo puppet agent -t

echo "\n>>> Done!"
