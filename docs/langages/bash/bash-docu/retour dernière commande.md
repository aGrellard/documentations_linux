---
title: retour dernière commande
date: 2024-07-27
tags:
  - ressource
status:
  - Complété
type de note:
  - ressource
---
# Documentation pour `$?` en Bash sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de `$?`](#fonctionnement-de-)
3. [Syntaxe de `$?`](#syntaxe-de-)
4. [Utilisation de `$?`](#utilisation-de-)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Vérification du succès d'une commande](#exemple-1--vérification-du-succès-dune-commande)
    - [Exemple 2 : Conditions basées sur le code de retour](#exemple-2--conditions-basées-sur-le-code-de-retour)

    - [Exemple 3 : Boucle avec vérification du code de retour](#exemple-3--boucle-avec-vérification-du-code-de-retour)
6. [Conclusion](#conclusion)

## Introduction

En Bash, la variable spéciale `$?` contient le code de retour de la dernière commande exécutée. Cette valeur est utilisée pour vérifier si une commande s'est terminée avec succès ou si elle a échoué, et peut être exploitée dans les scripts pour contrôler le flux d'exécution.

## Fonctionnement de `$?`

La variable `$?` est automatiquement mise à jour après l'exécution de chaque commande. Elle contient le code de retour de cette commande, qui est généralement `0` si la commande a réussi et un nombre différent de zéro si la commande a échoué. Les codes de retour spécifiques peuvent varier en fonction de la commande exécutée.

## Syntaxe de `$?`

La syntaxe pour utiliser `$?` est simplement de l'inclure dans un script ou une commande pour vérifier le code de retour de la commande précédente.

```bash
command
echo $?
```

## Utilisation de `$?`

### Vérification du succès ou de l'échec

La valeur de `$?` peut être utilisée pour déterminer si une commande s'est terminée correctement. Une valeur de `0` indique un succès, tandis qu'une valeur différente de zéro indique une erreur.

### Conditions et boucles

Vous pouvez utiliser `$?` dans des structures conditionnelles et des boucles pour exécuter différentes actions en fonction du résultat de la commande précédente.

## Exemples concrets

### Exemple 1 : Vérification du succès d'une commande

```bash
#!/bin/bash
ls /home/user
if [ $? -eq 0 ]; then
    echo "Commande réussie."
else
    echo "Commande échouée."
fi
```

**Explication :** Ce script exécute la commande `ls` pour lister le contenu du répertoire `/home/user`. Ensuite, il vérifie la valeur de `$?`. Si la commande a réussi (code de retour `0`), il affiche "Commande réussie". Sinon, il affiche "Commande échouée".

### Exemple 2 : Conditions basées sur le code de retour

```bash
#!/bin/bash
mkdir /home/user/newdir
if [ $? -ne 0 ]; then
    echo "Échec de la création du répertoire."
else
    echo "Répertoire créé avec succès."
fi
```

**Explication :** Ce script tente de créer un répertoire `/home/user/newdir`. Il vérifie ensuite si la commande a échoué (code de retour différent de `0`). Si la création du répertoire échoue, il affiche un message d'erreur.

### Exemple 3 : Boucle avec vérification du code de retour

```bash
#!/bin/bash
for file in /path/to/files/*; do
    cp "$file" /path/to/backup/
    if [ $? -ne 0 ]; then
        echo "Échec de la copie de $file."
    else
        echo "$file copié avec succès."
    fi
done
```

**Explication :** Ce script parcourt tous les fichiers dans `/path/to/files/` et les copie dans `/path/to/backup/`. Après chaque tentative de copie, il vérifie le code de retour de `cp` pour déterminer si la copie a réussi ou échoué.

## Conclusion

La variable spéciale `$?` en Bash est un outil essentiel pour vérifier le statut de la dernière commande exécutée. En utilisant `$?`, vous pouvez contrôler le flux d'exécution de vos scripts en fonction du succès ou de l'échec des commandes. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man bash` ou la documentation officielle de Bash.