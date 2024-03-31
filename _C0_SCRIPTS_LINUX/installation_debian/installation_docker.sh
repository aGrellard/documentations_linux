#!/bin/bash

# Arrêter immédiatement le script en cas d'erreur
set -e

# Fonction pour afficher les messages d'erreur
error() {
    echo "Erreur : $1" >&2
    exit 1
}

# Vérification si l'utilisateur est root
if [ "$(id -u)" -ne 0 ]; then
    error "Ce script doit être exécuté avec des privilèges de superutilisateur."
fi

# Mise à jour des paquets et installation des dépendances nécessaires pour ajouter un nouveau dépôt
echo "Mise à jour des paquets existants et installation des dépendances nécessaires..."
apt-get update
apt-get install -y ca-certificates curl || error "L'installation des dépendances nécessaires a échoué."

# Création du répertoire pour les clés GPG de Docker, si nécessaire
echo "Création du répertoire pour les clés GPG de Docker..."
install -m 0755 -d /etc/apt/keyrings

# Ajout de la clé GPG officielle de Docker
echo "Ajout de la clé GPG officielle de Docker..."
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Ajout du dépôt Docker aux sources APT
echo "Ajout du dépôt Docker aux sources APT..."
VERSION_CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $VERSION_CODENAME stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour des paquets après l'ajout du nouveau dépôt Docker
echo "Mise à jour des paquets pour reconnaître le nouveau dépôt Docker..."
apt-get update

# Installation des paquets Docker
echo "Installation des paquets Docker..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || error "L'installation des paquets Docker a échoué."

echo "L'installation de Docker est terminée avec succès."
