{ pkgs ? import ./haskell-pkgs.nix
, haskellCompiler ? "ghc8101"
}:
pkgs.haskell-nix.cabalProject {
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "haskell-template-project";
    src = ./.;
  };
  compiler-nix-name = haskellCompiler;
}
