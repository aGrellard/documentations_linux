- [Documentation de la fonction `du`](#documentation-de-la-fonction-du)
  - [Syntaxe](#syntaxe)
  - [Options principales](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Utilisation basique pour répertoire courant](#1-utilisation-basique-pour-répertoire-courant)
  - [2. Afficher l'utilisation de l'espace en format lisible](#2-afficher-lutilisation-de-lespace-en-format-lisible)
  - [3. Sommaire de l'espace utilisé pour un répertoire spécifique](#3-sommaire-de-lespace-utilisé-pour-un-répertoire-spécifique)
  - [4. Afficher l'espace utilisé avec un total cumulatif](#4-afficher-lespace-utilisé-avec-un-total-cumulatif)
  - [5. Limite la profondeur de l'analyse à 2 niveaux](#5-limite-la-profondeur-de-lanalyse-à-2-niveaux)
  - [6. Afficher l'espace utilisé par chaque fichier](#6-afficher-lespace-utilisé-par-chaque-fichier)
  - [7. Exclure les fichiers correspondant à un motif](#7-exclure-les-fichiers-correspondant-à-un-motif)
  - [8. Suivre les liens symboliques](#8-suivre-les-liens-symboliques)
  - [9. Ignorer les sous-répertoires](#9-ignorer-les-sous-répertoires)
  - [10. Analyser un seul système de fichiers](#10-analyser-un-seul-système-de-fichiers)
- [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
  - [1. Surveiller l'utilisation de l'espace par les logs](#1-surveiller-lutilisation-de-lespace-par-les-logs)
  - [2. Trouver les 5 dossiers les plus volumineux](#2-trouver-les-5-dossiers-les-plus-volumineux)
  - [3. Surveiller l'espace disque après nettoyage](#3-surveiller-lespace-disque-après-nettoyage)
  - [4. Estimation de l'espace avant la sauvegarde](#4-estimation-de-lespace-avant-la-sauvegarde)
  - [5. Comparer l'utilisation de l'espace avant et après une opération](#5-comparer-lutilisation-de-lespace-avant-et-après-une-opération)
  - [6. Exclure des fichiers spécifiques de l'analyse](#6-exclure-des-fichiers-spécifiques-de-lanalyse)
  - [7. Vérifier l'utilisation de l'espace par les utilisateurs](#7-vérifier-lutilisation-de-lespace-par-les-utilisateurs)
  - [8. Identifier rapidement l'espace utilisé par les applications](#8-identifier-rapidement-lespace-utilisé-par-les-applications)
  - [9. Nettoyer les fichiers temporaires inutilisés](#9-nettoyer-les-fichiers-temporaires-inutilisés)
  - [10. Analyser l'utilisation de l'espace par des projets spécifiques](#10-analyser-lutilisation-de-lespace-par-des-projets-spécifiques)
- [Cas d'utilisation avec des pipes](#cas-dutilisation-avec-des-pipes)
  - [1. Lister et trier les dossiers par taille](#1-lister-et-trier-les-dossiers-par-taille)
  - [2. Trouver les fichiers les plus volumineux dans un répertoire](#2-trouver-les-fichiers-les-plus-volumineux-dans-un-répertoire)
  - [3. Somme de l'utilisation du disque pour un type de fichier](#3-somme-de-lutilisation-du-disque-pour-un-type-de-fichier)
  - [4. Comparaison de l'espace utilisé par les dossiers](#4-comparaison-de-lespace-utilisé-par-les-dossiers)
  - [5. Surveillance de l'espace libéré par suppression de fichiers](#5-surveillance-de-lespace-libéré-par-suppression-de-fichiers)
  - [6. Affichage de l'utilisation du disque par des fichiers modifiés récemment](#6-affichage-de-lutilisation-du-disque-par-des-fichiers-modifiés-récemment)
  - [7. Lister les fichiers d'une taille spécifique](#7-lister-les-fichiers-dune-taille-spécifique)
  - [8. Estimer l'espace occupé par les fichiers non accédés récemment](#8-estimer-lespace-occupé-par-les-fichiers-non-accédés-récemment)
  - [9. Vérifier l'utilisation de l'espace après une copie de fichiers](#9-vérifier-lutilisation-de-lespace-après-une-copie-de-fichiers)
  - [10. Surveillance de l'espace disque pendant une archive](#10-surveillance-de-lespace-disque-pendant-une-archive)


La commande `du` (disk usage) est essentielle dans les environnements Unix et Linux, y compris Debian, pour surveiller et gérer l'espace disque. Elle analyse et affiche l'utilisation de l'espace disque des fichiers et répertoires, permettant aux utilisateurs et administrateurs de comprendre comment l'espace est distribué sur leurs systèmes.

# Documentation de la fonction `du`

## Syntaxe
```
du [OPTION]... [FILE]...
du [OPTION]... --files0-from=F
```

## Options principales

- `-a, --all`: Affiche l'espace utilisé par chaque fichier, pas seulement les répertoires.
- `-c, --total`: Affiche un total cumulatif pour tous les arguments en fin de sortie.
- `-h, --human-readable`: Affiche les tailles en format lisible par l'homme (ex. 1K, 234M, 2G).
- `--max-depth=N`: Affiche l'utilisation de l'espace jusqu'à N niveaux de profondeur de répertoire.
- `-s, --summarize`: Affiche seulement un total pour chaque argument (répertoire).
- `-x, --one-file-system`: Ignore les répertoires sur des systèmes de fichiers différents.
- `--exclude=PATTERN`: Exclut les fichiers qui correspondent au motif.
- `-L, --dereference`: Suit les liens symboliques.
- `-S, --separate-dirs`: N'inclut pas l'espace utilisé par les sous-répertoires.

# Exemples d'utilisation

## 1. Utilisation basique pour répertoire courant
   ```bash
   du
   ```
   
## 2. Afficher l'utilisation de l'espace en format lisible
   ```bash
   du -h
   ```

## 3. Sommaire de l'espace utilisé pour un répertoire spécifique
   ```bash
   du -sh /var/log
   ```

## 4. Afficher l'espace utilisé avec un total cumulatif
   ```bash
   du -ch /var/log
   ```

## 5. Limite la profondeur de l'analyse à 2 niveaux
   ```bash
   du -h --max-depth=2 /home/user
   ```

## 6. Afficher l'espace utilisé par chaque fichier
   ```bash
   du -ah /home/user
   ```

## 7. Exclure les fichiers correspondant à un motif
   ```bash
   du -h --exclude='*.tmp' /tmp
   ```

## 8. Suivre les liens symboliques
   ```bash
   du -Lh /path/to/directory
   ```

## 9. Ignorer les sous-répertoires
   ```bash
   du -S /home/user
   ```

## 10. Analyser un seul système de fichiers
    ```bash
    du -xh /
    ```

# Cas d'utilisation de la fonction

## 1. Surveiller l'utilisation de l'espace par les logs
   ```bash
   du -sh /var/log
   ```

## 2. Trouver les 5 dossiers les plus volumineux
   ```bash
   du -h / | sort -rh | head -5
   ```

## 3. Surveiller l'espace disque après nettoyage
   ```bash
   du -sh /var && sudo apt clean && du -sh /var
   ```

## 4. Estimation de l'espace avant la sauvegarde
   ```bash
   du -sh /home/user/Documents
   ```

## 5. Comparer l'utilisation de l'espace avant et après une opération
   ```bash
   du -sh /path && operation && du -sh /path
   ```

## 6. Exclure des fichiers spécifiques de l'analyse
   ```bash
   du -h --exclude='*.mp4' /home/user/Videos
   ```

## 7. Vérifier l'utilisation de l'espace par les utilisateurs
   ```bash
   du -sh /home/*
   ```

## 8. Identifier rapidement l'espace utilisé par les applications
   ```bash
   du -sh /opt/*
   ```

## 9. Nettoyer les fichiers temporaires inutilisés
   ```bash
   du -h /tmp | sort -rh | head -10
   ```

## 10. Analyser l'utilisation de l'espace par des projets spécifiques
    ```bash
    du -sh /var/www/html/*
    ```

# Cas d'utilisation avec des pipes

## 1. Lister et trier les dossiers par taille
   ```bash
   du -h --max-depth=1 /path/to/directory | sort -hr
   ```

## 2. Trouver les fichiers les plus volumineux dans un répertoire
   ```bash
   find /path/to/directory -type f -exec du -h {} + | sort -rh | head -10
   ```

## 3. Somme de l'utilisation du disque pour un type de fichier
   ```bash
   find /path/to/directory -type f -name '*.jpg' | xargs du -ch | tail -n 1
   ```

## 4. Comparaison de l'espace utilisé par les dossiers
   ```bash
   du -sh /path/to/directory/* | sort -rh
   ```

## 5. Surveillance de l'espace libéré par suppression de fichiers
   ```bash
   du -sh /path && rm -r /path/to/old/logs/* && du -sh /path
   ```

## 6. Affichage de l'utilisation du disque par des fichiers modifiés récemment
   ```bash
   find /path/to/directory -mtime -7 -exec du -h {} + | sort -rh
   ```

## 7. Lister les fichiers d'une taille spécifique
   ```bash
   find / -size +100M -exec du -h {} + | sort -rh
   ```

## 8. Estimer l'espace occupé par les fichiers non accédés récemment
   ```bash
   find /path/to/directory -atime +365 -exec du -h {} + | sort -rh
   ```

## 9. Vérifier l'utilisation de l'espace après une copie de fichiers
   ```bash
   du -sh /destination && cp /source/* /destination && du -sh /destination
   ```

## 10. Surveillance de l'espace disque pendant une archive
    ```bash
    du -sh /path/to/directory && tar -czf archive.tar.gz /path/to/directory && du -sh archive
.tar.gz
    ```

Ces exemples illustrent comment utiliser efficacement `du` dans des scénarios réels pour gérer l'espace disque, que ce soit pour la maintenance régulière, la surveillance de l'espace disque, ou pour des tâches spécifiques comme la préparation à des sauvegardes ou le nettoyage de fichiers.