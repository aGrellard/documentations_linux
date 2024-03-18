#!/bin/bash
set -e

echo "Installation des utilitaires"
sudo apt update
sudo apt install -y curl wget git unzip tmux

echo "Installation de zsh"
sudo apt install -y zsh

sudo chsh -s "$(which zsh)" $USER

echo "Installation de oh-my-zsh"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install_ohmyzsh.sh

echo "Mise à jour du shell par défaut (ceci nécessitera un mot de passe et une nouvelle connexion pour prendre effet)"
