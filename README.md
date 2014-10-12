# My simple dotfiles

## What's Inside

```
.dotfiles
├── install
├── README.md
├── src
│   ├── gitconfig
│   ├── tmux.conf
│   ├── vim
│   │   └── bundle
│   │       └── Vundle.vim
│   ├── vimrc
│   └── zshrc
├── uninstall
└── update
```

## Requirements

- exuberant ctags (for Tagbar vim plugin)

## Installation

Clone dotfiles and run linking script:

``` bash
$ git clone https://github.com/yufengwang/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install
```

## Uninstallation

Just run the unlinking script:

``` bash
$ ~/.dotfiles/uninstall
```

Remove the dotfiles directory if you're ready to lose configurations:

``` bash
$ rm -rf ~/.dotfiles
```

## Updating Vim Plugins

Vim plugins are managed by `Vundle`. The Vundle bundle is being managed
as a git submodule. Vim plugins will be installed by Vundle into
`~/.dotfiles/src/vim/bundle`, but ignored by git. This lets Vundle handle
and update the vim plugins without having to worry about version control
and submoduling the plugins.

To update, simply run the update script:

``` bash
$ ~/.dotfiles/update
```

