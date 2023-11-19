{
  # checkout: https://github.com/gvolpe/dconf2nix
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = [
        "caps:ctrl_modifier"
        "terminate:ctrl_alt_bksp"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "CopyQ";
      command = "copyq -e \"toggle()\"";
      binding = "<Shift><Super>v";
    };
  };
}
