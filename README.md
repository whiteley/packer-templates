packer-raring-fusion
====================

Ubuntu 13.04 amd64 Packer builder for VMware Fusion

* Installs VMware tools with some needed patches for 3.8 kernels
* Installs Vagrant insecure public key
* Download [Packer](http://www.packer.io/downloads.html) and unzip in `bin/`
* VHV is enabled for nested hypervisors on the guest
* Vagrant User password is 'packer'
