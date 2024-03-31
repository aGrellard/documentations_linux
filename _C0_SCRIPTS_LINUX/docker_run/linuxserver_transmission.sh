#!/bin/bash

# Configuration des variables
PUID=1000
PGID=1000
TIMEZONE="Europe/Paris"
TRANSMISSION_WEB_HOME="" # Laisser vide si non utilisé
USER="" # Laisser vide si l'authentification n'est pas nécessaire
PASS="" # Laisser vide si l'authentification n'est pas nécessaire
WHITELIST="" # Laisser vide si non utilisé
PEERPORT="" # Laisser vide si la valeur par défaut est correcte
HOST_WHITELIST="" # Laisser vide si non utilisé

# Chemins sur l'hôte
CONFIG_PATH="/home/adrien/Documents/transmission/config"
DOWNLOADS_PATH="/home/adrien/Documents/transmission/downloads"
WATCH_PATH="/home/adrien/Documents/transmission/watch"

# Vérification et création des dossiers si nécessaire
mkdir -p "$CONFIG_PATH" "$DOWNLOADS_PATH" "$WATCH_PATH"

# Lancement du conteneur Docker
docker run -d \
    --name=transmission \
    -e PUID=$PUID \
    -e PGID=$PGID \
    -e TZ=$TIMEZONE \
    -e TRANSMISSION_WEB_HOME=$TRANSMISSION_WEB_HOME \
    -e USER=$USER \
    -e PASS=$PASS \
    -e WHITELIST=$WHITELIST \
    -e PEERPORT=$PEERPORT \
    -e HOST_WHITELIST=$HOST_WHITELIST \
    -p 9091:9091 \
    -p 51413:51413 \
    -p 51413:51413/udp \
    -v $CONFIG_PATH:/config \
    -v $DOWNLOADS_PATH:/downloads \
    -v $WATCH_PATH:/watch \
    --restart unless-stopped \
    lscr.io/linuxserver/transmission:latest

echo "Transmission a été lancé avec succès."
