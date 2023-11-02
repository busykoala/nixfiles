{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    cargo
    chromium
    curl
    fd
    firefox
    fzf
    gcc
    gimp
    gnome.gnome-tweaks
    gnumake
    gnupg
    grc
    keepassxc
    kubectl
    kubernetes-helm
    libreoffice
    lolcat
    nmap
    nodejs
    opentofu
    pandoc
    poetry
    python3
    ripgrep
    texlive.combined.scheme-full
    tmux
    tree
    unzip
    wget
    whois
    zip
  ];
}
