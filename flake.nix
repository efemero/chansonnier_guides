{
  description = "Tools for chansonnier";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nativeBuildInputs = [
        pkgs.just
        pkgs.typst
      ];
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "chansonnier";
        inherit system nativeBuildInputs;
        src = ./.;
      };

      devShells.default = pkgs.mkShell {
        inherit system nativeBuildInputs;
      };
    };
}
