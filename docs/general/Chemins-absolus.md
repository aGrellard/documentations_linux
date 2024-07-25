---
title: Chemins-absolus
date: 2024-07-22
tags:
  - ressource
  - linux
  - informatique
  - templates
status:
  - En cours
type de note:
  - ressource
référence:
  - "[[Chemin-absolue-cannonique]]"
source:
  - chatgpt
---

# les chemins absolus sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Chemins absolus vs chemins relatifs](#chemins-absolus-vs-chemins-relatifs)
3. [Utilisation des chemins absolus](#utilisation-des-chemins-absolus)
4. [Exemples de chemins absolus](#exemples-de-chemins-absolus)
5. [Commandes courantes utilisant des chemins absolus](#commandes-courantes-utilisant-des-chemins-absolus)
    - [Commande `cd`](#commande-cd)
    - [Commande `ls`](#commande-ls)
    - [Commande `cp`](#commande-cp)
    - [Commande `mv`](#commande-mv)
    - [Commande `rm`](#commande-rm)
    - [Commande `find`](#commande-find)
6. [Conclusion](#conclusion)

## Introduction

Un chemin absolu est un chemin de fichier ou de répertoire qui commence à partir de la racine du système de fichiers. Contrairement à un chemin relatif, qui est spécifié par rapport au répertoire de travail courant, un chemin absolu donne l'emplacement complet d'un fichier ou d'un répertoire sur le système.

## Chemins absolus vs chemins relatifs

### Chemins absolus

Un chemin absolu commence toujours par `/`, qui est le répertoire racine. Il spécifie l'emplacement complet d'un fichier ou d'un répertoire à partir de la racine du système de fichiers.

**Exemple de chemin absolu :**

```
/home/user/documents/report.txt
```

### Chemins relatifs

Un chemin relatif est spécifié par rapport au répertoire de travail courant. Il n'utilise pas `/` au début et peut utiliser `.` pour représenter le répertoire courant et `..` pour représenter le répertoire parent.

**Exemple de chemin relatif :**

```
documents/report.txt
```

## Utilisation des chemins absolus

Les chemins absolus sont utilisés pour accéder à des fichiers et des répertoires de manière non ambiguë, indépendamment du répertoire de travail courant. Ils sont particulièrement utiles dans les scripts et les configurations où la précision est essentielle.

## Exemples de chemins absolus

- `/etc/passwd` : Fichier de mots de passe des utilisateurs.
- `/var/log/syslog` : Fichier de log système.
- `/usr/bin/bash` : Emplacement de l'interpréteur Bash.
- `/home/user/documents` : Répertoire `documents` de l'utilisateur.

## Commandes courantes utilisant des chemins absolus

### Commande `cd`

Change le répertoire de travail courant.

```bash
cd /home/user/documents
```

**Explication :** Change le répertoire de travail courant en `/home/user/documents`.

### Commande `ls`

Liste le contenu d'un répertoire.

```bash
ls /var/log
```

**Explication :** Liste le contenu du répertoire `/var/log`.

### Commande `cp`

Copie des fichiers ou des répertoires.

```bash
cp /home/user/file.txt /home/user/backup/file.txt
```

**Explication :** Copie `file.txt` dans le répertoire de sauvegarde.

### Commande `mv`

Déplace ou renomme des fichiers ou des répertoires.

```bash
mv /home/user/file.txt /home/user/documents/file.txt
```

**Explication :** Déplace `file.txt` dans le répertoire `documents`.

### Commande `rm`

Supprime des fichiers ou des répertoires.

```bash
rm /home/user/oldfile.txt
```

**Explication :** Supprime `oldfile.txt`.

### Commande `find`

Recherche des fichiers et des répertoires.

```bash
find /home/user -name "*.txt"
```

**Explication :** Recherche tous les fichiers avec l'extension `.txt` dans le répertoire `/home/user` et ses sous-répertoires.

## Conclusion

Les chemins absolus sont essentiels pour naviguer et manipuler le système de fichiers de manière précise et non ambiguë. En utilisant des chemins absolus, vous pouvez accéder directement à n'importe quel fichier ou répertoire sur votre système Linux, quel que soit le répertoire de travail courant. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man` suivie de la commande ou de la fonction spécifique que vous utilisez.
