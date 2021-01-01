# shell.nix
{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = import ./. { inherit pkgs; };
  hlint = import ./hlint.nix { inherit pkgs; };
  apply-refact = import ./apply-refact.nix { inherit pkgs; };
  stylish-haskell = import ./stylish-haskell.nix { inherit pkgs; };
  cabal-fmt = import ./cabal-fmt.nix { inherit pkgs; };
in
hsPkgs.shellFor {
  tools = { cabal = "3.2.0.0"; };

  shellHook = ''
    format-all () {
    git rev-parse --show-toplevel | xargs -i stylish-haskell -ric "{}/.stylish-haskell.yaml" $@
    cabal-fmt --inplace {{cookiecutter.project_name}}.cabal
    }

    hlint-all () {
    hlint .
    }

    hlint-all-fix () {
    find . -path ./dist-newstyle -prune -o -name \*.hs -exec hlint --refactor --refactor-options="--inplace" {} \;
    }

  '';

  buildInputs =
    [ pkgs.haskellPackages.ghcid
    pkgs.haskellPackages.hp2pretty
    pkgs.haskellPackages.pointfree
    cabal-fmt
    hlint
    apply-refact
    stylish-haskell
    ];
}
