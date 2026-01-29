# System
fish_add_path --append /usr/local/sbin
fish_add_path --append /usr/local/bin
fish_add_path --append /usr/sbin
fish_add_path --append /usr/bin
fish_add_path --append /sbin
fish_add_path --append /bin

# User
fish_add_path --prepend $HOME/bin
fish_add_path --prepend $HOME/.local/bin

# Tools
fish_add_path --prepend $HOME/.cargo/bin
fish_add_path --prepend $HOME/.local/share/coursier/bin

