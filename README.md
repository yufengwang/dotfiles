## ~/.dotfiles

### requirements

* need `bash`, `curl`, and `git`
* install `ctags` from package manager

### `dotfilez`

a simple script to manage/update dotfiles and plugins

### install

```sh
$ curl -sL https://raw.github.com/yufengwng/dotfiles/main/install.sh | bash
```

or the more manual way:

```sh
$ git clone git@github.com:yufengwng/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install.sh
```

lastly, fire up `tmux` and hit `prefix + I` to [install tmux plugins][tpm].

### uninstall

```sh
$ dotfilez uninstall
```

then delete the dotfiles directory to completely remove:

```sh
$ rm -rf ~/.dotfiles
```

### update

``` bash
$ dotfilez update
```

then manually fire up `tmux` and hit `prefix + U`.

* (neo)vim plugins are managed by [vim-plug][plug]
* Tmux Plugin Manager (TPM) is managed as a git submodule
* TPM plugins are installed into `~/.dotfiles/dot/tmux/plugins`

[tpm]: https://github.com/tmux-plugins/tpm
[plug]: https://github.com/junegunn/vim-plug
