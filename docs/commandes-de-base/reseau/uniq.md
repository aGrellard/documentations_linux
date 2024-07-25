---
title: uniq
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

# Documentation pour la commande `uniq` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `uniq`](#fonctionnement-de-la-commande-uniq)
3. [Syntaxe de la commande `uniq`](#syntaxe-de-la-commande-uniq)
4. [Options de la commande `uniq`](#options-de-la-commande-uniq)
    - [Option `-c` (count)](#option--c-count)
    - [Option `-d` (duplicate)](#option--d-duplicate)
    - [Option `-u` (unique)](#option--u-unique)
    - [Option `-i` (ignore case)](#option--i-ignore-case)
    - [Option `-f` (skip fields)](#option--f-skip-fields)
    - [Option `-s` (skip characters)](#option--s-skip-characters)
    - [Option `-w` (check characters)](#option--w-check-characters)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Supprimer les lignes en double](#exemple-1--supprimer-les-lignes-en-double)
    - [Exemple 2 : Compter les occurrences de chaque ligne](#exemple-2--compter-les-occurrences-de-chaque-ligne)
    - [Exemple 3 : Afficher uniquement les lignes en double](#exemple-3--afficher-uniquement-les-lignes-en-double)
    - [Exemple 4 : Afficher uniquement les lignes uniques](#exemple-4--afficher-uniquement-les-lignes-uniques)
    - [Exemple 5 : Ignorer la casse lors de la comparaison](#exemple-5--ignorer-la-casse-lors-de-la-comparaison)
6. [Conclusion](#conclusion)

## Introduction

La commande `uniq` sous Linux est utilisée pour supprimer les lignes en double dans un fichier ou une sortie standard. Elle peut également être utilisée pour afficher des lignes en double ou uniques et pour compter les occurrences de chaque ligne. Pour que `uniq` fonctionne correctement, les lignes en double doivent être adjacentes, ce qui signifie que le fichier doit être trié avant d'utiliser `uniq`.

## Fonctionnement de la commande `uniq`

La commande `uniq` lit l'entrée standard ou un fichier et supprime les lignes en double adjacentes. Elle peut également afficher des informations supplémentaires sur les lignes, comme le nombre d'occurrences.

## Syntaxe de la commande `uniq`

```bash
uniq [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à traiter. Si aucun fichier n'est spécifié, `uniq` lit l'entrée standard.

## Options de la commande `uniq`

### Option `-c` (count)

Affiche chaque ligne unique avec le nombre d'occurrences.

```bash
uniq -c [fichier]
```

### Option `-d` (duplicate)

Affiche uniquement les lignes en double.

```bash
uniq -d [fichier]
```

### Option `-u` (unique)

Affiche uniquement les lignes uniques.

```bash
uniq -u [fichier]
```

### Option `-i` (ignore case)

Ignore la casse lors de la comparaison des lignes.

```bash
uniq -i [fichier]
```

### Option `-f` (skip fields)

Ignore les n premiers champs lors de la comparaison des lignes.

```bash
uniq -f n [fichier]
```

### Option `-s` (skip characters)

Ignore les n premiers caractères lors de la comparaison des lignes.

```bash
uniq -s n [fichier]
```

### Option `-w` (check characters)

Compare uniquement les n premiers caractères des lignes.

```bash
uniq -w n [fichier]
```

## Exemples concrets

### Exemple 1 : Supprimer les lignes en double

Pour supprimer les lignes en double dans un fichier `example.txt` :

```bash
sort example.txt | uniq
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et supprime les lignes en double adjacentes.

### Exemple 2 : Compter les occurrences de chaque ligne

Pour afficher chaque ligne unique avec le nombre d'occurrences dans `example.txt` :

```bash
sort example.txt | uniq -c
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et affiche chaque ligne unique avec le nombre d'occurrences.

### Exemple 3 : Afficher uniquement les lignes en double

Pour afficher uniquement les lignes en double dans `example.txt` :

```bash
sort example.txt | uniq -d
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et affiche uniquement les lignes en double adjacentes.

### Exemple 4 : Afficher uniquement les lignes uniques

Pour afficher uniquement les lignes uniques dans `example.txt` :

```bash
sort example.txt | uniq -u
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et affiche uniquement les lignes uniques.

### Exemple 5 : Ignorer la casse lors de la comparaison

Pour ignorer la casse lors de la comparaison des lignes dans `example.txt` :

```bash
sort example.txt | uniq -i
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` sans tenir compte de la casse et supprime les lignes en double adjacentes.

## Conclusion

La commande `uniq` est un outil puissant pour manipuler et nettoyer les données en supprimant les doublons. En utilisant ses différentes options, vous pouvez personnaliser la manière dont `uniq` traite les lignes en double, les lignes uniques et les occurrences de chaque ligne. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man uniq` ou la documentation officielle de votre distribution Linux.