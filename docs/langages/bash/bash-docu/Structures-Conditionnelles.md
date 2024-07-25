---
title: Structures-Conditionnelles
tags:
  - ressource
  - bash
  - programmation
  - scripts
  - linux
status:
  - En cours
type de note:
  - ressource
date: 2024-07-10
source:
  - chatgpt
---

# Les Structures Conditionnelles en Bash

Les structures conditionnelles permettent de contrôler le flux d'exécution des scripts Bash en fonction de l'évaluation de conditions. Bash offre plusieurs structures pour gérer la logique conditionnelle, notamment `if`, `else`, `elif`, et `case`. Cette documentation détaille l'utilisation de ces structures pour écrire des scripts flexibles et efficaces.

## La Structure `if`

La structure `if` évalue une condition et exécute un bloc de commandes si la condition est vraie.

### Syntaxe

```bash
if [ condition ]; then
  # Commandes à exécuter si la condition est vraie
fi
```

### Exemple

```bash
if [ $a -gt $b ]; then
  echo "$a est plus grand que $b."
fi
```

## La Structure `if`...`else`

`else` permet d'exécuter un autre bloc de commandes si la condition `if` est fausse.

### Syntaxe

```bash
if [ condition ]; then
  # Commandes si la condition est vraie
else
  # Commandes si la condition est fausse
fi
```

### Exemple

```bash
if [ $a -eq $b ]; then
  echo "$a est égal à $b."
else
  echo "$a n'est pas égal à $b."
fi
```

## La Structure `if`...`elif`...`else`

`elif` (else if) permet de tester une série de conditions les unes après les autres.

### Syntaxe

```bash
if [ condition1 ]; then
  # Commandes si condition1 est vraie
elif [ condition2 ]; then
  # Commandes si condition2 est vraie
else
  # Commandes si aucune des conditions précédentes n'est vraie
fi
```

### Exemple

```bash
if [ $a -gt $b ]; then
  echo "$a est plus grand que $b."
elif [ $a -eq $b ]; then
  echo "$a est égal à $b."
else
  echo "$a est moins grand que $b."
fi
```

## La Structure `case`

La structure `case` simplifie la gestion de conditions multiples basées sur des valeurs spécifiques.

### Syntaxe

```bash
case $variable in
  pattern1)
    # Commandes pour pattern1
    ;;
  pattern2)
    # Commandes pour pattern2
    ;;
  *)
    # Commandes par défaut
    ;;
esac
```

### Exemple

```bash
case $reponse in
  oui)
    echo "Vous avez répondu oui."
    ;;
  non)
    echo "Vous avez répondu non."
    ;;
  *)
    echo "Réponse non reconnue."
    ;;
esac
```

## Conseils et Meilleures Pratiques

- **Quotation** : Utilisez toujours des guillemets autour des variables dans les conditions pour gérer correctement les chaînes vides ou contenant des espaces.
- **`[[ ]]` vs `[ ]`** : Préférez l'utilisation de `[[ ]]` pour les tests, car cela offre une syntaxe plus riche, incluant le support des expressions régulières.
- **Évitez d'abuser des structures conditionnelles complexes** : Des scripts avec trop de conditions imbriquées peuvent devenir difficiles à lire et à maintenir. Envisagez de refactoriser ou d'utiliser des fonctions.
