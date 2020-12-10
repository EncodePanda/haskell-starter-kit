# haskell-template-project

This project is a dynamic template for a modern Haskell development environment. With a single command it bootstraps a *haskell.nix* project, shell with rich ecosystem (hlint, ghcid), out of the box support for profiling, Emacs integration and many more.

## Key features

- [x] GHC (8.10.1)
- [x] linter (hlint [3.2.1], apply-refact)
- [x] ghcid
- [x] stylish-haskell (0.12.2.0)
- [x] cabal-fmt
- [ ] direnv
- [ ] profiler support (eventlog2html, hs2pretty, heap and memory plotter)
- [ ] testing framework (hedgehog, hspec-hedgehog, hedgehog-golden ...)
- [ ] Emacs integration example
- [ ] (maybe) haskell language server

## How to create new project using this template

*pre-requirement*: you have [Nix installed](https://nixos.org/download.html) on your system

```
nix-shell -p cookiecutter git --run 'cookiecutter gh:EncodePanda/haskell-template-project'
```

### Set defaults

Reentering the defaults (like github user name) might be tedious and boring. That's why it is a good practice to setup the defaults.
Modify `~/.cookiecutterrc` by providing default value for github user and author name.
In my case this is:

```
default_context:
  "gh_user": "EncodePanda"
  "author_name": "Paweł Szulc"
```

### Example

#### Create the project using template

```
➜  projects nix-shell -p cookiecutter git --run 'cookiecutter gh:EncodePanda/haskell-template-project'
project_name [Enter project name]: Foo
project_synopsis [Enter project synopsis (short description)]: Foo is for Bar
module [Foo]:
category [Unclassified]:
author_name [Paweł Szulc]:
gh_user [EncodePanda]:
```
#### Enter nix-shell

*note*: Before entering the nix-shell consider reading README.md, there is a section about using Nix cache - so that you don't have to recompile the whole world

```
➜  projects cd Foo
➜  Foo nix-shell
trace: gitSource.nix: /Users/rabbit/projects/Foo does not seem to be a git repository,
assuming it is a clean checkout.
trace: Using latest index state for Foo!
trace: Using index-state: 2020-09-14T00:00:00Z for Foo
(...)
trace: Using latest index state for cabal-install!
trace: Using index-state: 2020-09-14T00:00:00Z for cabal-install
```

#### Build the project

```
[nix-shell:~/projects/Foo]$ cabal build
Warning: The package list for 'hackage.haskell.org' does not exist. Run 'cabal
update' to download it.RemoteRepo {remoteRepoName = "hackage.haskell.org",
(...)
Configuring library for Foo-0.1.0.0..
Preprocessing library for Foo-0.1.0.0..
Building library for Foo-0.1.0.0..
[1 of 1] Compiling Lib              ( src/Lib.hs, /Users/rabbit/projects/Foo/dist-newstyle/build/x86_64-osx/ghc-8.10.1/Foo-0.1.0.0/build/Lib.o, /Users/rabbit/projects/Foo/dist-newstyle/build/x86_64-osx/ghc-8.10.1/Foo-0.1.0.0/build/Lib.dyn_o )
(...)
[1 of 1] Compiling Main             ( app/Main.hs, /Users/rabbit/projects/Foo/dist-newstyle/build/x86_64-osx/ghc-8.10.1/Foo-0.1.0.0/x/Foo/build/Foo/Foo-tmp/Main.o )
Linking /Users/rabbit/projects/Foo/dist-newstyle/build/x86_64-osx/ghc-8.10.1/Foo-0.1.0.0/x/Foo/build/Foo/Foo ...
```

#### Use hlint

```
[nix-shell:~/projects/Foo]$ hlint .
No hints
```

#### Use ghcid

```
[nix-shell:~/projects/Foo]$ ghcid
Loading cabal repl ...
Build profile: -w ghc-8.10.1 -O1
In order, the following will be built (use -v for more details):
 - Foo-0.1.0.0 (lib) (ephemeral targets)
Preprocessing library for Foo-0.1.0.0..
GHCi, version 8.10.1: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Lib              ( src/Lib.hs, interpreted )
Ok, one module loaded.

All good (1 module, at 23:56:46)




```
