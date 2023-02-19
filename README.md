# Make James Dotfiles

This repo contains the dotfiles for Make James. This repository is managed
using vcsh, a source control manager for files in the $HOME directory of a user.

## Getting started

Before getting started, this will splat over the top of pre-existing files. Make
sure that you have made note of or copied anything that you would prefer not
to loose. Check the repository that you are cloning into for:

* `.bash_aliases`
* `.gitconfig`
* `.vimrc`
* `README.md`

### Ctags

`ctags --version`. If `ctags` isn't found install `universal-ctags` which is
the maintained version of `ctags`.

For detailed installation instructions read [the installation guide](https://github.com/ycm-core/YouCompleteMe#installation)

### Installing the repository

```sh
# from HOME directory
apt install vcsh
vcsh clone -b main git@gitlab.com:makejames/dotfiles.git
```

## Vim


