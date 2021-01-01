{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = pkgs.haskell-nix.stackProject {
    compiler-nix-name = "ghc8102";
    modules = [];
    src = pkgs.fetchFromGitHub {
      owner = "ndmitchell";
      repo = "hlint";
      # 3.2.1 release
      rev = "57b664d77d27845629c093f6479b6104cf6455e2";
      sha256 = "0y0c7vk9p6wj7vx4cfn6h0mg62jy03d0s54ydhmwv5c7112bcpqf";
    };
  };
in hsPkgs.hlint.components.exes.hlint
