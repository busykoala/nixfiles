{ config, pkgs, ... }:

let
  config-files = [
    ../../../home/configs/coc-settings.nix
  ];
  gitUserEmail = "matthias@busykoala.io";
  gitSigningKey = "0B3928CBCA2E487849E9A52836B5F98B41732777";
in

{
  imports = [
    ../../../home/packages.nix
    ../../../home/aliases.nix
    ../../../home/dconf.nix
  ] ++config-files;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "busykoala";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "23.05";

  programs = {
    home-manager.enable = true;
    direnv = import ../../../home/tools/direnv.nix;
    git = import ../../../home/tools/git.nix { inherit gitUserEmail gitSigningKey; };
    zsh = import ../../../home/tools/zsh.nix;
    neovim = import ../../../home/tools/neovim.nix { inherit pkgs; };
    tmux = import ../../../home/tools/tmux.nix;
    alacritty = import ../../../home/tools/alacritty.nix;
  };
}
