{
  description = "nix-darwin flake for reproducible builds";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, home-manager, ... }:
    let
      darwinSystem = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ariz = import ./home;
          }
        ];
      };
    in
    {
      darwinConfigurations."Hasnaats-MacBook-Air" = darwinSystem;
      darwinConfigurations."ariz" = darwinSystem;
      darwinPackages = self.darwinConfigurations."Hasnaats-MacBook-Air".pkgs;
    };
}
