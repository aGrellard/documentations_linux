---
title: Substitution-de-commandes
tags:
  - ressource
  - bash
  - scripts
  - linux
  - programmation
status:
  - Complété
type de note:
  - ressource
date: 2024-07-10
source:
  - chatgpt
---
# Substitution de commande `$()`


## Introduction

La substitution de commande `$()` sous Linux est une fonctionnalité de shell qui permet d'exécuter une commande et de substituer son résultat dans une autre commande. C'est une méthode pratique pour capturer la sortie d'une commande et l'utiliser directement dans une autre commande ou assigner cette sortie à une variable.

## Installation

La substitution de commande `$()` est une fonctionnalité intégrée dans les shells modernes comme Bash, Zsh, et autres. Vous n'avez donc pas besoin de l'installer séparément. Pour utiliser cette fonctionnalité, il suffit d'avoir un shell compatible installé sur votre système. Bash est généralement préinstallé sur la plupart des distributions Linux.

### Vérifier l'installation de Bash

Pour vérifier si Bash est installé, vous pouvez utiliser la commande suivante :

```bash
bash --version
```

## Fonctionnement de la substitution de commande

La substitution de commande exécute la commande spécifiée à l'intérieur des parenthèses et remplace la commande par sa sortie. Cela permet d'inclure dynamiquement les résultats de commandes dans d'autres commandes ou scripts.

## Syntaxe de la substitution de commande

```bash
$(commande)
```

### Arguments

- `commande` : Toute commande valide du shell dont vous souhaitez capturer la sortie.

## Options de la substitution de commande

La substitution de commande `$()` n'a pas d'options spécifiques propres. Toutefois, vous pouvez utiliser les options des commandes internes pour affiner les résultats de la substitution.

### Exemple d'option de commande intégrée

Si vous utilisez une commande interne comme `ls` avec des options dans une substitution de commande, cela peut ressembler à ceci :

```bash
$(ls -l)
```

**Explication :** Cette commande exécute `ls -l` et substitue la sortie détaillée de `ls` là où `$()` est utilisé.

## Exemples concrets

### Exemple 1

Utilisation de la substitution de commande pour assigner la sortie d'une commande à une variable.

```bash
current_date=$(date)
echo "La date actuelle est : $current_date"
```

**Explication :**

1. `$(date)` exécute la commande `date` qui affiche la date et l'heure actuelles.
2. La sortie de `date` est assignée à la variable `current_date`.
3. La commande `echo` affiche la valeur de `current_date`.

### Exemple 2

Utilisation de la substitution de commande pour compter le nombre de fichiers dans un répertoire.

```bash
file_count=$(ls -1 | wc -l)
echo "Il y a $file_count fichiers dans le répertoire."
```

**Explication :**

1. `$(ls -1)` exécute la commande `ls` avec l'option `-1` pour lister les fichiers un par ligne.
2. `ls -1` est ensuite pipé (`|`) à `wc -l` qui compte le nombre de lignes.
3. La sortie de `wc -l` est assignée à la variable `file_count`.
4. La commande `echo` affiche le nombre de fichiers dans le répertoire.

---

Cette documentation vous fournit toutes les informations nécessaires pour comprendre et utiliser efficacement la substitution de commande `$()` sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man bash`.
