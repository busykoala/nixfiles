.PHONY: update
update:
	nix flake update

.PHONY: system-bespinian
system-bespinian:
	sudo nixos-rebuild switch --flake .#bespinian

.PHONY: home-bespinian
home-bespinian:
	home-manager switch --flake .#bespinian

.PHONY: system-schnurrli
system-schnurrli:
	sudo nixos-rebuild switch --flake .#schnurrli

.PHONY: home-schnurrli
home-schnurrli:
	home-manager switch --flake .#schnurrli
