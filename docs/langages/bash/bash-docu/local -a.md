---
title: local -a
date: 2024-07-18
tags:
  - ressource
  - linux
  - bash
  - programmation
  - scripts
status:
  - En cours
  - Complété
type de note:
  - ressource
---
# Documentation pour `local -a` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de `local -a`](#fonctionnement-de-local--a)
3. [Syntaxe de la fonction `local -a`](#syntaxe-de-la-fonction-local--a)
4. [Options de la fonction `local`](#options-de-la-fonction-local)
    - [Option `-a`](#option--a)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Déclaration d'un tableau local](#exemple-1--déclaration-dun-tableau-local)
    - [Exemple 2 : Utilisation du tableau local dans une fonction](#exemple-2--utilisation-du-tableau-local-dans-une-fonction)
6. [Conclusion](#conclusion)

## Introduction

La commande `local` en bash est utilisée pour créer des variables locales à l'intérieur d'une fonction. L'option `-a` permet de déclarer une variable comme étant un tableau. Cette documentation explique comment utiliser `local -a` pour déclarer et manipuler des tableaux locaux dans les scripts bash.

## Fonctionnement de `local -a`

`local -a` permet de créer des tableaux locaux à l'intérieur des fonctions bash. Les variables déclarées avec `local` sont limitées à la portée de la fonction et ne sont pas accessibles en dehors de celle-ci. Cela aide à éviter les conflits de variables et à améliorer la modularité des scripts.

## Syntaxe de la fonction `local -a`

```bash
local -a nom_tableau
```

### Arguments

- `nom_tableau` : Le nom du tableau à déclarer localement.

## Options de la fonction `local`

### Option `-a`

L'option `-a` spécifie que la variable déclarée doit être un tableau.

#### Utilisation

```bash
local -a nom_tableau
```

## Exemples concrets

### Exemple 1 : Déclaration d'un tableau local

Ce premier exemple montre comment déclarer un tableau local dans une fonction et y ajouter des éléments.

```bash
#!/bin/bash

ma_fonction() {
    local -a mon_tableau
    mon_tableau=("élément1" "élément2" "élément3")
    echo "Les éléments du tableau sont : ${mon_tableau[@]}"
}

ma_fonction
```

**Explication :**

- `local -a mon_tableau` : Déclare `mon_tableau` comme un tableau local.
- `mon_tableau=("élément1" "élément2" "élément3")` : Initialise le tableau avec trois éléments.
- `echo "Les éléments du tableau sont : ${mon_tableau[@]}"` : Affiche tous les éléments du tableau.

### Exemple 2 : Utilisation du tableau local dans une fonction

Ce deuxième exemple montre comment utiliser un tableau local pour stocker et manipuler des données dans une fonction.

```bash
#!/bin/bash

traiter_donnees() {
    local -a donnees
    donnees=("Alice" "Bob" "Charlie")
    
    for nom in "${donnees[@]}"; do
        echo "Bonjour, $nom!"
    done
}

traiter_donnees
```

**Explication :**

- `local -a donnees` : Déclare `donnees` comme un tableau local.
- `donnees=("Alice" "Bob" "Charlie")` : Initialise le tableau avec trois noms.
- `for nom in "${donnees[@]}"; do echo "Bonjour, $nom!"; done` : Parcourt le tableau et affiche un message pour chaque nom.

## Conclusion

L'utilisation de `local -a` pour déclarer des tableaux locaux dans les fonctions bash est une pratique efficace pour maintenir la modularité et éviter les conflits de variables. Cette commande permet de manipuler des ensembles de données de manière structurée à l'intérieur des fonctions, facilitant ainsi la gestion des scripts complexes. Pour plus de détails sur les options et les utilisations avancées, consultez la documentation officielle de bash en utilisant `man bash` ou d'autres ressources en ligne.