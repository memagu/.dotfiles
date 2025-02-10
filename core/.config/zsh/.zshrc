# Enable Powerlevel10k instant prompt. Password checks and such must go before.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$ZDOTDIR/.oh-my-zsh"

# Ensure Oh My Zsh is installed.
if [[ ! -d "$ZSH" ]]; then
    OMZ_INSTALLER_PATH="$ZDOTDIR/install-omz.sh"
    curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" -o "$OMZ_INSTALLER_PATH"
    sh "$OMZ_INSTALLER_PATH" --keep-zshrc
    rm "$OMZ_INSTALLER_PATH"
fi

# Ensure themes and plugins are installed.
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
ZSH_THEMES="${ZSH_THEMES:-$ZSH_CUSTOM/themes}"
ZSH_PLUGINS="${ZSH_PLUGINS:-$ZSH_CUSTOM/plugins}"

if [[ ! -d "${ZSH_THEMES}/powerlevel10k" ]]; then
    git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "${ZSH_THEMES}/powerlevel10k"
fi
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ ! -d "${ZSH_PLUGINS}/zsh-autosuggestions" ]]; then
    git clone "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_PLUGINS}/zsh-autosuggestions"
fi
    
if [[ ! -d "${ZSH_PLUGINS}/zsh-syntax-highlighting" ]]; then
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_PLUGINS}/zsh-syntax-highlighting"
fi

# Auto update
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

HIST_STAMPS="yyyy-mm-dd"

HISTFILE="$XDG_STATE_HOME/zsh/history"
if [[ ! -f $HISTFILE ]]; then
    mkdir -p "$(dirname "$HISTFILE")"
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Start Oh My Zsh
source $ZSH/oh-my-zsh.sh

#### User configuration ####

# Language environment
export LANG=en_AU.UTF-8
export LC_ALL=en_AU.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

