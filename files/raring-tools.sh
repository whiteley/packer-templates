#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

kver=$(uname -r)
sudo ln -s /usr/src/linux-headers-${kver}/include/generated/uapi/linux/version.h /usr/src/linux-headers-${kver}/include/linux/version.h

sudo mkdir /mnt/vmware-tools
sudo mount -o loop linux.iso /mnt/vmware-tools
tar zxf /mnt/vmware-tools/VMwareTools-9.2.2-893683.tar.gz -C /tmp
pushd /tmp/vmware-tools-distrib
bash /tmp/vmware_hgfs_fix.sh
bash /tmp/vmware_vmci_fix.sh
popd
sudo /tmp/vmware-tools-distrib/vmware-install.pl --default
rm -rf /tmp/vmware-tools/distrib
sudo umount /mnt/vmware-tools
sudo rmdir /mnt/vmware-tools
