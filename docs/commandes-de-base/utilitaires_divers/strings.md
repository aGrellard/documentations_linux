---
title: strings
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour la commande `strings` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `strings`](#fonctionnement-de-la-commande-strings)
3. [Syntaxe de la commande `strings`](#syntaxe-de-la-commande-strings)
4. [Options de la commande `strings`](#options-de-la-commande-strings)
    - [Option `-a` (scan entire file)](#option--a-scan-entire-file)
    - [Option `-n` (minimum length)](#option--n-minimum-length)
    - [Option `-o` (print offsets)](#option--o-print-offsets)
    - [Option `-t` (radix)](#option--t-radix)
    - [Option `-e` (encoding)](#option--e-encoding)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Extraire les chaînes de caractères d'un fichier](#exemple-1--extraire-les-chaînes-de-caractères-dun-fichier)
    - [Exemple 2 : Extraire les chaînes de caractères avec une longueur minimale](#exemple-2--extraire-les-chaînes-de-caractères-avec-une-longueur-minimale)
    - [Exemple 3 : Afficher les offsets des chaînes de caractères](#exemple-3--afficher-les-offsets-des-chaînes-de-caractères)
    - [Exemple 4 : Extraire les chaînes de caractères avec un encodage spécifique](#exemple-4--extraire-les-chaînes-de-caractères-avec-un-encodage-spécifique)
6. [Conclusion](#conclusion)

## Introduction

La commande `strings` sous Linux est utilisée pour extraire les chaînes de caractères imprimables d'un fichier binaire. Elle est particulièrement utile pour analyser des fichiers exécutables, des bibliothèques, ou d'autres fichiers binaires pour trouver du texte lisible par l'homme.

## Fonctionnement de la commande `strings`

La commande `strings` scanne un fichier binaire ou un flux d'entrée standard pour les séquences de caractères imprimables (texte lisible par l'homme) d'une certaine longueur. Par défaut, elle considère toute séquence de 4 caractères imprimables ou plus comme une chaîne de caractères.

## Syntaxe de la commande `strings`

```bash
strings [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à analyser. Si aucun fichier n'est spécifié, `strings` lit l'entrée standard.

## Options de la commande `strings`

### Option `-a` (scan entire file)

Analyse le fichier entier, y compris les sections non initialisées.

```bash
strings -a [fichier]
```

### Option `-n` (minimum length)

Spécifie la longueur minimale des chaînes de caractères à extraire.

```bash
strings -n <longueur> [fichier]
```

### Option `-o` (print offsets)

Affiche les offsets (positions) des chaînes de caractères dans le fichier.

```bash
strings -o [fichier]
```

### Option `-t` (radix)

Affiche les offsets en utilisant une base spécifique (o pour octal, x pour hexadécimal, d pour décimal).

```bash
strings -t <base> [fichier]
```

### Option `-e` (encoding)

Spécifie l'encodage des chaînes de caractères (s pour single-7-bit-byte, S pour single-8-bit-byte, b pour 16-bit big-endian, l pour 16-bit little-endian).

```bash
strings -e <encodage> [fichier]
```

## Exemples concrets

### Exemple 1 : Extraire les chaînes de caractères d'un fichier

Pour extraire les chaînes de caractères imprimables d'un fichier binaire `example.bin` :

```bash
strings example.bin
```

**Sortie :**

```
Some text
Another string
More readable text
```

### Exemple 2 : Extraire les chaînes de caractères avec une longueur minimale

Pour extraire les chaînes de caractères d'au moins 6 caractères de `example.bin` :

```bash
strings -n 6 example.bin
```

**Sortie :**

```
Another string
More readable text
```

### Exemple 3 : Afficher les offsets des chaînes de caractères

Pour afficher les offsets des chaînes de caractères dans `example.bin` :

```bash
strings -o example.bin
```

**Sortie :**

```
1234 Some text
5678 Another string
91011 More readable text
```

### Exemple 4 : Extraire les chaînes de caractères avec un encodage spécifique

Pour extraire les chaînes de caractères encodées en 16-bit little-endian de `example.bin` :

```bash
strings -e l example.bin
```

**Sortie :**

```
Text1
Text2
```

## Conclusion

La commande `strings` est un outil puissant pour extraire des chaînes de caractères imprimables à partir de fichiers binaires. En utilisant ses différentes options, vous pouvez personnaliser l'extraction de texte en fonction de vos besoins spécifiques, comme la longueur minimale des chaînes, l'affichage des offsets, et le choix de l'encodage. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man strings` ou la documentation officielle de votre distribution Linux.