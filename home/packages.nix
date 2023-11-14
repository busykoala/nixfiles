{ pkgs, ... }:

let
  python-packages = ps: with ps; [
    pip
    requests
  ];
in

{
  home.packages = with pkgs; [
    (python311.withPackages python-packages)
    awscli2
    azure-cli
    azure-functions-core-tools
    bat
    cargo
    chromium
    cowsay
    curl
    delta
    eza
    fd
    firefox
    fortune
    fzf
    gcc
    gimp
    gnome.gnome-tweaks
    gnumake
    gnupg
    go
    grc
    hugo
    jdk
    k9s
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
    ripgrep
    signal-desktop
    sl
    slack
    terraform-lsp
    texlive.combined.scheme-full
    thefuck
    thunderbird
    tmux
    tree
    unzip
    wget
    whois
    yarn
    zip
  ];
}
