# Dotfiles

Dotfiles for my personal riced Arch Linux setup.

Managed with GNU Stow.

---

## Personal Notes

### Usage

Dotfiles are managed in 2 separate directory trees: 1 for $HOME and 1 for root.
If I ever want to author some new configuration file, I do it in the files in
this repo itself, and then run the relevant `stow` command from below. If I
want to change an existing file, I can do so directly because `stow` symlinks
it to the files in this repo, so I can trust that whatever changes I make are
being version controlled. I just have to periodically commit and push changes
upstream whenever I remember (having Cron do this is probably more ideal).

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

### Personal Maintenance

Occasionally, run `pacman -Qqe > pkglist.txt` to update `pkglist.txt`, as instructed by https://wiki.archlinux.org/title/system_maintenance.

This list of packages can be restored by following the instructions at https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages.

### Special Dependencies

- `xborders` is being used to overwrite default i3 borders. I've moved the repo
  containing the `xborders` script to `Scripts/xborders` and set up an alias to
  it in ZSH.

