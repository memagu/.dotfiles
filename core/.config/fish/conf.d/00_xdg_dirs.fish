set -Ux XDG_DATA_HOME  $HOME/.local/share
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_STATE_HOME  $HOME/.local/state
set -Ux XDG_CACHE_HOME  $HOME/.cache

for dir in $XDG_DATA_HOME $XDG_CONFIG_HOME $XDG_STATE_HOME $XDG_CACHE_HOME
    if not test -d $dir
        mkdir -p $dir
    end
end

