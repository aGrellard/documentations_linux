---
title: set
date: 2024-07-18
tags:
  - ressource
  - templates
status:
  - A Terminer
type de note:
  - ressource
---
# Documentation pour la commande `
` en Bash sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la commande `set`](#fonctionnement-de-la-commande-set)
4. [Syntaxe de la commande `set`](#syntaxe-de-la-commande-set)
5. [Options de la commande `set`](#options-de-la-commande-set)
    - [Option `-e`](#option--e)
    - [Option `-u`](#option--u)
    - [Option `-x`](#option--x)
    - [Option `-o`](#option--o)
    - [Option `+e`, `+u`, `+x`](#option--e--u--x)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Utilisation de `set -e`](#exemple-1--utilisation-de-set--e)
    - [Exemple 2 : Utilisation de `set -u`](#exemple-2--utilisation-de-set--u)
    - [Exemple 3 : Utilisation de `set -x`](#exemple-3--utilisation-de-set--x)
    - [Exemple 4 : Combinaison des options](#exemple-4--combinaison-des-options)

## Introduction

La commande `set` en Bash est utilisée pour modifier les paramètres et les options d'environnement du shell. Elle permet de contrôler le comportement du script en activant ou désactivant des options spécifiques. Cette commande est essentielle pour écrire des scripts robustes et faciles à déboguer.

## Installation

La commande `set` est intégrée dans le shell Bash, donc aucune installation supplémentaire n'est nécessaire. Bash est généralement préinstallé sur la plupart des distributions Linux.

### Vérification de l'installation

Pour vérifier que Bash est installé, vous pouvez utiliser la commande suivante :

```bash
bash --version
```

## Fonctionnement de la commande `set`

La commande `set` permet de modifier les paramètres de l'environnement du shell. Elle peut activer ou désactiver des options spécifiques qui contrôlent le comportement du script. Par exemple, vous pouvez utiliser `set` pour arrêter l'exécution d'un script lorsqu'une commande échoue ou pour afficher chaque commande avant qu'elle ne soit exécutée.

## Syntaxe de la commande `set`

```bash
set [options]
```

## Options de la commande `set`

### Option `-e`

Arrête l'exécution du script lorsqu'une commande échoue.

```bash
set -e
```

**Explication :** Si une commande retourne un statut non nul, le script s'arrête immédiatement.

### Option `-u`

Considère les variables non définies comme une erreur et arrête l'exécution.

```bash
set -u
```

**Explication :** Si une variable non définie est utilisée, le script s'arrête immédiatement.

### Option `-x`

Affiche chaque commande avant de l'exécuter.

```bash
set -x
```

**Explication :** Cette option est utile pour le débogage, car elle affiche chaque commande avec ses arguments avant son exécution.

### Option `-o`

Permet d'activer ou de désactiver des options spécifiques avec des noms longs.

```bash
set -o option_name
```

**Exemple :**

```bash
set -o nounset  # équivalent à set -u
```

### Option `+e`, `+u`, `+x`

Désactive les options correspondantes.

```bash
set +e
set +u
set +x
```

**Explication :** Ces options désactivent respectivement le comportement défini par `-e`, `-u` et `-x`.

## Exemples concrets

### Exemple 1 : Utilisation de `set -e`

```bash
#!/bin/bash
set -e

echo "Début du script"

# Cette commande échoue (ls sur un répertoire inexistant)
ls /répertoire/inexistant

echo "Cette ligne ne sera pas exécutée"
```

**Explication :** Le script s'arrête après l'échec de la commande `ls`.

### Exemple 2 : Utilisation de `set -u`

```bash
#!/bin/bash
set -u

echo "Début du script"

# Cette commande échoue car la variable n'est pas définie
echo $VARIABLE_INDEFINIE

echo "Cette ligne ne sera pas exécutée"
```

**Explication :** Le script s'arrête lorsqu'il tente d'utiliser une variable non définie.

### Exemple 3 : Utilisation de `set -x`

```bash
#!/bin/bash
set -x

echo "Début du script"

# Affiche chaque commande avant de l'exécuter
ls /

echo "Fin du script"
```

**Explication :** Chaque commande est affichée avant son exécution, ce qui aide à déboguer le script.

### Exemple 4 : Combinaison des options

```bash
#!/bin/bash
set -eux

echo "Début du script"

# Cette commande échoue (ls sur un répertoire inexistant)
ls /répertoire/inexistant

echo "Cette ligne ne sera pas exécutée"
```

**Explication :** Le script utilise les options `-e`, `-u` et `-x` combinées. Il s'arrête à la première commande échouée, considère les variables non définies comme une erreur et affiche chaque commande avant son exécution.

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour comprendre et utiliser la commande `set` en Bash sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man bash` ou la documentation officielle de Bash.