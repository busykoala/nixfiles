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
      "diagnostic.errorSign": "✗",
      "diagnostic.warningSign": "⚠",
      "diagnostic.infoSign": "ℹ",
      "diagnostic.hintSign": "➤"
    }
  '';
}
