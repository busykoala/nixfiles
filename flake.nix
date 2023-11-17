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
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./system
        ];
      };

      homeConfigurations.bespinian = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/bespinian ];
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
