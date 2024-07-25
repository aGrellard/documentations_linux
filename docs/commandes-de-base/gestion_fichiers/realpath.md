---
title: realpath
tags:
  - ressource
  - linux
  - bash
  - programmation
  - scripts
  - programmes
status:
  - En cours
type de note:
  - ressource
date: 2024-07-12
---


# Documentation pour la commande `realpath` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la commande `realpath`](#fonctionnement-de-la-commande-realpath)
4. [Syntaxe de la commande `realpath`](#syntaxe-de-la-commande-realpath)
5. [Exemples d'utilisation](#exemples-dutilisation)
    - [Exemple 1](#exemple-1)
    - [Exemple 2](#exemple-2)
6. [Options de la commande `realpath`](#options-de-la-commande-realpath)
    - [Option `--canonicalize`](#option---canonicalize)
    - [Option `--relative-to`](#option---relative-to)
    - [Option `--relative-base`](#option---relative-base)
    - [Option `--help`](#option---help)
    - [Option `--version`](#option---version)
7. [Connexes](#Connexes)

## Introduction

La commande `realpath` sous Linux est utilisée pour afficher le chemin absolu canonique d'un fichier ou d'un répertoire. Cela signifie qu'elle résout tous les liens symboliques, les points (`.`) et les doubles points (`..`) dans le chemin, fournissant ainsi le chemin réel et absolu du fichier ou du répertoire.

## Installation

Pour installer la commande `realpath` sur votre système Linux, vous pouvez utiliser le gestionnaire de paquets approprié pour votre distribution. Voici les commandes pour quelques distributions courantes :

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install coreutils
```

### Sur Fedora

```bash
sudo dnf install coreutils
```

### Sur Arch Linux

```bash
sudo pacman -S coreutils
```

## Fonctionnement de la commande `realpath`

La commande `realpath` lit le chemin fourni en entrée et le convertit en un chemin absolu canonique. Elle résout tous les liens symboliques et les répertoires relatifs pour fournir un chemin complet et absolu.

## Syntaxe de la commande `realpath`

```bash
realpath [OPTION]... FICHIER...
```

### Arguments

- `FICHIER`: Un ou plusieurs fichiers ou répertoires dont vous souhaitez obtenir le chemin absolu.

## Exemples d'utilisation

### Exemple 1

Supposons que nous ayons la structure de répertoire suivante :

```
/home/user
├── documents
│   └── projet -> /mnt/data/projet
```

Utilisation de la commande `realpath` pour obtenir le chemin absolu du lien symbolique `projet` :

```bash
realpath /home/user/documents/projet
```

**Sortie :**

```
/mnt/data/projet
```

**Explication :**

La commande résout le lien symbolique `projet` et affiche le chemin absolu.

### Exemple 2

Supposons que nous ayons le chemin relatif suivant : `../user/documents`.

Utilisation de la commande `realpath` pour obtenir le chemin absolu :

```bash
realpath ../user/documents
```

**Sortie :**

```
/home/user/documents
```

**Explication :**

La commande convertit le chemin relatif en un chemin absolu.

## Options de la commande `realpath`

### Option `--canonicalize`

Convertit tous les composants de chemin en un chemin absolu canonique. C'est l'option par défaut.

```bash
realpath --canonicalize ../user/documents
```

**Explication :** Cette option est implicite dans la commande `realpath` et est utilisée pour garantir que le chemin de sortie est absolu et sans liens symboliques.

### Option `--relative-to`

Affiche le chemin relatif par rapport au répertoire spécifié.

```bash
realpath --relative-to=/home /home/user/documents
```

**Sortie :**

```
user/documents
```

**Explication :** Cette option affiche le chemin relatif à partir du répertoire spécifié.

### Option `--relative-base`

Combine les chemins relatifs pour obtenir un chemin absolu.

```bash
realpath --relative-base=/home /home/user/documents/../images
```

**Sortie :**

```
/home/user/images
```

**Explication :** Cette option simplifie le chemin en combinant les segments relatifs.

### Option `--help`

Affiche l'aide pour la commande `realpath`.

```bash
realpath --help
```

**Explication :** Cette option affiche les informations d'aide sur l'utilisation de la commande.

### Option `--version`

Affiche la version de la commande `realpath`.

```bash
realpath --version
```

**Explication :** Cette option affiche la version installée de la commande `realpath`.

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour utiliser efficacement la commande `realpath` sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man realpath`.
## Connexes
- [[Chemin-absolue-cannonique]]