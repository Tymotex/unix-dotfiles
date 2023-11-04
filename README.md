# Tim's Dotfiles
Dotfiles for Arch Linux.

Managed with GNU Stow.

## Usage
```sh
git clone https://github.com/Tymotex/unix-dotfiles
cd unix-dotfiles

# Running this will 'push' all config in this tree to the $HOME directory.
stow --dir=home-config --target=$HOME

# Running this will 'push' all config in this tree to the root directory.
stow --dir=root-config --target=/

```

