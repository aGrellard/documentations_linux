---
title: tableaux associatifs
date: 2024-07-19
tags:
  - ressource
  - bash
  - linux
  - scripts
  - programmation
status:
  - En cours
  - Complété
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[Tableaux]]"
---
# Documentation pour les tableaux associatifs sous Linux

## Table des matières
1. [Introduction](#introduction)

2. [Fonctionnement des tableaux associatifs](#fonctionnement-des-tableaux-associatifs)
3. [Syntaxe des tableaux associatifs](#syntaxe-des-tableaux-associatifs)
4. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Déclaration et utilisation de base](#exemple-1--déclaration-et-utilisation-de-base)
    - [Exemple 2 : Parcourir un tableau associatif](#exemple-2--parcourir-un-tableau-associatif)
    - [Exemple 3 : Utilisation de tableaux associatifs pour stocker des paires clé-valeur](#exemple-3--utilisation-de-tableaux-associatifs-pour-stocker-des-paires-clé-valeur)
5. [Conclusion](#conclusion)

## Introduction

Les tableaux associatifs en Bash sont des structures de données qui permettent de stocker des paires clé-valeur. Contrairement aux tableaux indexés traditionnels où les indices sont des entiers, les clés des tableaux associatifs peuvent être des chaînes de caractères. Cela permet une manipulation plus flexible et intuitive des données.

## Fonctionnement des tableaux associatifs

Les tableaux associatifs sont disponibles dans Bash version 4.0 et ultérieure. Ils permettent d'associer des valeurs à des clés, facilitant ainsi la gestion des ensembles de données complexes. Les tableaux associatifs sont déclarés et utilisés de manière différente par rapport aux tableaux indexés traditionnels.

## Syntaxe des tableaux associatifs

### Déclaration d'un tableau associatif

```bash
declare -A nom_du_tableau
```

### Affectation de valeurs

```bash
nom_du_tableau[clé]="valeur"
```

### Accès aux valeurs

```bash
echo "${nom_du_tableau[clé]}"
```

### Suppression d'un élément

```bash
unset nom_du_tableau[clé]
```

### Affichage de toutes les clés

```bash
echo "${!nom_du_tableau[@]}"
```

### Affichage de toutes les valeurs

```bash
echo "${nom_du_tableau[@]}"
```

## Exemples concrets

### Exemple 1 : Déclaration et utilisation de base

Cet exemple montre comment déclarer un tableau associatif, y ajouter des éléments et accéder à ces éléments.

```bash
#!/bin/bash

# Déclaration du tableau associatif
declare -A capitales

# Ajout d'éléments
capitales[France]="Paris"
capitales[Espagne]="Madrid"
capitales[Italie]="Rome"

# Accès aux éléments
echo "La capitale de la France est : ${capitales[France]}"
echo "La capitale de l'Espagne est : ${capitales[Espagne]}"
echo "La capitale de l'Italie est : ${capitales[Italie]}"
```

### Exemple 2 : Parcourir un tableau associatif

Cet exemple montre comment parcourir un tableau associatif pour afficher toutes les clés et leurs valeurs associées.

```bash
#!/bin/bash

# Déclaration du tableau associatif
declare -A capitales

# Ajout d'éléments
capitales[France]="Paris"
capitales[Espagne]="Madrid"
capitales[Italie]="Rome"

# Parcourir et afficher les clés et valeurs
for pays in "${!capitales[@]}"; do
    echo "La capitale de $pays est : ${capitales[$pays]}"
done
```

### Exemple 3 : Utilisation de tableaux associatifs pour stocker des paires clé-valeur

Cet exemple montre comment utiliser des tableaux associatifs pour stocker et récupérer des informations plus complexes.

```bash
#!/bin/bash

# Déclaration du tableau associatif
declare -A contacts

# Ajout d'éléments
contacts[John]="john.doe@example.com"
contacts[Jane]="jane.doe@example.com"
contacts[Bob]="bob.smith@example.com"

# Accès aux éléments
echo "L'adresse email de John est : ${contacts[John]}"
echo "L'adresse email de Jane est : ${contacts[Jane]}"
echo "L'adresse email de Bob est : ${contacts[Bob]}"
```

## Conclusion

Les tableaux associatifs en Bash offrent une manière flexible et puissante de gérer des ensembles de données complexes. En permettant l'utilisation de chaînes de caractères comme clés, ils facilitent l'organisation et l'accès aux données. Pour plus d'informations sur les tableaux associatifs et d'autres fonctionnalités de Bash, consultez la documentation officielle ou utilisez `man bash`.