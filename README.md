# .dotfiles
Various configuration files

## Installation
> **_NOTE:_** This guide is meant for Debian but will work on other OS:es with minor modifications.
1. Install git and a dependency for submodules.
    ```bash
    sudo apt install -y git gettext
    ```
2. Clone this repository into your home directory.
    ```bash
    git clone --recurse-submodules git@github.com:memagu/.dotfiles.git
    ```
3. Navigate into the repo and run the following command: 
    ```bash
    cd ~/.dotfiles
    ```

4. Run the installation script as root
    ```bash
    sudo bash install.sh
    ```
    > **_NOTE:_** This will change /etc/apt/sources.list
5. Correct mail and name in ~/.config/git/config
