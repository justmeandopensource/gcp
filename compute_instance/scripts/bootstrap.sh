#!/bin/bash

apt update
apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s /usr/bin/zsh venkatn
sudo -u venkatn bash -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~venkatn/.powerlevel10k"

cat >> ~venkatn/.zshrc <<EOF
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
EOF