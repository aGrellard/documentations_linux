---
title: hexdump
date: 2024-07-18
tags:
  - ressource
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour la commande `hexdump` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `hexdump`](#fonctionnement-de-la-commande-hexdump)
3. [Syntaxe de la commande `hexdump`](#syntaxe-de-la-commande-hexdump)
4. [Options de la commande `hexdump`](#options-de-la-commande-hexdump)
    - [Option `-b` (one-byte octal display)](#option--b-one-byte-octal-display)
    - [Option `-C` (canonical hex+ASCII display)](#option--c-canonical-hexascii-display)
    - [Option `-n` (length)](#option--n-length)
    - [Option `-s` (skip)](#option--s-skip)

    - [Option `-v` (no suppression)](#option--v-no-suppression)
    - [Option `-e` (format string)](#option--e-format-string)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Afficher le contenu d'un fichier en hexadécimal](#exemple-1--afficher-le-contenu-dun-fichier-en-hexadécimal)
    - [Exemple 2 : Afficher les premiers 16 octets d'un fichier](#exemple-2--afficher-les-premiers-16-octets-dun-fichier)
    - [Exemple 3 : Sauter les 10 premiers octets et afficher le reste](#exemple-3--sauter-les-10-premiers-octets-et-afficher-le-reste)
    - [Exemple 4 : Afficher le contenu en hexadécimal et ASCII](#exemple-4--afficher-le-contenu-en-hexadécimal-et-ascii)
    - [Exemple 5 : Utiliser une chaîne de format personnalisée](#exemple-5--utiliser-une-chaîne-de-format-personnalisée)
6. [Conclusion](#conclusion)

## Introduction

La commande `hexdump` sous Linux est utilisée pour afficher le contenu d'un fichier en format hexadécimal, décimal, octal ou ASCII. Elle est particulièrement utile pour les développeurs et les administrateurs système pour inspecter les fichiers binaires et les données en mémoire.

## Fonctionnement de la commande `hexdump`

La commande `hexdump` lit un fichier ou un flux de données en entrée, et affiche son contenu en utilisant différents formats selon les options spécifiées. Elle peut afficher les données en hexadécimal, octal, ASCII, ou d'autres formats personnalisés.

## Syntaxe de la commande `hexdump`

```bash
hexdump [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à afficher. Si aucun fichier n'est spécifié, `hexdump` lit l'entrée standard.

## Options de la commande `hexdump`

### Option `-b` (one-byte octal display)

Affiche le contenu du fichier en octets octaux.

```bash
hexdump -b [fichier]
```

### Option `-C` (canonical hex+ASCII display)

Affiche le contenu du fichier en hexadécimal et en ASCII de manière canonique.

```bash
hexdump -C [fichier]
```

### Option `-n` (length)

Affiche uniquement les n premiers octets du fichier.

```bash
hexdump -n [nombre] [fichier]
```

### Option `-s` (skip)

Ignore les n premiers octets du fichier.

```bash
hexdump -s [nombre] [fichier]
```

### Option `-v` (no suppression)

Affiche toutes les lignes de sortie, y compris les lignes répétitives. Par défaut, les lignes répétitives sont représentées par `*`.

```bash
hexdump -v [fichier]
```

### Option `-e` (format string)

Permet d'utiliser une chaîne de format personnalisée pour afficher les données.

```bash
hexdump -e 'format_string' [fichier]
```

## Exemples concrets

### Exemple 1 : Afficher le contenu d'un fichier en hexadécimal

Pour afficher le contenu du fichier `example.bin` en hexadécimal :

```bash
hexdump example.bin
```

**Sortie :**

```
0000000 4865 6c6c 6f20 576f 726c 6421
000000c
```

### Exemple 2 : Afficher les premiers 16 octets d'un fichier

Pour afficher les premiers 16 octets du fichier `example.bin` :

```bash
hexdump -n 16 example.bin
```

**Sortie :**

```
0000000 4865 6c6c 6f20 576f 726c 6421 0000 0000
0000010
```

### Exemple 3 : Sauter les 10 premiers octets et afficher le reste

Pour sauter les 10 premiers octets du fichier `example.bin` et afficher le reste :

```bash
hexdump -s 10 example.bin
```

**Sortie :**

```
000000a 726c 6421 0000 0000
0000012
```

### Exemple 4 : Afficher le contenu en hexadécimal et ASCII

Pour afficher le contenu du fichier `example.bin` en hexadécimal et ASCII :

```bash
hexdump -C example.bin
```

**Sortie :**

```
00000000  48 65 6c 6c 6f 20 57 6f  72 6c 64 21 00 00 00 00  |Hello World!....|
00000010
```

### Exemple 5 : Utiliser une chaîne de format personnalisée

Pour afficher le contenu du fichier `example.bin` en utilisant une chaîne de format personnalisée :

```bash
hexdump -e '16/1 "%02X " "\n"' example.bin
```

**Sortie :**

```
48 65 6C 6C 6F 20 57 6F 72 6C 64 21 00 00 00 00 
```

## Conclusion

La commande `hexdump` est un outil puissant pour inspecter et afficher le contenu des fichiers binaires sous différents formats. Elle offre des options flexibles pour afficher les données en hexadécimal, octal, ASCII, et bien plus encore. En utilisant les options appropriées, vous pouvez personnaliser la sortie de `hexdump` pour répondre à vos besoins spécifiques. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man hexdump` ou la documentation officielle de votre distribution Linux.