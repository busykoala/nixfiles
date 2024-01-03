{ pkgs, ... }:

{
    enable = true;
    defaultEditor = true;
    settings = {
        theme = "tokyonight";
        editor = {
            line-number = "relative";
            soft-wrap.enable = true;
            cursor-shape.insert = "bar";
            file-picker.hidden = false;
        };
    };
}
