{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    curl
    bat
    firefox
    fzf
    gnome.gnome-tweaks
    gnupg
    grc
    keepassxc
    ripgrep
    tmux
    gnumake
  ];
}
