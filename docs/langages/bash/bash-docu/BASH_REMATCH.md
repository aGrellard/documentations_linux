---
title: Sans titre
date: 2024-07-18
tags:
  - ressource
  - linux
  - scripts
  - programmation
  - bash
status:
  - En cours
type de note:
  - ressource
référence:
  - "[[Conditions]]"
  - "[[Conditions-composite]]"
---
# Documentation pour `BASH_REMATCH` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de `BASH_REMATCH`](#fonctionnement-de-bash_rematch)
3. [Syntaxe de l'utilisation de `BASH_REMATCH`](#syntaxe-de-lutilisation-de-bash_rematch)
4. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Correspondance simple](#exemple-1--correspondance-simple)
    - [Exemple 2 : Extraction de groupes capturés](#exemple-2--extraction-de-groupes-capturés)
    - [Exemple 3 : Vérification d'une adresse email](#exemple-3--vérification-dune-adresse-email)
5. [Conclusion](#conclusion)

## Introduction

`BASH_REMATCH` est une variable spéciale en Bash utilisée pour stocker les résultats des correspondances de motifs lors de l'utilisation des expressions régulières avec la commande `[[ ... ]]` et l'opérateur `=~`. Cette variable est particulièrement utile pour extraire des sous-chaînes ou des groupes capturés d'une chaîne de caractères.

## Fonctionnement de `BASH_REMATCH`

Lorsqu'une expression régulière avec des parenthèses de capture est utilisée dans une condition `[[ ... ]]`, les correspondances sont stockées dans la variable `BASH_REMATCH`. `BASH_REMATCH[0]` contient la chaîne complète correspondant au motif, et `BASH_REMATCH[1]`, `BASH_REMATCH[2]`, etc., contiennent les sous-chaînes correspondant aux groupes capturés.

## Syntaxe de l'utilisation de `BASH_REMATCH`

```bash
[[ string =~ regex ]]
```

### Variables

- `BASH_REMATCH[0]` : La chaîne complète correspondant au motif.
- `BASH_REMATCH[1]` : La première sous-chaîne capturée par les parenthèses.
- `BASH_REMATCH[2]` : La deuxième sous-chaîne capturée par les parenthèses.
- Et ainsi de suite...

## Exemples concrets

### Exemple 1 : Correspondance simple

Cet exemple montre comment vérifier si une chaîne contient un motif spécifique.

```bash
#!/bin/bash

string="Hello, World!"
regex="World"

if [[ $string =~ $regex ]]; then
    echo "Le motif '$regex' a été trouvé dans la chaîne '$string'."
    echo "Correspondance complète : '${BASH_REMATCH[0]}'"
fi
```

### Exemple 2 : Extraction de groupes capturés

Cet exemple montre comment utiliser des parenthèses pour capturer des parties spécifiques de la chaîne.

```bash
#!/bin/bash

string="Utilisateur: alice, ID: 12345"
regex="Utilisateur: ([a-zA-Z]+), ID: ([0-9]+)"

if [[ $string =~ $regex ]]; then
    echo "Utilisateur : ${BASH_REMATCH[1]}"
    echo "ID : ${BASH_REMATCH[2]}"
fi
```

### Exemple 3 : Vérification d'une adresse email

Cet exemple montre comment utiliser une expression régulière pour vérifier si une chaîne est une adresse email valide.

```bash
#!/bin/bash

email="exemple@example.com"
regex="^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$"

if [[ $email =~ $regex ]]; then
    echo "Adresse email valide : $email"
    echo "Nom d'utilisateur : ${BASH_REMATCH[1]}"
    echo "Domaine : ${BASH_REMATCH[2]}"
    echo "Extension : ${BASH_REMATCH[3]}"
else
    echo "Adresse email invalide."
fi
```

## Conclusion

La variable `BASH_REMATCH` est un outil puissant pour travailler avec des expressions régulières dans les scripts Bash. Elle permet de capturer et de manipuler facilement des sous-chaînes à partir de correspondances de motifs. En utilisant `BASH_REMATCH`, vous pouvez extraire des informations précises et effectuer des vérifications complexes sur des chaînes de caractères. Pour plus d'informations, consultez la documentation officielle de Bash ou utilisez `man bash` pour accéder aux pages de manuel.
