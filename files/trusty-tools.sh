#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

sudo mkdir /mnt/vmware-tools
sudo mount -o loop linux.iso /mnt/vmware-tools
tar zxf /mnt/vmware-tools/VMwareTools-*.tar.gz -C /tmp
pushd /tmp/vmware-tools-distrib
bash /tmp/vmware_hgfs_fix12.sh
popd
sudo /tmp/vmware-tools-distrib/vmware-install.pl --default
rm -rf /tmp/vmware-tools-distrib
sudo umount /mnt/vmware-tools
sudo rmdir /mnt/vmware-tools
