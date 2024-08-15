export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_STATE_HOME=${XDG_STATE_HOME:=$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/.cache}

mkdir -p $(dirname "${XDG_DATA_HOME}")
mkdir -p $(dirname "${XDG_CONFIG_HOME}")
mkdir -p $(dirname "${XDG_STATE_HOME}")
mkdir -p $(dirname "${XDG_CACHE_HOME}")

export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}



