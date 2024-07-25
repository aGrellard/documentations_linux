---
title: hile read -r - 2
date: 2024-07-18
tags:
  - ressource
  - templates
status:
  - En cours
type de note:
  - ressource
référence:
  - "[[02_RESSOURCES/Linux/bash/commandes/read|read]]"
  - "[[while read -r - 1]]"
---
# Documentation pour `find . -type f | while read -r file; do` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande](#fonctionnement-de-la-commande)
3. [Syntaxe de la commande](#syntaxe-de-la-commande)
4. [Options et utilisation de `find`](#options-et-utilisation-de-find)
    - [Option `-type`](#option--type)
    - [Option `-name`](#option--name)
    - [Option `-mtime`](#option--mtime)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Afficher les noms de fichiers trouvés](#exemple-1--afficher-les-noms-de-fichiers-trouvés)
    - [Exemple 2 : Copier tous les fichiers trouvés vers un autre répertoire](#exemple-2--copier-tous-les-fichiers-trouvés-vers-un-autre-répertoire)
    - [Exemple 3 : Changer les permissions des fichiers trouvés](#exemple-3--changer-les-permissions-des-fichiers-trouvés)
6. [Conclusion](#conclusion)

## Introduction

La combinaison des commandes `find` et `while read` est couramment utilisée pour effectuer des opérations sur une liste de fichiers trouvés. Cette méthode est particulièrement utile pour traiter de grands ensembles de fichiers dans des répertoires de manière systématique.

## Fonctionnement de la commande

La commande `find . -type f` trouve tous les fichiers dans le répertoire courant et ses sous-répertoires. Le résultat de cette commande est ensuite passé à une boucle `while read` qui permet de traiter chaque fichier trouvé individuellement.

## Syntaxe de la commande

```bash
find . -type f | while read -r file; do
    # Commandes à exécuter sur chaque fichier
done
```

### Arguments

- `find . -type f` : Recherche tous les fichiers (`-type f`) à partir du répertoire courant (`.`).
- `|` : Utilise un pipe pour passer la sortie de `find` à la commande suivante.
- `while read -r file; do` : Lit chaque ligne de la sortie de `find`, stocke le nom de fichier dans la variable `file`, et exécute les commandes spécifiées.

## Options et utilisation de `find`

### Option `-type`

Spécifie le type d'éléments à trouver.

- `-type f` : Trouve des fichiers.
- `-type d` : Trouve des répertoires.

### Option `-name`

Recherche des fichiers ou répertoires par nom.

```bash
find . -type f -name "*.txt"
```

### Option `-mtime`

Recherche des fichiers par date de modification.

- `-mtime +n` : Trouve des fichiers modifiés il y a plus de `n` jours.
- `-mtime -n` : Trouve des fichiers modifiés dans les `n` derniers jours.

```bash
find . -type f -mtime -7
```

## Exemples concrets

### Exemple 1 : Afficher les noms de fichiers trouvés

Cet exemple affiche simplement le nom de chaque fichier trouvé.

```bash
#!/bin/bash

find . -type f | while read -r file; do
    echo "Fichier trouvé : $file"
done
```

### Exemple 2 : Copier tous les fichiers trouvés vers un autre répertoire

Cet exemple copie chaque fichier trouvé vers un répertoire spécifié.

```bash
#!/bin/bash

destination="/chemin/vers/destination"

find . -type f | while read -r file; do
    cp "$file" "$destination"
done
```

### Exemple 3 : Changer les permissions des fichiers trouvés

Cet exemple change les permissions de chaque fichier trouvé pour les rendre exécutables.

```bash
#!/bin/bash

find . -type f | while read -r file; do
    chmod +x "$file"
done
```

## Conclusion

Utiliser `find` avec une boucle `while read` est une méthode puissante et flexible pour traiter des fichiers de manière systématique dans des scripts bash. Cette approche permet de réaliser des opérations complexes sur des ensembles de fichiers de manière efficace et structurée. Pour des informations supplémentaires, consultez les pages de manuel en utilisant les commandes `man find` et `man bash` ou la documentation officielle de votre distribution Linux.