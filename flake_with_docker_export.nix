{
  description = "Nix flake example with docker export";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        myApp = pkgs.buildEnv {
          name = "djangoapp-example";
          paths = [ pkgs.bash pkgs.python39 ];
        };

        myAppImage = pkgs.dockerTools.buildImage {
          name = "djangoappimage-ex";
          tag = "stable";
          copyToRoot = [ djangoApp ];
          # start a server here
          config = { Cmd = [ "python" ]; };
        };

      in rec {

        packages.myApp = myApp;
        packages.myAppImage = myAppImage;

        devShells.default = pkgs.mkShell { packages = [ pkgs.nodejs ]; };
      });
}


#     # let
#     #   inherit (nixpkgs.lib) genAttrs;
#     #   supportedSystems = [
#     #     # "aarch64-darwin"
#     #     # "x86_64-darwin"
#     #     "x86_64-linux"
#     #   ];
#     #   # forAllSystems = f: genAttrs supportedSystems (system: f system);
