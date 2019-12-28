# ~/.dotfiles

## Requirements

You will need `curl`, `git`, and `bash` on your system to get up and running.
And of course you should have installed the things these dotfiles relate to.

## dotfilez

This is a simple script that you can use to update your dotfiles and plugins
anywhere.

## Install

Just run this:

```bash
$ curl -sL https://raw.github.com/yufengwng/dotfiles/master/install.sh | sh
```

Or if you prefer the more manual way:

``` bash
$ git clone git@github.com:yufengwng/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install.sh
```

A bit of manual work before you're ready to go:

1. Fire up `tmux` and hit `prefix + I` to [install tmux plugins][tpm]
2. Install `ctags` for `Tagbar` vim plugin via your distro's package manager

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

Vim plugins are managed by [vim-plug][]. It is installed on-the-fly by the
install process, and automatically updated as part of `dotfilez`'s update
process. The Tmux Plugin Manager (TPM) is being managed as a git submodule, and
plugins are installed into `~/.dotfiles/config/tmux/plugins`.

To update, simply invoke the `dotfilez` manager:

``` bash
$ dotfilez update
```

As for tmux plugins, you will need to manually fire up `tmux` and
hit `prefix + U`.

[tpm]: https://github.com/tmux-plugins/tpm
[vim-plug]: https://github.com/junegunn/vim-plug
