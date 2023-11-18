{
  enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "aws" "git" "terraform" "vi-mode" "thefuck" "sudo" ];
    theme = "agnoster";
  };
  initExtra = ''
        export JAVA_HOME="$(readlink -e $(type -p java))%*/bin/java"
  '';
}
