---
title: while read -r - 1
date: 2024-07-18
tags:
  - ressource
  - linux
  - bash
  - programmation
  - templates
status:
  - En cours
  - Complété
type de note:
  - ressource
référence:
  - "[[IFS]]"
  - "[[structure_boucles]]"
source:
  - chatgpt
---
# Documentation pour `while IFS= read -r ligne` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la boucle `while IFS= read -r ligne`](#fonctionnement-de-la-boucle-while-ifs-read--r-ligne)
3. [Syntaxe de la boucle `while IFS= read -r ligne`](#syntaxe-de-la-boucle-while-ifs-read--r-ligne)
4. [Options et utilisation de `read`](#options-et-utilisation-de-read)
    - [Option `-r`](#option--r)
    - [Option `-d`](#option--d)
    - [Option `-n`](#option--n)
    - [Option `-p`](#option--p)
    - [Option `-s`](#option--s)
    - [Option `-t`](#option--t)
    - [Option `-u`](#option--u)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Lecture d'un fichier ligne par ligne](#exemple-1--lecture-dun-fichier-ligne-par-ligne)
    - [Exemple 2 : Lecture d'un fichier sans trim des espaces](#exemple-2--lecture-dun-fichier-sans-trim-des-espaces)
    - [Exemple 3 : Lecture de l'entrée standard](#exemple-3--lecture-de-lentrée-standard)
6. [Conclusion](#conclusion)

## Introduction

La combinaison `while IFS= read -r ligne` est couramment utilisée dans les scripts bash pour lire un fichier ligne par ligne. Cette méthode est efficace pour traiter des fichiers texte de manière sécurisée et sans perdre des informations critiques comme les espaces en début ou en fin de ligne.

## Fonctionnement de la boucle `while IFS= read -r ligne`

Cette boucle permet de lire un fichier ligne par ligne sans modifier les espaces blancs ni interpréter les caractères d'échappement. La variable `IFS` (Internal Field Separator) est définie comme une chaîne vide pour éviter que les espaces, tabulations et nouvelles lignes ne soient supprimés. L'option `-r` de la commande `read` empêche le traitement des caractères d'échappement, ce qui est utile pour préserver les barres obliques inverses (`\`).

## Syntaxe de la boucle `while IFS= read -r ligne`

```bash
while IFS= read -r ligne; do
    # Traitement de chaque ligne
done < fichier.txt
```

### Arguments

- `IFS=` : Définit l'Internal Field Separator à une chaîne vide.
- `read -r ligne` : Utilise `read` pour lire une ligne entière sans interpréter les caractères d'échappement.

## Options et utilisation de `read`

### Option `-r`

Empêche `read` d'interpréter les barres obliques inverses comme caractères d'échappement.

```bash
read -r ligne
```

### Option `-d`

Définit le délimiteur de ligne. Par défaut, il s'agit de la nouvelle ligne (`\n`).

```bash
read -d ":" ligne
```

### Option `-n`

Lit un nombre spécifié de caractères.

```bash
read -n 5 ligne
```

### Option `-p`

Affiche une invite avant de lire l'entrée.

```bash
read -p "Entrez une valeur: " ligne
```

### Option `-s`

Masque l'entrée (utile pour les mots de passe).

```bash
read -s ligne
```

### Option `-t`

Définit une limite de temps (en secondes) pour lire l'entrée.

```bash
read -t 5 ligne
```

### Option `-u`

Lit l'entrée à partir d'un descripteur de fichier.

```bash
read -u 3 ligne
```

## Exemples concrets

### Exemple 1 : Lecture d'un fichier ligne par ligne

Cet exemple montre comment lire un fichier ligne par ligne et afficher chaque ligne.

```bash
#!/bin/bash

while IFS= read -r ligne; do
    echo "$ligne"
done < fichier.txt
```

**Explication :**

- `while IFS= read -r ligne; do` : Lit chaque ligne du fichier sans modifier les espaces ni interpréter les caractères d'échappement.
- `echo "$ligne"` : Affiche chaque ligne lue.

### Exemple 2 : Lecture d'un fichier sans trim des espaces

Cet exemple illustre comment préserver les espaces en début et en fin de ligne lors de la lecture.

```bash
#!/bin/bash

while IFS= read -r ligne; do
    echo "Ligne lue : '$ligne'"
done < fichier.txt
```

**Explication :**

- `IFS=` : Préserve les espaces en début et en fin de ligne.
- `echo "Ligne lue : '$ligne'"` : Affiche chaque ligne avec des guillemets pour visualiser les espaces.

### Exemple 3 : Lecture de l'entrée standard

Cet exemple montre comment utiliser la boucle pour lire l'entrée standard (stdin).

```bash
#!/bin/bash

echo "Entrez des lignes de texte. Appuyez sur Ctrl+D pour terminer."
while IFS= read -r ligne; do
    echo "Ligne : $ligne"
done
```

**Explication :**

- `done` sans `< fichier.txt` : Lit l'entrée standard jusqu'à ce que Ctrl+D soit pressé.
- `echo "Ligne : $ligne"` : Affiche chaque ligne entrée par l'utilisateur.

## Conclusion

L'utilisation de `while IFS= read -r ligne` est une technique puissante et flexible pour lire et traiter des fichiers ligne par ligne dans les scripts bash. Cette méthode permet de préserver les espaces blancs et d'éviter les interprétations indésirables des caractères d'échappement, rendant le traitement des fichiers plus robuste et précis. Pour des informations supplémentaires, consultez les pages de manuel en utilisant la commande `man bash` ou la documentation officielle de votre distribution Linux.
