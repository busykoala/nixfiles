{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "intl";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.busykoala = {
    isNormalUser = true;
    description = "busykoala";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.defaultUserShell = pkgs.zsh;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };

  programs = {
    zsh.enable = true;
  };

  # List services that you want to enable:
  services = {
    gnome.gnome-keyring.enable = true;
  };

  system.stateVersion = "23.05";

#  system.activationScripts.binbash = {
#    deps = [ "binsh" ];
#    text = ''
#         ln -s /bin/sh /bin/bash
#    '';
#  };

  virtualisation.podman.enable = true;

}
