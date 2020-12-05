# haskell-template-project

This project creates a template to modern Haskell development.

## Key features

1. GHC
2. hlint
3. ghcid
4. more soon...

## How to create new project using this template

*pre-requirement*: you have [Nix installed](https://nixos.org/download.html) on your system

```
nix-shell -p cookiecutter git --run 'cookiecutter gh:EncodePanda/haskell-template-project'
```

### Example

TBD

### Set defaults

Modify `~/.cookiecutterrc` by providing default value for github user and author name.
In my case this is:

```
default_context:
  "gh_user": "EncodePanda"
  "author_name": "Paweł Szulc"
```
