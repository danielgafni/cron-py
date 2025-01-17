{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs, ...}: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    devShells.x86_64-linux = let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
      lib = pkgs.lib;
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          stdenv.cc
          uv
          glib
          rustc
          cargo
          rustfmt
          clippy
          rust-analyzer
        ];
        LD_LIBRARY_PATH = lib.makeLibraryPath [pkgs.stdenv.cc.cc.lib pkgs.glib];
        shellHook = ''
          uv venv
          uv sync --frozen
        '';
      };
    };
  };
}
