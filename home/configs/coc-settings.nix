{ xdg, ... }:

{
  xdg.configFile."nvim/coc-settings.json".text = ''
    {
      "languageserver": {
        "terraform": {
          "command": "terraform-lsp",
          "filetypes": ["terraform"]
        },
        "haskell": {
          "command": "haskell-language-server-wrapper",
          "args": ["--lsp"],
          "rootPatterns": [
            "*.cabal",
            "cabal.project",
            "hie.yaml"
          ],
          "filetypes": ["haskell", "lhaskell"]
        }
      }
    }
  '';
}
