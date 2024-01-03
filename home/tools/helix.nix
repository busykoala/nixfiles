{ pkgs, ... }:

{
  enable = true;
  defaultEditor = true;
  settings = {
    theme = "papercolor-dark";
    editor = {
      soft-wrap.enable = true;
      cursor-shape.insert = "bar";
      file-picker.hidden = false;
    };
  };
  languages = {
    language-server = {
      gopls = { config."formatting.gofumpt" = true; };
    };
    language = [
      { name = "bash"; auto-format = true; formatter = { command = "${pkgs.shfmt}/bin/shfmt"; }; }
      { name = "css"; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "css" ]; }; }
      { name = "html"; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "html" ]; }; }
      { name = "javascript"; auto-format = true; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "typescript" ]; }; }
      { name = "json"; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "json" ]; }; }
      { name = "markdown"; auto-format = true; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "markdown" ]; }; }
      { name = "nix"; auto-format = true; formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; }; }
      { name = "python"; auto-format = true; formatter = { command = "${pkgs.black}/bin/black"; args = [ "--quiet" "-" ]; }; }
      { name = "typescript"; auto-format = true; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "typescript" ]; }; }
      { name = "yaml"; auto-format = true; formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "yaml" ]; }; }
    ];
  };
}
