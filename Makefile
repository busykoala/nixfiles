.PHONY: update
update:
	nix flake update

.PHONY: system
system:
	sudo nixos-rebuild switch --flake .#bespinian

.PHONY: home
home:
	home-manager switch --flake .#bespinian
