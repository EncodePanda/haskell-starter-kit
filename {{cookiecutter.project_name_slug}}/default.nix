{ pkgs ? import ./haskell-pkgs.nix
, haskellCompiler ? "ghc8102"
}:
pkgs.haskell-nix.cabalProject {
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "{{cookiecutter.project_name_slug}}";
    src = ./.;
  };
  compiler-nix-name = haskellCompiler;
}
