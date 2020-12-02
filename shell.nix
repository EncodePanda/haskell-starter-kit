# shell.nix
{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = import ./. { inherit pkgs; };
  hlint = import ./hlint.nix { inherit pkgs; };
in
  hsPkgs.shellFor {
    tools = { cabal = "3.2.0.0"; };
    buildInputs =
      [ pkgs.haskellPackages.ghcid
        pkgs.haskellPackages.hp2pretty
        hlint
      ];
  }
