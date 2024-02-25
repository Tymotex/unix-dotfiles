<<<<<<< HEAD

# Assumes that Zsh is already installed.

# Set up oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up powerlevel10k.

=======
#!/bin/sh
# Assumes that all packages in pkglist.txt have been installed.

HOME=/home/tym

# ---------------------------------------------------------------------------- #
#                                Setting up ZSH                                #
# ---------------------------------------------------------------------------- #
# Change default shell to Zsh.
chsh -s /usr/bin/zsh

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# Zsh extensions.
git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
>>>>>>> d81186c (Set up basic stable i3 setup, before detailed ricing.)
