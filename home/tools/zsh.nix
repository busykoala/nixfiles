{
  enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [
      "aws"
      "colored-man-pages"
      "git"
      "terraform"
      "vi-mode"
      "thefuck"
      "sudo"
      "z"
    ];
    theme = "agnoster";
  };
  initExtra = ''
        export JAVA_HOME="$(readlink -e $(type -p java))%*/bin/java"
  '';
}
