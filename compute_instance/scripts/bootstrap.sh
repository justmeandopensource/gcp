#!/bin/bash

apt update
apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting tmux
chsh -s /usr/bin/zsh venkatn
sudo -u venkatn bash -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~venkatn/.powerlevel10k"
sudo -u venkatn bash -c "wget https://raw.githubusercontent.com/justmeandopensource/gcp/master/compute_instance/scripts/.p10k.zsh -O ~venkatn/.p10k.zsh"
sudo -u venkatn bash -c "wget https://raw.githubusercontent.com/justmeandopensource/gcp/master/compute_instance/scripts/.tmux.conf -O ~venkatn/.tmux.conf"

cat >> ~venkatn/.zshrc <<EOF
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
EOF

curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

