packer-templates
================

Ubuntu Packer templates for VMware Fusion

###### Included templates
* 13.04 (raring)
* 13.10 (saucy)

###### Notes
* Installs VMware tools using patches if needed
* Installs Vagrant insecure public key
* VHV is enabled for nested hypervisors on the guest
* Vagrant User password is 'packer'

###### Usage
* Download [Packer](http://www.packer.io/downloads.html) and unzip in `bin/`
* Run `packer build template.json`
