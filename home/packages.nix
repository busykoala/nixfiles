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
    altair
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
    citrix_workspace
    copyq
    cowsay
    curl
    delta
    distrobox
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
    hugo
    jdk
    john
    jq
    julia-lts
    k9s
    keepassxc
    kube-score
    kubectl
    kubernetes-helm
    libreoffice
    lolcat
    metasploit
    mtr
    netdiscover
    nikto
    nmap
    nodejs
    openssl
    opentofu
    p0f
    pandoc
    podman-compose
    poetry
    quickemu
    ripgrep
    signal-desktop
    sl
    slack
    sqlmap
    subfinder
    tcpdump
    terraform-lsp
    texlive.combined.scheme-full
    thefuck
    thunderbird
    tmux
    traceroute
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
