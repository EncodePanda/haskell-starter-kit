{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = pkgs.haskell-nix.stackProject {
    compiler-nix-name = "ghc8102";
    modules = [];
    src = pkgs.fetchFromGitHub {
      owner  = "mpickering";
      repo = "apply-refact";
      rev = "311fe6cc3fb2ce472c0e9a1d1d9eeb7187ed2638";
      sha256 = "0wyamn4w3lsayhsqs6h60f0m337b1p5byw1frmcyima3pqsgprvl";
    };
  };
in hsPkgs.apply-refact.components.exes.refactor
