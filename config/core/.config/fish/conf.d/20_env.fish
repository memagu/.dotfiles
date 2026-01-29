# Locale settings
set -x LANG en_AU.UTF-8
set -x LC_ALL en_AU.UTF-8

# Editor preference
if set -q SSH_CONNECTION
    set -x EDITOR vim
else
    set -x EDITOR nvim
end

# simple input method for GTK (basic compose/dead‑keys)
set -x GTK_IM_MODULE simple

# Rust environment
if test -f $HOME/.cargo/env.fish
    source "$HOME/.cargo/env.fish"
end

# Deno environment
if test -f $HOME/.deno/env
    sh $HOME/.deno/env
end

# Java environment
set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk

