.PHONY: update
update:
	nix flake update

.PHONY: system
system:
	sudo mv ./system/hardware-configuration.nix ./system/hardware-configuration.nix.bak
	sudo cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix
	sudo nixos-rebuild switch --flake .
	sudo mv ./system/hardware-configuration.nix.bak ./system/hardware-configuration.nix

.PHONY: home
home:
	home-manager switch --flake .
