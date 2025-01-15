{
  description = "OCaml binary heap implementation by Jean-Christophe Filliatre";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        bheap = pkgs.ocamlPackages.callPackage ./. { };
      in
      {
        packages = {
          default = bheap;
          inherit bheap;
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = [ bheap ];
          buildInputs = [
            pkgs.ocamlPackages.ocaml-lsp
            pkgs.ocamlPackages.utop
            pkgs.ocamlPackages.ocamlformat
            pkgs.ocamlPackages.ocaml-print-intf
          ];
        };
      }
    );
}
