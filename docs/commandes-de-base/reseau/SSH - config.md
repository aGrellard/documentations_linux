---
title: SSH - config
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour la configuration et la sécurisation de 
 sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de SSH](#fonctionnement-de-ssh)
4. [Syntaxe de la commande SSH](#syntaxe-de-la-commande-ssh)
5. [Options de configuration de SSH](#options-de-configuration-de-ssh)
    - [Option `Port`](#option-port)
    - [Option `PermitRootLogin`](#option-permitrootlogin)
    - [Option `PasswordAuthentication`](#option-passwordauthentication)
    - [Option `PubkeyAuthentication`](#option-pubkeyauthentication)
    - [Option `AllowUsers`](#option-allowusers)
    - [Option `DenyUsers`](#option-denyusers)
6. [Exemples concrets de configuration et de sécurisation](#exemples-concrets-de-configuration-et-de-sécurisation)
    - [Exemple 1 : Changer le port SSH](#exemple-1--changer-le-port-ssh)
    - [Exemple 2 : Désactiver l'authentification par mot de passe](#exemple-2--désactiver-lauthentification-par-mot-de-passe)
    - [Exemple 3 : Restreindre l'accès SSH à certains utilisateurs](#exemple-3--restreindre-laccès-ssh-à-certains-utilisateurs)
    - [Exemple 4 : Activer l'authentification par clé publique](#exemple-4--activer-lauthentification-par-clé-publique)

## Introduction

SSH (Secure Shell) est un protocole utilisé pour sécuriser les connexions à distance entre deux machines. Il est couramment utilisé pour accéder à des serveurs distants de manière sécurisée, en chiffrant toutes les données échangées. La configuration et la sécurisation de SSH sont essentielles pour protéger vos systèmes contre les accès non autorisés.

## Installation

### Sur Debian/Ubuntu

Pour installer le serveur SSH (OpenSSH), utilisez la commande suivante :

```bash
sudo apt update
sudo apt install openssh-server
```

Pour installer le client SSH :

```bash
sudo apt install openssh-client
```

### Sur Fedora

Pour installer le serveur SSH (OpenSSH), utilisez la commande suivante :

```bash
sudo dnf install openssh-server
```

Pour installer le client SSH :

```bash
sudo dnf install openssh-clients
```

### Sur Arch Linux

Pour installer OpenSSH (serveur et client) :

```bash
sudo pacman -S openssh
```

### Vérification de l'installation

Pour vérifier que le serveur SSH est installé et en cours d'exécution, utilisez la commande suivante :

```bash
sudo systemctl status ssh
```

## Fonctionnement de SSH

SSH fonctionne en utilisant une paire de clés cryptographiques pour authentifier les utilisateurs et chiffrer la communication entre les clients et les serveurs. Lorsqu'un utilisateur tente de se connecter à un serveur SSH, le serveur utilise sa clé privée pour déchiffrer un message chiffré envoyé par le client, qui utilise la clé publique du serveur.

## Syntaxe de la commande SSH

La commande SSH de base pour se connecter à un serveur distant est :

```bash
ssh [options] utilisateur@hôte
```

### Exemple :

```bash
ssh user@192.168.1.100
```

## Options de configuration de SSH

Les options de configuration de SSH sont définies dans le fichier `/etc/ssh/sshd_config` pour le serveur et dans le fichier `~/.ssh/config` pour le client. Voici quelques options importantes :

### Option `Port`

Change le port sur lequel le serveur SSH écoute.

**Syntaxe :**

```text
Port 2222
```

**Explication :** Par défaut, SSH écoute sur le port 22. Changer le port peut aider à réduire les tentatives de brute force.

### Option `PermitRootLogin`

Contrôle si l'utilisateur root peut se connecter via SSH.

**Syntaxe :**

```text
PermitRootLogin no
```

**Explication :** Désactiver les connexions SSH directes pour l'utilisateur root augmente la sécurité.

### Option `PasswordAuthentication`

Active ou désactive l'authentification par mot de passe.

**Syntaxe :**

```text
PasswordAuthentication no
```

**Explication :** Désactiver l'authentification par mot de passe et utiliser l'authentification par clé publique à la place augmente la sécurité.

### Option `PubkeyAuthentication`

Active l'authentification par clé publique.

**Syntaxe :**

```text
PubkeyAuthentication yes
```

**Explication :** Assurez-vous que cette option est activée pour permettre l'authentification par clé publique.

### Option `AllowUsers`

Restreint les utilisateurs autorisés à se connecter via SSH.

**Syntaxe :**

```text
AllowUsers user1 user2
```

**Explication :** Seuls les utilisateurs spécifiés peuvent se connecter via SSH.

### Option `DenyUsers`

Empêche certains utilisateurs de se connecter via SSH.

**Syntaxe :**

```text
DenyUsers user1 user2
```

**Explication :** Les utilisateurs spécifiés ne peuvent pas se connecter via SSH.

## Exemples concrets de configuration et de sécurisation

### Exemple 1 : Changer le port SSH

1. Ouvrez le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

2. Modifiez la ligne suivante pour changer le port :

```text
Port 2222
```

3. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

### Exemple 2 : Désactiver l'authentification par mot de passe

1. Ouvrez le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

2. Modifiez ou ajoutez la ligne suivante :

```text
PasswordAuthentication no
```

3. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

### Exemple 3 : Restreindre l'accès SSH à certains utilisateurs

1. Ouvrez le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

2. Ajoutez la ligne suivante pour restreindre l'accès :

```text
AllowUsers user1 user2
```

3. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

### Exemple 4 : Activer l'authentification par clé publique

1. Générer une paire de clés publique/privée sur le client :

```bash
ssh-keygen -t rsa -b 4096 -C "votre_email@example.com"
```

2. Copier la clé publique sur le serveur :

```bash
ssh-copy-id user@serveur
```

3. Assurez-vous que l'option `PubkeyAuthentication` est activée dans le fichier de configuration SSH du serveur :

```text
PubkeyAuthentication yes
```

4. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

---

Cette documentation vous fournit toutes les informations nécessaires pour configurer et sécuriser SSH sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man sshd_config` ou la documentation officielle de SSH.