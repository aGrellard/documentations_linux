#!/bin/bash
set -e

echo "Installation des utilitaires"
sudo apt update
sudo apt install -y curl wget git unzip

echo "Installation de zsh"
sudo apt install -y zsh

echo "Mise à jour du shell par défaut (ceci nécessitera un mot de passe et une nouvelle connexion pour prendre effet)"
sudo chsh -s "$(which zsh)" $USER

echo "Sauvegarde du fichier de configuration zsh existant"
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.bak

echo "Installation de oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installation du plugin zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installation du plugin zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Mise à jour du fichier de configuration zsh"
wget -O /tmp/.zshrc https://github.com/aGrellard/documentations_linux/blob/main/_A0_BACKUP_LINUX/debian12/shell/.zshrc
cp /tmp/.zshrc ~/.zshrc

echo "Tout est installé ! Veuillez vous déconnecter et vous reconnecter pour utiliser zsh."
