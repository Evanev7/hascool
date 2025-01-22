{
  description = "hascool";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs.haskellPackages; [
        (ghcWithPackages (ps: with ps; [hostname]))
      ];
    };
  };
}
