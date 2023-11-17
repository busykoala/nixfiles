{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../../system/common.nix
    ];
}
