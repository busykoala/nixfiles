{
  description = "Nix system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

    in
    {
      nixosConfigurations.bespinian = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/bespinian/system
        ];
      };

      homeConfigurations.bespinian = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/bespinian/home ];
      };

      nixosConfigurations.schnurrli = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/schnurrli/system
        ];
      };

      homeConfigurations.schnurrli = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/schnurrli/home ];
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
