# ============================================================================ #
#                                Oh My ZSH                                     #
# ============================================================================ #
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Oh my ZSH updating behaviour.
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
#   Standard plugins can be found in $ZSH/plugins/
#   Custom plugins may be added to $ZSH/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ============================================================================ #
#                                Powerlevel10k                                 #
# ============================================================================ #
# This makes p10k CLI available.
source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================ #
#                                Shell Settings                                #
# ============================================================================ #
# -------------------------- Enable Vim keybindings -------------------------- #
set -o vi
export EDITOR='vim'

# Remap caps and escape.
setxkbmap -option caps:swapescape

# Fixes Vim mode blinking cursor.
# Source: https://www.reddit.com/r/vim/comments/mxhcl4/setting_cursor_indicator_for_zshvi_mode_in/.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';; # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    # Initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# ============================================================================ #
#                           Oh my ZSH and other Extensions                     #
# ============================================================================ #
PLUGINS_DIR=$HOME/.oh-my-zsh/custom/plugins

# Syntax highlighting.
source "${PLUGINS_DIR}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# Autosuggestions.
source "${PLUGINS_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Enable reverse search (builtin).
bindkey -v
bindkey '^R' history-incremental-search-backward

# The fuck extension. Corrects mistyped commands after issuing `fuck`.
# https://github.com/nvbn/thefuck.
eval $(thefuck --alias)

# Zoxide: https://github.com/ajeetdsouza/zoxide.
eval "$(zoxide init zsh)"

# ============================================================================ #
#                                    Aliases                                   #
# ============================================================================ #
# xclip commands.
alias screenshot='import png:- | xclip -selection clipboard -t image/png'
alias saveimg='xclip -selection clipboard -t image/png -o > '
alias copy='xclip -selection clipboard'

# i3
alias i3r='i3-msg restart'

# Stow sync the home directory's configs.
alias syncdotfiles='stow --target=$HOME --adopt --dir /home/tym/Dotfiles home-config '

# Configuration editing shorthands
alias i3conf='$EDITOR /home/tym/Dotfiles/home-config/.config/i3/config && syncdotfiles'
alias picomconf='$EDITOR /home/tym/Dotfiles/home-config/.config/picom/picom.conf && syncdotfiles'
alias zshconf='$EDITOR /home/tym/Dotfiles/home-config/.zshrc && syncdotfiles'
alias vimconf='$EDITOR /home/tym/Dotfiles/home-config/.vimrc && syncdotfiles'
alias terminalconf='$EDITOR /home/tym/Dotfiles/home-config/.config/alacritty/alacritty.toml && syncdotfiles'
alias polybarconf='$EDITOR /home/tym/Dotfiles/home-config/.config/polybar/config.ini && syncdotfiles'

# Always show hidden files.
alias ls='ls -a --color=auto'

# Open file manager.
alias open='nemo'

# Git commands.
alias c="git commit -m "
alias a="git commit --amend"
alias s="git status"
alias p="git pull"
alias u="git push"
alias b="git branch"

# System notification.
alias notify="notify-send"

# Tools.
alias less='less -N'
alias cd='z'
alias clip-save='xclip -selection clipboard -t image/png -o > '

# ============================================================================ #
#                             Environment Variables
# ============================================================================ #
# For IBus to work.
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# Lets Vim take over as the pager for viewing man pages.
# https://github.com/vim/vim/issues/2823
export MANPAGER='vim -M +MANPAGER -'

# ============================================================================ #
#                             Environment Variables
# ============================================================================ #
# Make `nvm` available for changing Node versions.
source /usr/share/nvm/init-nvm.sh

