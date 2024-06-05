{ pkgs, ... }:

{
  enable = true;

  settings = {
    theme = "tokyonight";
    editor = {
      soft-wrap.enable = true;
      cursor-shape.insert = "bar";
      # file-picker.hidden = false;
    };
    keys = import ./helix-vimbindings.nix;
  };

  languages = {
    language-server = {
      gpt = {
        command = "helix-gpt";
      };
    };

    language = [
      {
        name = "python";
        auto-format = true;
        formatter = {
          command = "${pkgs.black}/bin/black";
          args = [ "--quiet" "-" ];
        };
        language-servers = ["gpt"];
      }
    ];
  };

}
