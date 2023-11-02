{ config, ... }:

{
  imports = [
    ./packages.nix
    ./tools.nix
    ./aliases.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "busykoala";
  home.homeDirectory = "/home/${config.home.username}";

  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
