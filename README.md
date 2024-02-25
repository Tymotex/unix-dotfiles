# Tim's Dotfiles
Dotfiles for Arch Linux.

Managed with GNU Stow.

## Usage
Dotfiles are managed in 2 separate directory trees: 1 for $HOME and 1 for root.
```sh
git clone https://github.com/Tymotex/unix-dotfiles
cd unix-dotfiles

# Running this will 'push' all config in this tree to the $HOME directory.
stow --target=$HOME --dir . home-config
stow --target=$HOME --adopt --dir . home-config   # Forcefully overwrite all local configs with the ones from this repo.

# Or more simply:
cd home-config && stow .

# Running this will 'push' all config in this tree to the root directory.
# WARNING: If you run this with --adopt, then it will overwrite existing files.
sudo stow --target=/ --dir . root-config

```

## Maintenance
Occasionally, run `pacman -Qqe > pkglist.txt` to update `pkglist.txt`, as instructed by https://wiki.archlinux.org/title/system_maintenance.

This list of packages can be restored by following the instructions at https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages.

