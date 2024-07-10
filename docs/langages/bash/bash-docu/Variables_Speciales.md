---
title: Variables_Speciales
tags:
  - ressource
  - bash
  - linux
  - programmation
  - scripts
  - templates
status:
  - En cours
type de note:
  - ressource
date: 2024-07-10
---
# bash Variables Spéciales
- [bash Variables Spéciales](#bash-variables-spéciales)
  - [Informations sur le Script et l'Environnement](#informations-sur-le-script-et-lenvironnement)
  - [Informations sur l'Utilisateur](#informations-sur-lutilisateur)
  - [Gestion des Processus](#gestion-des-processus)
  - [Arguments et Paramètres](#arguments-et-paramètres)
  - [Contrôle de Flux et État](#contrôle-de-flux-et-état)
  - [Divers](#divers)


## Informations sur le Script et l'Environnement

- ### **`$0`** : Le nom du script ou de la commande exécutée.
- ### **`$BASH_VERSION`** : La version du Bash exécutant le script.
- ### **`$BASH_VERSINFO`** : Un tableau contenant des informations de version détaillées sur Bash.
- ### **`$HOSTNAME`** : Le nom d'hôte de la machine sur laquelle le script est exécuté.
- ### **`$LANG`** : La configuration de langue courante, affectant la localisation.
- ### **`$OSTYPE`** : Une description du système d'exploitation sur lequel Bash est exécuté.
- ### **`$PATH`** : Les chemins des répertoires où Bash cherche les commandes exécutables.
- ### **`$PWD`** : Le répertoire de travail actuel.
- ### **`$OLDPWD`** : Le précédent répertoire de travail.
- ### **`$SHLVL`** : Le niveau de l'interpréteur de commandes.
- ### **`$TERM`** : Le type de terminal utilisé pour l'exécution du script.

## Informations sur l'Utilisateur

- ### **`$HOME`** : Le chemin du répertoire personnel de l'utilisateur courant.
- ### **`$UID`** : L'ID utilisateur du processus courant.
- ### **`$EUID`** : L'ID utilisateur effectif du processus courant.
- ### **`$GROUPS`** : Un tableau contenant la liste des groupes auxquels appartient l'utilisateur courant.

## Gestion des Processus

- ### **`$$`** : Le PID du script en cours d'exécution.
- ### **`$!`** : Le PID du dernier processus exécuté en arrière-plan.
- ### **`$PPID`** : Le PID du processus parent du script courant.

## Arguments et Paramètres

- ### **`$1 ... $9`**, **`${10} ... ${N}`** : Les arguments passés au script.
- ### **`$#`** : Le nombre d'arguments passés au script.
- ### **`$*`**, **`$@`** : Tous les arguments passés au script. `$@` est préférable lorsque vous voulez traiter chaque argument séparément dans les guillemets.

## Contrôle de Flux et État

- ### **`$?`** : Le statut de sortie de la dernière commande exécutée.
- ### **`$-`** : Les options actuelles définies pour le shell.
- ### **`$IFS`** : Le séparateur de champs internes, utilisé pour diviser les lignes en mots.

## Divers

- ### **`$LINENO`** : Le numéro de la ligne courante dans le script Bash, utile pour le débogage.
- ### **`$RANDOM`** : Génère un nombre aléatoire entre 0 et 32767.
- ### **`$SECONDS`** : Le nombre de secondes depuis que le script a été lancé.
- ### **`$REPLY`** : La dernière chaîne lue par la commande `read` lorsque aucune variable n'est fournie.
- ### **`$HISTSIZE`**, **`$HISTFILESIZE`** : Gèrent respectivement le nombre de commandes à conserver dans l'historique et la taille du fichier d'historique.
