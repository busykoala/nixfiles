{ config, pkgs, ... }:

{
  home.shellAliases = {
    gd = "git diff --color";
    gdf = "git diff --color --cached";
    gp = "git pull";
    gco = "git checkout";
    gs = "git status";
    gcm = "git commit -m";

    grep = "grep --color";
    tf = "terraform";
    k = "kubectl";

    ".." = "cd ..";
    "..." = "cd ../..";
  };
}
