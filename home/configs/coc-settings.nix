{ xdg, ... }:

{
  xdg.configFile."nvim/coc-settings.json".text = ''
    {
      "languageserver": {
        "terraform": {
          "command": "terraform-lsp",
          "filetypes": ["terraform"]
        }
      }
    }
  '';
}
