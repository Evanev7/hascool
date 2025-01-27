{
  description = "hascool";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    haskellPackages = pkgs.haskellPackages;
    noteTaker = haskellPackages.callCabal2nix "note-taker" ./. {};
  in {
    packages.${system} = {
      inherit noteTaker;
      default = noteTaker;
    };
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with haskellPackages; [
        ghc
        cabal-install
        haskell-language-server
      ];
    };
  };
}
