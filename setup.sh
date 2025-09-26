#!/usr/bin/env bash

set -e

# first install brew
/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# temporarily make brew available in shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# set TERM var and switch to new installed fish shell
cat <<EOF >> ~/.bashrc
export TERM=xterm-color
/home/linuxbrew/.linuxbrew/bin/fish
exit 0
EOF


# install my tools:
brew install zellij
brew install jujutsu
brew install neovim
brew install delta
brew install eza
brew install fish
brew install fzf
brew install fd
brew install yazi
brew install starship
brew install bat
brew install carapace
brew install chezmoi
brew install python3
brew install zoxide
brew install lazygit
brew install lazyjj

# setup chezmoi config
mkdir -p $HOME/.config/chezmoi
cat <<EOF >> $HOME/.config/chezmoi/chezmoi.toml
[data.user]
fullName = "Thomas Stichlmair"
email = "thomas.stichlmair@gmail.com"
EOF

chezmoi init tamel
chezmoi apply
