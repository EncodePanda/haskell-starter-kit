# haskell-template-project

This project is a dynamic template for a modern Haskell development environment. With a single command it bootstraps a *haskell.nix* project, shell with rich ecosystem (hlint, ghcid), out of the box support for profiling, Emacs integration and many more.

## Key features

- [x] GHC (8.10.2)
- [x] linter: hlint (3.2.1), apply-refact
- [x] ghcid
- [x] stylish-haskell (0.12.2.0)
- [x] cabal-fmt
- [x] direnv
- [ ] profiler support (eventlog2html, hs2pretty, heap and memory plotter)
- [x] testing framework (hspec, hedgehog, hspec-hedgehog)
- [ ] Emacs integration example

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

## Example

### 1. Create the project using template

```
➜  ~ nix-shell -p cookiecutter git --run 'cookiecutter gh:EncodePanda/haskell-template-project'
You've downloaded /Users/rabbit/.cookiecutters/haskell-template-project before. Is it okay to delete and re-download it? [yes]:
project_name [Enter project name]: foo
project_synopsis [Enter project synopsis]: Example project
module [Foo]:
category [Unclassified]: Example
author_name [Paweł Szulc]:
gh_user [EncodePanda]:
formatter_indent [2]:
formatter_columns [110]: 80
```

### 2. Enter nix-shell

*note*: Before entering the nix-shell consider reading README.md, there is a section about using Nix cache - so that you don't have to recompile the whole world

```
➜  ~ cd foo
➜  foo nix-shell
trace: gitSource.nix: /Users/rabbit/foo does not seem to be a git repository,
assuming it is a clean checkout.
trace: Using latest index state for foo!
(...)
trace: Using latest index state for cabal-install!
trace: Using index-state: 2020-09-14T00:00:00Z for cabal-install
```

### 3. Build the project

```
[nix-shell:~/foo]$ cabal build
Resolving dependencies...
Build profile: -w ghc-8.10.2 -O1
(...)
Building library for foo-0.1.0.0..
[1 of 1] Compiling Lib              ( src/Lib.hs, /Users/rabbit/foo/dist-newstyle/build/x86_64-osx/ghc-8.10.2/foo-0.1.0.0/build/Lib.o, /Users/rabbit/foo/dist-newstyle/build/x86_64-osx/ghc-8.10.2/foo-0.1.0.0/build/Lib.dyn_o )
(...)
[1 of 1] Compiling Main             ( app/Main.hs, /Users/rabbit/foo/dist-newstyle/build/x86_64-osx/ghc-8.10.2/foo-0.1.0.0/x/foo-exe/build/foo-exe/foo-exe-tmp/Main.o )
Linking /Users/rabbit/foo/dist-newstyle/build/x86_64-osx/ghc-8.10.2/foo-0.1.0.0/x/foo-exe/build/foo-exe/foo-exe ...
```

### 4. Run tests

```
[nix-shell:~/foo]$ cabal test --test-show-details=streaming
Build profile: -w ghc-8.10.2 -O1
(...)
Running 1 test suites...
Test suite foo-test: RUNNING...

Foo.Example
  unit tests
    should work
  hedgehog property tests
    should work

Finished in 0.0022 seconds
2 examples, 0 failures
Test suite foo-test: PASS
Test suite logged to:
1 of 1 test suites (1 of 1 test cases) passed.

```

### 5. Use linter

look for issues, non found

```
[nix-shell:~/foo]$ hlint-all
No hints
```

introduce code that is not perfect

```
[nix-shell:~/foo]$ echo "foo :: String -> Int" >> src/Lib.hs; echo "foo = \_ -> 10" >> src/Lib.hs

[nix-shell:~/foo]$ cat src/Lib.hs
module Lib where
foo :: String -> Int
foo = \_ -> 10
```

look for issues one more time, found it!

```
[nix-shell:~/foo]$ hlint-all
src/Lib.hs:3:1-14: Warning: Redundant lambda
Found:
  foo = \ _ -> 10
Perhaps:
  foo _ = 10

src/Lib.hs:3:7-14: Suggestion: Use const
Found:
  \ _ -> 10
Perhaps:
  const 10

2 hints
```

ask linter to automatically fix them

```
[nix-shell:~/foo]$ hlint-all-fix

[nix-shell:~/foo]$ cat src/Lib.hs
module Lib where
foo :: String -> Int
foo _ = 10

[nix-shell:~/foo]$ hlint-all
No hints
```

### 6. Use ghcid

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
