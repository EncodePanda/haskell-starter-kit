{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = pkgs.haskell-nix.cabalProject {
    compiler-nix-name = "ghc8102";
    modules = [];
    src = pkgs.fetchFromGitHub {
      owner = "ocharles";
      repo = "weeder";
      # 2.1.3 release
      rev = "f31432b2adc8953cd5763f03a14ac3047a333b3f";
      sha256 = "19w8j7y3g6x0400q22zrx19vnq11gj4mby2ahf54jkw275zkllw0";
    };
  };
in hsPkgs.weeder.components.exes.weeder
