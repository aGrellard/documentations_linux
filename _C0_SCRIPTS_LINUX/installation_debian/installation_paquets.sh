#!/bin/bash
set -e
echo "Mise à jour des paquets"
sudo apt update
echo "Installation des paquets de base"
sudo apt install -y curl wget git unzip tmux
echo "Installation de zsh"
sudo apt install -y zsh
sudo chsh -s "$(which zsh)" $USER
echo "Télechargement de oh-my-zsh"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install_ohmyzsh.sh
echo "lancer zsh pour "
