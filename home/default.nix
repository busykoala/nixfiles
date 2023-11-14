{ config, pkgs, ... }:

let
  config-files = [
    ./configs/coc-settings.nix
  ];
in

{
  imports = [
    ./packages.nix
    ./aliases.nix
  ] ++config-files;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "busykoala";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "23.05";

  programs = {
    home-manager.enable = true;
    direnv = import ./tools/direnv.nix;
    git = import ./tools/git.nix;
    zsh = import ./tools/zsh.nix;
    neovim = import ./tools/neovim.nix { inherit pkgs; };
    tmux = import ./tools/tmux.nix;
    alacritty = import ./tools/alacritty.nix;
  };
}
