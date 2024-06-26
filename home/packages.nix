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
    ghc
    gimp
    gnome.gnome-tweaks
    gnome.nautilus
    gnumake
    gnupg
    go
    gopls
    grc
    haskell-language-server
    helix-gpt
    helmfile
    hugo
    jdk
    jetbrains.datagrip
    jetbrains.pycharm-professional
    jetbrains.webstorm
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
    transmission_4-qt
    tree
    unzip
    wget
    whois
    wireshark
    xclip
    xsel
    yarn
    zed-editor
    zip
    zotero
  ];
}
