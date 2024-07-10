

- [`useradd`](#useradd)
  - [Syntaxe](#syntaxe)
  - [Options principales](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Création d'un utilisateur standard sans options spécifiqu](#1-création-dun-utilisateur-standard-sans-options-spécifiqu)
  - [2. Création d'un utilisateur avec un répertoire personnel spécifique](#2-création-dun-utilisateur-avec-un-répertoire-personnel-spécifique)
  - [3. Création d'un utilisateur et création de son répertoire personnel si celui-ci n'existe pas](#3-création-dun-utilisateur-et-création-de-son-répertoire-personnel-si-celui-ci-nexiste-pas)
  - [4. Création d'un utilisateur avec un shell spécifique](#4-création-dun-utilisateur-avec-un-shell-spécifique)
  - [5. Création d'un utilisateur avec un GID spécifique](#5-création-dun-utilisateur-avec-un-gid-spécifique)
  - [6. Ajout d'un utilisateur à des groupes supplémentaires](#6-ajout-dun-utilisateur-à-des-groupes-supplémentaires)
  - [7. Création d'un utilisateur avec un UID spécifique](#7-création-dun-utilisateur-avec-un-uid-spécifique)
  - [8. Définition d'une date d'expiration pour le compte](#8-définition-dune-date-dexpiration-pour-le-compte)
  - [9. Définition du nombre de jours d'inactivité après expiration du mot de passe](#9-définition-du-nombre-de-jours-dinactivité-après-expiration-du-mot-de-passe)
  - [10. Création d'un utilisateur avec un mot de passe initial (à utiliser avec prudence)](#10-création-dun-utilisateur-avec-un-mot-de-passe-initial-à-utiliser-avec-prudence)
- [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
  - [1. **Création d'un nouvel employé dans le système**:](#1-création-dun-nouvel-employé-dans-le-système)
  - [2. **Ajout d'un utilisateur pour un service spécifique sans répertoire personnel**:](#2-ajout-dun-utilisateur-pour-un-service-spécifique-sans-répertoire-personnel)
  - [3. **Configuration d'un compte utilisateur temporaire**:](#3-configuration-dun-compte-utilisateur-temporaire)
  - [4. **Création d'un utilisateur pour des tests avec un UID et GID spécifiques**:](#4-création-dun-utilisateur-pour-des-tests-avec-un-uid-et-gid-spécifiques)
- [Cas d'utilisation supplémentaires pour `useradd`](#cas-dutilisation-supplémentaires-pour-useradd)
  - [1. **Création d'un compte pour un nouvel employé avec configuration complète**:](#1-création-dun-compte-pour-un-nouvel-employé-avec-configuration-complète)
  - [2. **Ajout d'un utilisateur système pour une application**:](#2-ajout-dun-utilisateur-système-pour-une-application)
  - [3. **Configuration d'un compte utilisateur avec expiration**:](#3-configuration-dun-compte-utilisateur-avec-expiration)
  - [4. **Création d'un compte avec un UID spécifique**:](#4-création-dun-compte-avec-un-uid-spécifique)
  - [5. **Ajout d'un compte sans répertoire personnel**:](#5-ajout-dun-compte-sans-répertoire-personnel)
  - [6. **Configuration d'un compte avec un shell spécifique**:](#6-configuration-dun-compte-avec-un-shell-spécifique)
  - [7. **Création d'un compte avec un mot de passe prédéfini**:](#7-création-dun-compte-avec-un-mot-de-passe-prédéfini)
  - [8. **Création d'un compte pour un utilisateur avec des groupes supplémentaires**:](#8-création-dun-compte-pour-un-utilisateur-avec-des-groupes-supplémentaires)
  - [9. **Création d'un compte qui empêche l'utilisateur de se connecter au serveur et répertoire home**:](#9-création-dun-compte-qui-empêche-lutilisateur-de-se-connecter-au-serveur-et-répertoire-home)



La commande `useradd` est une commande de base dans les systèmes Unix et Linux, utilisée pour créer un nouvel utilisateur sur le système. Elle permet de configurer les paramètres initiaux d'un compte utilisateur, tels que le répertoire personnel, le shell de connexion, et le groupe d'utilisateurs.

# `useradd`

## Syntaxe
```
useradd [options] USERNAME
```

## Options principales

- `-d, --home HOME_DIR`: Spécifie le répertoire personnel de l'utilisateur à créer. Si cette option n'est pas utilisée, un répertoire par défaut sera créé selon la configuration du système (souvent `/home/USERNAME`).
- `-m, --create-home`: Crée le répertoire personnel de l'utilisateur s'il n'existe pas déjà.
- `-s, --shell SHELL`: Définit le shell de l'utilisateur. Si cette option n'est pas spécifiée, le shell par défaut défini dans `/etc/default/useradd` ou `/etc/login.defs` sera utilisé.
- `-g, --gid GROUP`: Spécifie le groupe initial de l'utilisateur. Ce peut être soit un nom de groupe soit un numéro d'identifiant de groupe (GID).
- `-G, --groups GROUPS`: Liste de groupes supplémentaires auxquels l'utilisateur sera ajouté. Les groupes sont séparés par des virgules sans espaces.
- `-u, --uid UID`: Définit l'identifiant de l'utilisateur (UID). Si cette option n'est pas utilisée, un UID unique est automatiquement attribué.
- `-e, --expiredate EXPIRE_DATE`: Définit la date d'expiration du compte. Le format doit être AAAA-MM-JJ.
- `-f, --inactive INACTIVE`: Nombre de jours après l'expiration du mot de passe pendant lesquels le compte sera considéré comme inactif et sera désactivé.
- `-p, --password PASSWORD`: Utilisez cette option avec prudence, car exécuter cette commande avec une option visible dans l'historique du shell peut être un risque de sécurité. Il est recommandé de configurer le mot de passe après la création du compte à l'aide de la commande `passwd`.

# Exemples d'utilisation

## 1. Création d'un utilisateur standard sans options spécifiqu
   ```bash
   useradd username
   ```
   
## 2. Création d'un utilisateur avec un répertoire personnel spécifique
   ```bash
   useradd -d /opt/username username
   ```
   
## 3. Création d'un utilisateur et création de son répertoire personnel si celui-ci n'existe pas
   ```bash
   useradd -m username
   ```
   
## 4. Création d'un utilisateur avec un shell spécifique
   ```bash
   useradd -s /bin/zsh username
   ```
   
## 5. Création d'un utilisateur avec un GID spécifique
   ```bash
   useradd -g users username
   ```
   
## 6. Ajout d'un utilisateur à des groupes supplémentaires
   ```bash
   useradd -G wheel,sudo username
   ```
   
## 7. Création d'un utilisateur avec un UID spécifique
   ```bash
   useradd -u 1001 username
   ```
   
## 8. Définition d'une date d'expiration pour le compte
   ```bash
   useradd -e 2024-12-31 username
   ```
   
## 9. Définition du nombre de jours d'inactivité après expiration du mot de passe
   ```bash
   useradd -f 30 username
   ```
   
## 10. Création d'un utilisateur avec un mot de passe initial (à utiliser avec prudence)
    ```bash
    useradd -p $(openssl passwd -crypt 'password') username
    ```

# Cas d'utilisation de la fonction

## 1. **Création d'un nouvel employé dans le système**:
   ```bash
   useradd -m -s /bin/bash -g staff -G sudo,developers newemployee
   ```
   
## 2. **Ajout d'un utilisateur pour un service spécifique sans répertoire personnel**:
   ```bash
   useradd -r -s /usr/sbin/nologin serviceuser
   ```
   
## 3. **Configuration d'un compte utilisateur temporaire**:
   ```bash
   useradd -m -e 2024-06-30 -s /bin/bash tempuser
   ```
   
## 4. **Création d'un utilisateur pour des tests avec un UID et GID spécifiques**:
   ```bash
   useradd -u 2001 -g testgroup testuser
   ```

Voici des cas d'utilisation supplémentaires pour `useradd`, illustrant comment cette commande peut être employée pour répondre à différents besoins lors de la création de comptes utilisateurs sur des systèmes Unix et Linux.

# Cas d'utilisation supplémentaires pour `useradd`

## 1. **Création d'un compte pour un nouvel employé avec configuration complète**:
   Lors de l'ajout d'un nouvel employé au système, il peut être nécessaire de configurer son compte avec un répertoire personnel, un shell spécifique, et de l'ajouter à des groupes pertinents.
   ```bash
   useradd -m -s /bin/bash -g staff -G developers,marketing newemployee
   ```
   Cela crée un compte pour `newemployee`, avec un répertoire personnel, le shell Bash, et l'ajoute aux groupes `staff`, `developers`, et `marketing`.

## 2. **Ajout d'un utilisateur système pour une application**:
   Les applications peuvent nécessiter des comptes système spécifiques sans accès shell pour des questions de sécurité.
   ```bash
   useradd -r -s /usr/sbin/nologin -d /opt/appdir appuser
   ```
   Ceci crée un compte système `appuser` sans accès shell et avec `/opt/appdir` comme répertoire personnel.

## 3. **Configuration d'un compte utilisateur avec expiration**:
   Pour un stagiaire ou un collaborateur temporaire, il peut être pratique de définir une date d'expiration pour le compte dès sa création.
   ```bash
   useradd -m -e 2024-12-31 tempuser
   ```
   Cela crée un compte pour `tempuser` qui expirera automatiquement à la fin de l'année 2024.

## 4. **Création d'un compte avec un UID spécifique**:
   Dans certains cas, il peut être nécessaire d'attribuer un UID spécifique à un utilisateur pour des besoins de compatibilité ou de sécurité.
   ```bash
   useradd -u 1050 specificuser
   ```
   Ceci crée un compte `specificuser` avec l'UID 1050.

## 5. **Ajout d'un compte sans répertoire personnel**:
   Certains comptes, en particulier ceux destinés à l'exécution de tâches spécifiques, n'ont pas besoin de répertoire personnel.
   ```bash
   useradd -M noroomuser
   ```
   Cela crée un compte `noroomuser` sans répertoire personnel.

## 6. **Configuration d'un compte avec un shell spécifique**:
   Pour les utilisateurs qui préfèrent ou nécessitent un shell différent de celui par défaut du système.
   ```bash
   useradd -m -s /usr/bin/zsh zshuser
   ```
   Cela crée un compte `zshuser` avec Zsh comme shell de connexion.

## 7. **Création d'un compte avec un mot de passe prédéfini**:
   Pour automatiser la création de comptes, il peut être utile de définir un mot de passe dès la création. Cependant, cette pratique n'est pas recommandée pour des raisons de sécurité; il est préférable de définir le mot de passe après la création du compte.
   ```bash
   useradd -m -p $(openssl passwd -crypt 'password') predefuser
   ```
   Note : Cette méthode expose le mot de passe dans l'historique des commandes. Il est préférable d'utiliser `passwd` après la création du compte pour définir ou changer le mot de passe.

## 8. **Création d'un compte pour un utilisateur avec des groupes supplémentaires**:
   Pour les utilisateurs qui doivent appartenir à plusieurs groupes dès la création de leur compte.
   ```bash
   useradd -m -G wheel,developers multiuser
   ```
   Cela crée un compte `multiuser` et l'ajoute aux groupes `wheel` et `developers`.

## 9. **Création d'un compte qui empêche l'utilisateur de se connecter au serveur et répertoire home**:
   Pour cela, utilisez la commande `useradd` avec l'option `-r` (qui crée un compte système) et l'option `-s /usr/sbin/nologin` (qui empêche l'utilisateur de se connecter au serveur). Vous pouvez aussi utiliser l'option `-M` pour ne pas créer de répertoire home, si ce n'est pas nécessaire.

      ```bash
      sudo useradd -r -s /usr/sbin/nologin -M nom_utilisateur
      ```

Chacun de ces cas d'utilisation montre comment `useradd` peut être utilisé de manière flexible pour répondre aux exigences variées de gestion des comptes utilisateurs, de la création de comptes basiques à des configurations plus complexes et spécifiques.