# Locale settings
set -x LANG en_AU.UTF-8
set -x LC_ALL en_AU.UTF-8

# Editor preference
if set -q SSH_CONNECTION
    set -x EDITOR vim
else
    set -x EDITOR nvim
end

# Rust environment
if test -f $HOME/.cargo/env
    sh $HOME/.cargo/env
end

# Deno environment
if test -f $HOME/.deno/env
    sh $HOME/.deno/env
end

