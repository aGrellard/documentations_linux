---
title: IFS
date: 2024-07-18
tags:
  - ressource
  - linux
  - bash
  - programmation
  - scripts
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour la variable `IFS` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la variable `IFS`](#fonctionnement-de-la-variable-ifs)
3. [Syntaxe de la variable `IFS`](#syntaxe-de-la-variable-ifs)
4. [Options et utilisation de la variable `IFS`](#options-et-utilisation-de-la-variable-ifs)
    - [Modification de `IFS`](#modification-de-ifs)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Séparation par des virgules](#exemple-1--séparation-par-des-virgules)
    - [Exemple 2 : Lecture d'un fichier ligne par ligne](#exemple-2--lecture-dun-fichier-ligne-par-ligne)
    - [Exemple 3 : Remplacement de l'espace par un autre séparateur](#exemple-3--remplacement-de-lespace-par-un-autre-séparateur)
6. [Conclusion](#conclusion)

## Introduction

`IFS` (Internal Field Separator) est une variable d'environnement spéciale en bash qui définit les caractères utilisés comme séparateurs de champs. Par défaut, `IFS` est constitué d'espaces, de tabulations et de nouvelles lignes. La modification de `IFS` permet de contrôler comment bash divise les chaînes de caractères en champs.

## Fonctionnement de la variable `IFS`

La variable `IFS` est utilisée par bash pour déterminer les délimiteurs entre les champs d'une chaîne de caractères. Cela est particulièrement utile pour lire et traiter des entrées de manière structurée.

## Syntaxe de la variable `IFS`

Pour définir ou modifier la variable `IFS`, vous pouvez utiliser la syntaxe suivante :

```bash
IFS="nouveaux_séparateurs"
```

Par exemple, pour définir `IFS` avec une virgule comme séparateur :

```bash
IFS=","
```

## Options et utilisation de la variable `IFS`

### Modification de `IFS`

Modifier `IFS` affecte la manière dont les chaînes sont divisées en champs. Voici quelques exemples d'utilisation :

- **Par défaut :**

  ```bash
  IFS=$' \t\n'
  ```

- **Utiliser une virgule comme séparateur :**

  ```bash
  IFS=","
  ```

- **Utiliser un deux-points comme séparateur :**

  ```bash
  IFS=":"
  ```

## Exemples concrets

### Exemple 1 : Séparation par des virgules

Supposons que vous ayez une chaîne de caractères avec des valeurs séparées par des virgules et que vous souhaitiez diviser cette chaîne en champs individuels.

```bash
#!/bin/bash

chaine="val1,val2,val3,val4"
IFS=","
read -ra champs <<< "$chaine"

for champ in "${champs[@]}"; do
    echo "$champ"
done
```

**Explication :**

- `IFS=","` : Définit la virgule comme séparateur.
- `read -ra champs <<< "$chaine"` : Lit la chaîne et la divise en champs basés sur le séparateur défini par `IFS`.
- `for champ in "${champs[@]}"` : Parcourt et affiche chaque champ.

### Exemple 2 : Lecture d'un fichier ligne par ligne

Utilisez `IFS` pour lire un fichier ligne par ligne.

```bash
#!/bin/bash

while IFS= read -r ligne; do
    echo "Ligne : $ligne"
done < fichier.txt
```

**Explication :**

- `IFS= read -r ligne` : Lit chaque ligne du fichier sans supprimer les espaces en début et en fin de ligne.
- `done < fichier.txt` : Lit les lignes de `fichier.txt`.

### Exemple 3 : Remplacement de l'espace par un autre séparateur

Changer le séparateur par défaut pour diviser une chaîne par des deux-points.

```bash
#!/bin/bash

chaine="val1:val2:val3:val4"
IFS=":"
read -ra champs <<< "$chaine"

for champ in "${champs[@]}"; do
    echo "$champ"
done
```

**Explication :**

- `IFS=":"` : Définit le deux-points comme séparateur.
- `read -ra champs <<< "$chaine"` : Lit la chaîne et la divise en champs basés sur le séparateur défini par `IFS`.
- `for champ in "${champs[@]}"` : Parcourt et affiche chaque champ.

## Conclusion

La variable `IFS` est un outil puissant pour contrôler la manière dont les chaînes de caractères sont divisées en champs dans les scripts bash. En modifiant `IFS`, vous pouvez adapter la lecture et le traitement des entrées de manière plus flexible et structurée. Pour des informations supplémentaires, consultez les pages de manuel en utilisant la commande `man bash` ou la documentation officielle de votre distribution Linux.