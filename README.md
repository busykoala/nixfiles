# Nixfiles

This repo is highly inspired by [cloudlenas awesome nixfiles](https://github.com/cloudlena/nixfiles/).

## Init steps

```zsh
# create or copy your ssh key (assuming id_rsa)
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

nix-shell -p git gnumake
git clone git@github.com:busykoala/nixfiles.git
cd nixfiles

sudo make system-<name>
make home-<name>
```

## Additional setup

- [setup onedrive](https://nixos.wiki/wiki/OneDrive)
- In nvim run `:Copilot setup`

## References and Notes

[home-manager option search](https://mipmip.github.io/home-manager-option-search/)

```zsh
# run a pkg that is not yet installed from nix pkgs
nix run nixpkgs#htop

# temp. add a pkg that is not yet installed
nix shell nixpkgs#htop
```

## Some useful tools

- `duf`: disk usage/free utility providing more intuitive output.
- `dust`: more intuitive version of du to visualize disk usage.
- `tokei`: code statistics counter.
- `q-text-as-data`: run SQL queries on CSV files.
  e.g.: `q -H -d, "SELECT * FROM data/dos_traces.csv WHERE ip_source LIKE '%.248'"`
- `xsv`: fast CSV command line toolkit.
