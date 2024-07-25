---
title: crontab
date: 2024-07-18
tags:
  - ressource
  - templates
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour `crontab` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de `crontab`](#fonctionnement-de-crontab)
3. [Syntaxe de `crontab`](#syntaxe-de-crontab)
4. [Options de `crontab`](#options-de-crontab)
    - [Option `-e` (edit)](#option--e-edit)
    - [Option `-l` (list)](#option--l-list)
    - [Option `-r` (remove)](#option--r-remove)
    - [Option `-u` (user)](#option--u-user)
5. [Structure d'une ligne `crontab`](#structure-dune-ligne-crontab)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Exécuter un script chaque jour à 2h du matin](#exemple-1--exécuter-un-script-chaque-jour-à-2h-du-matin)
    - [Exemple 2 : Exécuter une commande toutes les 5 minutes](#exemple-2--exécuter-une-commande-toutes-les-5-minutes)
    - [Exemple 3 : Exécuter un script chaque lundi à 7h](#exemple-3--exécuter-un-script-chaque-lundi-à-7h)
    - [Exemple 4 : Liste des tâches cron](#exemple-4--liste-des-tâches-cron)
    - [Exemple 5 : Supprimer toutes les tâches cron pour un utilisateur](#exemple-5--supprimer-toutes-les-tâches-cron-pour-un-utilisateur)
7. [Conclusion](#conclusion)

## Introduction

La commande `crontab` sous Linux est utilisée pour gérer les tâches planifiées (cron jobs). Un cron job est une tâche qui est exécutée à des intervalles de temps réguliers, comme l'exécution d'un script ou d'une commande à une heure spécifique chaque jour.

## Fonctionnement de `crontab`

`crontab` permet aux utilisateurs de créer, modifier, afficher, et supprimer leurs propres listes de tâches planifiées. Chaque utilisateur peut avoir son propre fichier `crontab` personnel.

## Syntaxe de `crontab`

```bash
crontab [options] [fichier]
```

### Arguments

- `[fichier]` : Le fichier contenant les tâches cron à installer. Si ce fichier n'est pas spécifié, `crontab` ouvre l'éditeur par défaut pour modifier le fichier crontab.

## Options de `crontab`

### Option `-e` (edit)

Ouvre le fichier `crontab` actuel dans l'éditeur par défaut pour le modifier.

```bash
crontab -e
```

### Option `-l` (list)

Affiche le contenu du fichier `crontab` actuel.

```bash
crontab -l
```

### Option `-r` (remove)

Supprime le fichier `crontab` actuel pour l'utilisateur.

```bash
crontab -r
```

### Option `-u` (user)

Spécifie l'utilisateur pour les commandes `crontab`. Doit être utilisé par le superutilisateur pour manipuler le `crontab` d'autres utilisateurs.

```bash
crontab -u utilisateur [option]
```

## Structure d'une ligne `crontab`

Chaque ligne d'un fichier `crontab` représente une tâche planifiée et a la structure suivante :

```
* * * * * commande à exécuter
- - - - -
| | | | |
| | | | +---- Jour de la semaine (0 - 7) (Dimanche = 0 ou 7)
| | | +------ Mois (1 - 12)
| | +-------- Jour du mois (1 - 31)
| +---------- Heure (0 - 23)
+------------ Minute (0 - 59)
```

## Exemples concrets

### Exemple 1 : Exécuter un script chaque jour à 2h du matin

Pour exécuter `/chemin/vers/script.sh` chaque jour à 2h du matin :

```bash
0 2 * * * /chemin/vers/script.sh
```

### Exemple 2 : Exécuter une commande toutes les 5 minutes

Pour exécuter `commande` toutes les 5 minutes :

```bash
*/5 * * * * commande
```

### Exemple 3 : Exécuter un script chaque lundi à 7h

Pour exécuter `/chemin/vers/script.sh` chaque lundi à 7h du matin :

```bash
0 7 * * 1 /chemin/vers/script.sh
```

### Exemple 4 : Liste des tâches cron

Pour afficher les tâches cron actuelles de l'utilisateur :

```bash
crontab -l
```

### Exemple 5 : Supprimer toutes les tâches cron pour un utilisateur

Pour supprimer toutes les tâches cron pour l'utilisateur courant :

```bash
crontab -r
```

Pour supprimer toutes les tâches cron pour un utilisateur spécifique (doit être exécuté par le superutilisateur) :

```bash
sudo crontab -u utilisateur -r
```

## Conclusion

La commande `crontab` est un outil puissant pour planifier des tâches récurrentes sous Linux. Elle permet d'automatiser l'exécution de scripts et de commandes à des intervalles de temps définis, ce qui est essentiel pour la maintenance du système, les sauvegardes, et d'autres tâches administratives. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man crontab` ou la documentation officielle de votre distribution Linux.