#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

install -d -g vagrant -m 0700 -o vagrant /home/vagrant/.ssh
install -g vagrant -m 0600 -o vagrant /tmp/vagrant.pub /home/vagrant/.ssh/authorized_keys

sync
