{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }:
      let pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    home = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [
        {
          home.username = "hammurabi";
          home.stateVersion = "23.05";
          home.homeDirectory = "/home/hammurabi";
          home.packages = [
            pkgs.git
            pkgs.fastfetch
          ];
        }
      ];
    };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    #
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };

}

