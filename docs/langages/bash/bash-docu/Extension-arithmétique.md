---
title: Extension arithmétique
tags:
  - ressource
  - scripts
  - bash
  - programmation
  - linux
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
  - pierre-giraud
date: 2024-07-10
---
# L'extension arithmétique `$(())` sous Linux

## Introduction

L'extension arithmétique `$(())` sous Linux est utilisée pour effectuer des opérations arithmétiques simples dans les scripts et les lignes de commande du shell. Elle permet d'évaluer des expressions mathématiques et de substituer leur résultat dans des commandes ou des scripts.

## Installation

L'extension arithmétique `$(())` est une fonctionnalité intégrée dans les shells modernes comme Bash, Zsh, et autres. Vous n'avez donc pas besoin de l'installer séparément. Pour utiliser cette fonctionnalité, il suffit d'avoir un shell compatible installé sur votre système. Bash est généralement préinstallé sur la plupart des distributions Linux.

### Vérifier l'installation de Bash

Pour vérifier si Bash est installé, vous pouvez utiliser la commande suivante :

```bash
bash --version
```

## Fonctionnement de l'extension arithmétique

L'extension arithmétique évalue l'expression mathématique contenue entre les parenthèses doubles et remplace cette expression par son résultat. Cela permet d'effectuer des calculs directement dans les scripts et les commandes du shell.

## Syntaxe de l'extension arithmétique

```bash
$((expression))
```

### Arguments

- `expression` : Toute expression arithmétique valide comprenant des opérateurs et des valeurs numériques.

## Options de l'extension arithmétique

L'extension arithmétique `$(())` n'a pas d'options spécifiques propres. Toutefois, vous pouvez utiliser divers opérateurs arithmétiques dans l'expression pour effectuer des calculs.

### Opérateurs arithmétiques

Voici quelques opérateurs arithmétiques couramment utilisés dans l'extension arithmétique :

- `+` : Addition
- `-` : Soustraction
- `*` : Multiplication
- `/` : Division
- `%` : Modulo
- `**` : Exponentiation
- `<<` : Décalage binaire à gauche
- `>>` : Décalage binaire à droite

## Exemples concrets

### Exemple 1

Addition de deux nombres.

```bash
result=$((5 + 3))
echo "Le résultat de 5 + 3 est : $result"
```

**Explication :**

1. `$((5 + 3))` évalue l'expression `5 + 3` et produit le résultat `8`.
2. Le résultat est assigné à la variable `result`.
3. La commande `echo` affiche la valeur de `result`.

### Exemple 2

Multiplication de deux nombres.

```bash
result=$((7 * 6))
echo "Le résultat de 7 * 6 est : $result"
```

**Explication :**

1. `$((7 * 6))` évalue l'expression `7 * 6` et produit le résultat `42`.
2. Le résultat est assigné à la variable `result`.
3. La commande `echo` affiche la valeur de `result`.

### Exemple 3

Utilisation de variables dans des expressions arithmétiques.

```bash
a=10
b=4
result=$((a - b))
echo "Le résultat de $a - $b est : $result"
```

**Explication :**

1. Les variables `a` et `b` sont assignées aux valeurs `10` et `4`, respectivement.
2. `$((a - b))` évalue l'expression `a - b` et produit le résultat `6`.
3. Le résultat est assigné à la variable `result`.
4. La commande `echo` affiche la valeur de `result`.

### Exemple 4

Calcul de l'exponentiation.

```bash
result=$((2 ** 3))
echo "Le résultat de 2 ** 3 est : $result"
```

**Explication :**

1. `$((2 ** 3))` évalue l'expression `2 ** 3` et produit le résultat `8`.
2. Le résultat est assigné à la variable `result`.
3. La commande `echo` affiche la valeur de `result`.

---

Cette documentation vous fournit toutes les informations nécessaires pour comprendre et utiliser efficacement l'extension arithmétique `$(())` sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man bash`.

## Connexes
- [[Substitution-de-commandes]]
- [extension-substitution-commande](https://www.pierre-giraud.com/shell-bash/extension-substitution-commande/)