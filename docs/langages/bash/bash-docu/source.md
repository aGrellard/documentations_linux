---
title: source
date: 2024-07-18
tags:
  - ressource
  - templates
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour la commande `source` en Bash sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la commande `source`](#fonctionnement-de-la-commande-source)
4. [Syntaxe de la commande `source`](#syntaxe-de-la-commande-source)
5. [Options de la commande `source`](#options-de-la-commande-source)
    - [Option `source`](#option-source)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Charger des variables d'environnement](#exemple-1--charger-des-variables-denvironnement)
    - [Exemple 2 : Charger des fonctions à partir d'un fichier](#exemple-2--charger-des-fonctions-à-partir-dun-fichier)
    - [Exemple 3 : Réexécuter un script après modification](#exemple-3--réexécuter-un-script-après-modification)
7. [Conclusion](#conclusion)

## Introduction

La commande `source` en Bash est utilisée pour lire et exécuter les commandes d'un fichier dans l'environnement du shell courant. Cela permet de charger des variables, des fonctions ou d'autres configurations sans créer un nouveau processus shell.

## Installation

La commande `source` est intégrée dans le shell Bash, donc aucune installation supplémentaire n'est nécessaire. Bash est généralement préinstallé sur la plupart des distributions Linux.

### Vérification de l'installation

Pour vérifier que Bash est installé, vous pouvez utiliser la commande suivante :

```bash
bash --version
```

## Fonctionnement de la commande `source`

La commande `source` lit et exécute les commandes d'un fichier dans l'environnement du shell courant. Contrairement à l'exécution d'un script en le lançant directement, l'utilisation de `source` permet de maintenir les variables et les fonctions définies dans le script dans le shell actuel.

## Syntaxe de la commande `source`

```bash
source nom_du_fichier
```

### Arguments

- `nom_du_fichier` : Le chemin du fichier contenant les commandes à exécuter.

## Options de la commande `source`

La commande `source` elle-même n'a pas d'options spécifiques, mais elle peut être utilisée avec différents types de fichiers de configuration et de scripts Bash.

### Option `source`

**Syntaxe :**

```bash
source fichier.sh
```

**Explication :** Cette commande exécute les commandes du fichier `fichier.sh` dans le shell courant.

## Exemples concrets

### Exemple 1 : Charger des variables d'environnement

Supposons que vous ayez un fichier `env.sh` contenant les lignes suivantes :

```bash
#!/bin/bash
export PATH=$PATH:/usr/local/bin
export MY_VAR="Bonjour, Monde!"
```

Vous pouvez utiliser `source` pour charger ces variables dans votre environnement de shell courant :

```bash
source env.sh
echo $MY_VAR  # Affiche "Bonjour, Monde!"
```

**Explication :** Ce script charge les variables d'environnement définies dans `env.sh` sans démarrer un nouveau shell.

### Exemple 2 : Charger des fonctions à partir d'un fichier

Supposons que vous ayez un fichier `functions.sh` contenant les lignes suivantes :

```bash
#!/bin/bash
hello() {
    echo "Hello, World!"
}
```

Vous pouvez utiliser `source` pour charger cette fonction dans votre shell courant :

```bash
source functions.sh
hello  # Affiche "Hello, World!"
```

**Explication :** Ce script charge la fonction `hello` définie dans `functions.sh` et la rend disponible dans le shell courant.

### Exemple 3 : Réexécuter un script après modification

Supposons que vous modifiez un script `config.sh` et que vous souhaitiez réappliquer ses modifications sans redémarrer votre session shell :

```bash
source config.sh
```

**Explication :** Cette commande réexécute `config.sh`, appliquant toutes les modifications ou mises à jour effectuées dans le fichier.

## Conclusion

La commande `source` est un outil puissant en Bash pour charger des configurations, des variables et des fonctions dans l'environnement du shell courant. Elle est particulièrement utile pour gérer des fichiers de configuration et des scripts modulaires. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man bash` ou la documentation officielle de Bash.