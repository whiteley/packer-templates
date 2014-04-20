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
}
