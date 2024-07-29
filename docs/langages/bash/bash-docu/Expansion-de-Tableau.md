---
title: Expansion de Tableau
date: 2024-07-10
tags:
  - ressource
status:
  - Complété
type de note:
  - ressource
source:
  - chatgpt
---

# Expansion de Tableau

---

## Introduction

L'expansion de tableau est une fonctionnalité puissante des shells Unix/Linux qui permet de manipuler et itérer sur les éléments d'un tableau (array). Cette documentation détaillée explique comment l'utiliser, avec des exemples concrets.

---

## Installation

Aucune installation spécifique n'est nécessaire pour utiliser l'expansion de tableau. Cette fonctionnalité est intégrée dans les shells comme Bash, qui est généralement préinstallé sur les distributions Linux.

---

## Fonctionnement de l'Expansion de Tableau

### Comment cela fonctionne

Les tableaux en Bash permettent de stocker plusieurs valeurs dans une seule variable. L'expansion de tableau permet de référencer, manipuler et itérer sur ces valeurs de manière flexible.

### Syntaxe de la Fonction avec des Exemples

#### Déclaration d'un Tableau

```sh
# Déclaration d'un tableau avec des valeurs
my_array=(valeur1 valeur2 valeur3)

# Accéder à un élément du tableau
echo ${my_array[0]}  # Affiche "valeur1"
```

#### Longueur d'un Tableau

```sh
# Déclaration d'un tableau avec des valeurs
my_array=(valeur1 valeur2 valeur3)

# Afficher la longueur du tableau
echo ${#my_array[@]}  # Affiche "3"
```

#### Accès à Tous les Éléments

```sh
# Déclaration d'un tableau avec des valeurs
my_array=(valeur1 valeur2 valeur3)

# Afficher tous les éléments du tableau
echo ${my_array[@]}  # Affiche "valeur1 valeur2 valeur3"
```

---

## Options de l'Expansion de Tableau

### Liste des Options et leur Utilisation

#### Expansion de Tous les Éléments

- **${tableau[@]}** : Expansion de tous les éléments du tableau.

```sh
# Déclaration d'un tableau avec des valeurs
my_array=(valeur1 valeur2 valeur3)

# Afficher tous les éléments du tableau
for element in "${my_array[@]}"; do
  echo $element
done
```

#### Expansion d'un Sous-ensemble

- **${tableau[@]:début:nombre}** : Expansion d'un sous-ensemble d'éléments du tableau à partir de l'index `début` sur `nombre` d'éléments.

```sh
# Déclaration d'un tableau avec des valeurs
my_array=(valeur1 valeur2 valeur3 valeur4 valeur5)

# Afficher un sous-ensemble des éléments du tableau
echo ${my_array[@]:1:3}  # Affiche "valeur2 valeur3 valeur4"
```

#### Expansion des Indices

- **${!tableau[@]}** : Expansion des indices du tableau.

```sh
# Déclaration d'un tableau avec des valeurs
my_array=(valeur1 valeur2 valeur3)

# Afficher les indices du tableau
echo ${!my_array[@]}  # Affiche "0 1 2"
```

---

## Exemples Concrets et Explications

### Itération sur un Tableau

```sh
#!/bin/bash

# Déclaration d'un tableau avec des valeurs
fruits=("Pomme" "Banane" "Cerise")

# Itérer sur chaque élément du tableau
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done
```
Cet exemple montre comment itérer sur chaque élément d'un tableau et afficher sa valeur.

### Manipulation de Sous-ensembles

```sh
#!/bin/bash

# Déclaration d'un tableau avec des valeurs
numbers=(1 2 3 4 5 6 7 8 9 10)

# Afficher un sous-ensemble du tableau
subset=${numbers[@]:3:4}
echo "Sous-ensemble: ${subset[@]}"
```
Cet exemple extrait et affiche un sous-ensemble de 4 éléments à partir du 4ème élément du tableau `numbers`.

### Utilisation des Indices

```sh
#!/bin/bash

# Déclaration d'un tableau avec des valeurs
colors=("Rouge" "Vert" "Bleu")

# Afficher chaque élément avec son indice
for index in ${!colors[@]}; do
  echo "Indice $index : ${colors[$index]}"
done
```
Cet exemple affiche chaque élément d'un tableau avec son indice respectif.

---

## Références

Pour plus de détails, vous pouvez consulter les ressources suivantes :
- [Guide Bash sur l'Expansion de Paramètres](https://tldp.org/LDP/abs/html/parameter-expansion.html)
- [Guide avancé de Bash Scripting](https://www.gnu.org/software/bash/manual/html_node/Arrays.html)
- [Documentation officielle de Bash](https://www.gnu.org/software/bash/manual/bash.html#Arrays)

---

Cette documentation devrait vous fournir une base solide pour utiliser l'expansion de tableau dans vos scripts shell sous Linux.