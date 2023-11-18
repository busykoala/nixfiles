# Nixfiles

This repo is highly inspired by [cloudlenas awesome nixfiles](https://github.com/cloudlena/nixfiles/).

## Init steps

```bash
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
- change scroll direction for touchpad
- use tweaks to remap the keyboard
- add copyq shortcut `copyq -e "toggle()"` in gnome
