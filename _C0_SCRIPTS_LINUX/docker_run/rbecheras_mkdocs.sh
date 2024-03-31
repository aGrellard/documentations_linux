#!/bin/bash

# Vérifie si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "Docker n'est pas installé. Veuillez installer Docker avant de lancer ce script."
    exit 1
fi

# Vérification de l'argument du répertoire
if [ "$#" -ne 1 ]; then
    echo "Utilisation: $0 chemin_vers_projet_mkdocs"
    exit 1
fi

# Détermine le répertoire de travail actuel
DATA_DIR=$1

# Vérification de l'existence du répertoire
if [ ! -d "$DATA_DIR" ]; then
    echo "Le répertoire spécifié n'existe pas: $DATA_DIR"
    exit 1
fi

# Lance un conteneur Docker pour MkDocs
echo "Lancement du serveur MkDocs sur http://localhost:8800"
docker run -it --rm \
  -p 8800:8800 \
  -v "$(realpath "$DATA_DIR"):/data" \
  -u "$(id -u):$(id -g)" \
  -w /data \
  --name mkdocs \
  rbecheras/mkdocs-material \
  mkdocs serve -a 0.0.0.0:8800
