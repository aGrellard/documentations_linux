---
title: Création-script
tags:
  - ressource
  - bash
  - scripts
  - programmation
  - linux
status:
  - Complété
type de note:
  - ressource
source:
  - chatgpt
  - formateux
date: 2024-07-10
---

# Création d'un script en Bash sous Linux

## Introduction

Les scripts en Bash sont des fichiers texte contenant une série de commandes shell qui sont exécutées de manière séquentielle. Ils sont utilisés pour automatiser des tâches répétitives ou complexes sur les systèmes Unix et Linux.

## Installation

Pour écrire et exécuter des scripts Bash, vous avez besoin d'un interpréteur Bash. Bash est généralement préinstallé sur la plupart des distributions Linux. Vous pouvez vérifier son installation en utilisant la commande suivante :

```bash
bash --version
```

### Installation de Bash

Si Bash n'est pas installé, vous pouvez l'installer en utilisant le gestionnaire de paquets de votre distribution.

#### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install bash
```

#### Sur Fedora

```bash
sudo dnf install bash
```

#### Sur Arch Linux

```bash
sudo pacman -S bash
```

## Fonctionnement d'un script Bash

Un script Bash fonctionne en exécutant une série de commandes dans un shell. Le script commence par un shebang (`#!`) qui indique au système quel interpréteur utiliser pour exécuter le script. Les commandes suivantes sont exécutées séquentiellement.

## Syntaxe d'un script Bash

1. **Shebang :** La première ligne du script commence par `#!` suivi du chemin de l'interpréteur Bash.
2. **Commentaires :** Les commentaires commencent par `#` et ne sont pas exécutés.
3. **Commandes :** Les commandes shell sont écrites ligne par ligne.

### Exemple de script Bash simple

```bash
#!/bin/bash
# Script pour afficher un message de bienvenue

echo "Bienvenue sur mon script Bash!"
```

### Exécution du script

1. Rendre le script exécutable :

```bash
chmod +x mon_script.sh
```

2. Exécuter le script :

```bash
./mon_script.sh
```

## Options d'un script Bash

### Option `-n`

Lire les commandes sans les exécuter (vérification de syntaxe).

```bash
bash -n mon_script.sh
```

### Option `-v`

Afficher les commandes avant de les exécuter.

```bash
bash -v mon_script.sh
```

### Option `-x`

Exécuter le script en mode débogage, affichant chaque commande et son résultat.

```bash
bash -x mon_script.sh
```

## Exemples concrets

### Exemple 1 : Script de sauvegarde

```bash
#!/bin/bash
# Script pour sauvegarder un répertoire

SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backup"
LOG_FILE="/home/user/backup/backup.log"

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

tar -czf "$BACKUP_DIR/backup_$(date +%Y%m%d).tar.gz" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    echo "$(date +%Y%m%d-%H:%M:%S) - Sauvegarde réussie" >> "$LOG_FILE"
else
    echo "$(date +%Y%m%d-%H:%M:%S) - Échec de la sauvegarde" >> "$LOG_FILE"
fi
```

**Explication :**

1. Définit les variables pour les répertoires source et de sauvegarde.
2. Vérifie si le répertoire de sauvegarde existe, sinon le crée.
3. Crée une archive tar gzippée du répertoire source.
4. Vérifie le succès de la commande et écrit le résultat dans un fichier de log.

### Exemple 2 : Script d'automatisation de mise à jour

```bash
#!/bin/bash
# Script pour automatiser la mise à jour du système

sudo apt update && sudo apt upgrade -y

if [ $? -eq 0 ]; then
    echo "Mise à jour réussie"
else
    echo "Échec de la mise à jour"
fi
```

**Explication :**

1. Exécute les commandes de mise à jour et de mise à niveau.
2. Vérifie le succès des commandes et affiche le résultat.

### Exemple 3 : Script de surveillance de l'espace disque

```bash
#!/bin/bash
# Script pour surveiller l'espace disque

THRESHOLD=80

usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ $usage -gt $THRESHOLD ]; then
    echo "Alerte : l'utilisation du disque a dépassé $THRESHOLD%"
else
    echo "L'utilisation du disque est sous contrôle."
fi
```

**Explication :**

1. Définit un seuil d'alerte pour l'utilisation du disque.
2. Obtient l'utilisation actuelle du disque pour la partition racine.
3. Compare l'utilisation actuelle avec le seuil et affiche un message en conséquence.
