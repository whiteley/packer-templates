{ config, pkgs, ... }:

{
imports =
[
./hardware-configuration.nix
];

boot.loader.grub.enable = true;
boot.loader.grub.version = 2;
boot.loader.grub.device = "/dev/sda";

i18n = {
  consoleFont = "lat9w-16";
  consoleKeyMap = "us";
  defaultLocale = "en_US.UTF-8";
};

nix.distributedBuilds = true;
nix.useChroot = true;

nixpkgs.config.allowUnfree = true;

services.avahi.enable = true;
services.avahi.nssmdns = true;
services.haveged.enable = true;
services.openssh.enable = true;

users.extraUsers.vagrant = {
  description = "Vagrant user";
  group = "users";
  extraGroups = [ "wheel" ];
  home = "/home/vagrant";
  createHome = true;
  useDefaultShell = true;
  openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
  ];
};
}
