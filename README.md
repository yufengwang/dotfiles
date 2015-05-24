# ~/.dotfiles

## Requirements

You will need `curl`, `git`, and `bash` on your system to get up and running.
And of course you should have installed the things these dotfiles relate to.

## dotfilez

This is a simple script that gets symlinked into `/usr/bin` so you can update
your dotfiles and plugins anywhere.

## Install

Just run this:

```bash
$ curl -sL https://raw.github.com/yufengwng/dotfiles/master/install.sh | bash
```

Or if you prefer the more manual way:

``` bash
$ git clone https://github.com/yufengwng/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install.sh
```

A bit of manual work before you're ready to go:

1. fire up `tmux` and hit `prefix + I` to [install tmux plugins][tpm]
2. install `ctags` for `Tagbar` vim plugin via your distro's package manager

## Uninstall

Just run the `dotfilez` manager:

``` bash
$ dotfilez uninstall
```

Remove the dotfiles directory if you're ready to lose configurations:

``` bash
$ rm -rf ~/.dotfiles
```

## Update

Vim plugins are managed by `Vundle`. The Vundle bundle is being managed
as a git submodule. Vim plugins will be installed by Vundle into
`~/.dotfiles/src/vim/bundle`, but ignored by git.

The same case is for tmux plugins. The TPM is being managed as a git
submodule, and plugins are installed into `~/.dotfiles/src/tmux/plugins`.

To update, simply invoke the `dotfilez` manager:

``` bash
$ dotfilez update
```

As for tmux plugins, you will need to manually fire up `tmux` and
hit `prefix + U`.

[tpm]:https://github.com/tmux-plugins/tpm
