{
  enable = true;
  signing = {
     key = "58BFCAEC8B1CCA79209F9776C363B63341FC23BB";
     signByDefault = true;
  };
  userEmail = "matthias@bespinian.io";
  userName = "Matthias Osswald";
  ignores = [
    ".idea" ".vscode" ".DS_Store" ".envrc" "shell.nix" "*.swp" "*.swo"
    "nohup.out" "tags" "tags.lock" "tags.temp" ".direnv"
  ];
  extraConfig = {
    core = {
      pager = "delta --line-numbers --dark --side-by-side";
      editor = "nvim";
      whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
    };
    format = {
      pretty = "%C(blue)%h%Creset %s %C(green)%d%Creset [%C(red)%an%Creset, %C(cyan)%cr%Creset] %C(bold reverse)%N%Creset";
    };
    branch = {
      autosetuprebase = "always";
    };
  };
}
