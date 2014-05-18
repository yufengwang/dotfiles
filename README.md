# My simple dotfiles

## Requirements

- curl (to update pathogen manager for vim plugins)
- exuberant ctags (for Tagbar vim plugin)

## Installation

Clone dotfiles and run linking script:

```bash
$ git clone https://github.com/yufeng05/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/link.sh
```

## Uninstallation

Just run the unlinking script:

```bash
$ ~/.dotfiles/unlink.sh
```

Remove the dotfiles directory if you're ready to lose configurations:

```bash
$ rm -rf ~/.dotfiles
```

## Updating Vim Plugins

Vim plugins are managed by `pathogen`. Vim plugins are managed as git submodules.
To update, simply run the update script:

```bash
$ ~/.dotfiles/update.sh
```

