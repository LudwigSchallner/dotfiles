# My dotfiles

These are my configuration files for

  * nvim
  * zsh

The basic idea is to link the files in this repository to the corresponding
configuration files (e.g. `~/.vimrc -> vimrc`).  To see which files get linked,
checkout `install.conf.yaml`.

## Getting started

### Requirements

The following commands are assumed to be available for a successful installation:

* `wget` to download `nvim`
* `pip3` to install dependencies needed for `nvim` and `vim`
* `fuse` to be able to run the `nvim` AppImage

If these commands are missing, then the install script will output an error,
but nevertheless the config files will be installed.

It is highly recommended to install `zsh` even though no error will be shown if
it is missing.

### Installation

Clone
```bash
git clone https://github.com/Otterpatsch/dotfiles ~/.dotfiles
```

To install, enter:
```bash
cd ~/.dotfiles
./install
or for no nvim use
./install-basic 
```

The zsh theme installed by default is
[powerlevel10k](https://github.com/romkatv/powerlevel10k) for which it is
recommended to install the [Meslo Nerd
Font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).
included in the fonts directory (which will be copyed into ~/.local/share/fonts/. 

### I just want part of it

If you are in a hurry, just have a look at look at `install.conf.yaml`, it is
almost self-explained.  If you have a bit more time, checkout
[dotbot](https://github.com/anishathalye/dotbot), which is the bootstrapping
library used here.  It is also shipped as a submodule so that the installation
of the these files can happen without having to install it manually.

## What's inside

### `zsh`

The `zsh` shell is defined as default shell by appending `exec zsh` at the
bottom of the `~/.bashrc` (see `install.conf.yaml`).

The zsh plugins are managed by [antigen](https://github.com/zsh-users/antigen),
which is provided as a git submodule.  _Note that the plugins get installed
only the first time you start a `zsh` shell._

The theme used is [powerlevel10k](https://github.com/romkatv/powerlevel10k)
already configured for my taste.  To reconfigure it, run `p10k configure` or
just remove the file `p10k.zsh`.  Note that for this theme to work well, the
Meslo Nerd Font is recommended, see above.

Checkout `zshrc` to see which plugins are activated, they are defined right
after `bundle` (any recommendation is welcome!).

## NVim

NVim plugins are manage by [Lazy](https://github.com/folke/lazy.nvim)
As soon as you open nvim those should be installed. You may wanna check the health via :checkhealth lazy.

### LSP-Plugins

LSP-Plugins are installed via Mason. To install the currently included in the settings one run `:MasonInstall mypy black isort pydocstyle ruff `
