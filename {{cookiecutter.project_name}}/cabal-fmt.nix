{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = pkgs.haskell-nix.cabalProject {
    compiler-nix-name = "ghc8102";
    modules = [];
    src = pkgs.fetchFromGitHub {
      owner = "phadej";
      repo = "cabal-fmt";
      # 0.1.5 release
      rev = "dc1e63bb10ddafd6152fae8f7206c3b201b0f7ab";
      sha256 = "14mbi96m4ci2pjxr8y998mjghbwpwz2c45wp1kn4j5b7pl7bqv21";
    };
  };
in hsPkgs.cabal-fmt.components.exes.cabal-fmt
