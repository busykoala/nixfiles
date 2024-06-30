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
    arp-scan
    awscli2
    azure-cli
    azure-functions-core-tools
    bat
    bind
    binwalk
    burpsuite
    cargo
    chromium
    copyq
    cowsay
    curl
    delta
    eza
    fd
    file
    firefox
    fortune
    fzf
    gcc
    gimp
    gnome.gnome-tweaks
    gnome.nautilus
    gnumake
    gnupg
    go
    gopls
    grc
    helmfile
    htop
    jdk
    jetbrains.datagrip
    jetbrains.pycharm-professional
    jetbrains.webstorm
    john
    jq
    k9s
    keepassxc
    kube-score
    kubectl
    kubernetes-helm
    libreoffice
    lolcat
    mtr
    nerdfonts
    netdiscover
    nikto
    nmap
    nodejs
    openssl
    opentofu
    p0f
    podman-compose
    poetry
    ripgrep
    signal-desktop
    sl
    slack
    sqlmap
    subfinder
    tcpdump
    terraform-lsp
    thefuck
    thunderbird
    tmux
    traceroute
    transmission_4-qt
    tree
    unzip
    wget
    whois
    wireshark
    xclip
    xsel
    yarn
    zip
    zotero
  ];
}
