# .dotfiles

Various configuration files

## Installation

### Prerequisites

- Install [Git](https://git-scm.com/) and [GNU Stow](https://www.gnu.org/software/stow/):
  - Arch:
    ```bash
    sudo pacman -S git stow
    ```

  - Debian:
    ```bash
    sudo apt install git stow
    ```

  - Foodora:
    ```bash
    sudo dnf install git stow
    ```

### Download

+ Navigate to your home directory:
  ```bash
  cd
  ```

+ Download this repo to your home directory:
  - SSH (recommended):
    ```bash
    git clone git@github.com:memagu/.dotfiles.git
    ```
  - HTTPS:
    ```bash
    git clone https://github.com/memagu/.dotfiles.git
    ```

### Symlink Configuration Files

+ Navigate into the repo: 
  ```bash
  cd ~/.dotfiles
  ```

+ Adopt existing files for either the `core`, `desktop` or `applications` package or some combination of them:
  - core: 
    ```bash
    stow --adopt -d config -t ~ core
    ```
  - desktop: 
    ```bash
    stow --adopt -d config -t ~ desktop
    ```
  - applications: 
    ```bash
    stow --adopt -d config -t ~ applications
    ```

+ Reset all files to match HEAD:
  ```bash
  git fetch && git reset --hard origin/main
  ```

+ Make it your own:
  **This is _IMPORTANT_!!** 
  - Change name and email address in `core/.config/git/config`.
  - Change user in `core/.ssh/config` or remove the file altogether.

