#!/bin/bash
set -e

# installations de utilitaires
echo "Installation des utilitaires"
sudo apt install -y curl wget git unzip

# installation de zsh
echo "Installation de zsh"
sudo apt install -y zsh

# mettre à jour le shell par défaut
echo "Mise à jour du shell par défaut"
chsh -s $(which zsh)


# sauvegarde du fichier de configuration zsh
echo "Sauvegarde du fichier de configuration zsh"
cp ~/.zshrc ~/.zshrc.bak

# recharger le fichier de configuration zsh
source ~/.zshrc

# installation de oh-my-zsh
echo "Installation de oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installation du plugin zsh-autosuggestions
echo "Installation du plugin zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# installation du plugin zsh-syntax-highlighting
echo "Installation du plugin zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# mise à jour du fichier de configuration zsh
echo "Mise à jour du fichier de configuration zsh"
wget https://github.com/aGrellard/documentations_linux/blob/main/_B0_CONFIG/debian12/.zshrc /tmp/.zshrc
cp /tmp/.zshrc ~/.zshrc

# recharger le fichier de configuration zsh
source ~/.zshrc