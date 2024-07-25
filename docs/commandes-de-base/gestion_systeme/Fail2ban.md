---
title: Fail2ban
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
# Documentation pour 
 sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de Fail2ban](#fonctionnement-de-fail2ban)
4. [Configuration de Fail2ban](#configuration-de-fail2ban)
5. [Options de configuration de Fail2ban](#options-de-configuration-de-fail2ban)
    - [Option `bantime`](#option-bantime)
    - [Option `findtime`](#option-findtime)
    - [Option `maxretry`](#option-maxretry)
    - [Option `ignoreip`](#option-ignoreip)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Configurer un jail pour SSH](#exemple-1--configurer-un-jail-pour-ssh)
    - [Exemple 2 : Configurer un jail pour Apache](#exemple-2--configurer-un-jail-pour-apache)
    - [Exemple 3 : Débannir une adresse IP](#exemple-3--débannir-une-adresse-ip)

## Introduction

Fail2ban est un logiciel de sécurité qui protège les serveurs contre les attaques par force brute. Il surveille les fichiers journaux (logs) de divers services et bannit temporairement les adresses IP qui montrent des comportements malveillants, tels que des tentatives de connexion échouées répétées.

## Installation

Fail2ban est disponible dans les dépôts de la plupart des distributions Linux. Voici comment l'installer sur différentes distributions :

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install fail2ban
```

### Sur Fedora

```bash
sudo dnf install fail2ban
```

### Sur Arch Linux

```bash
sudo pacman -S fail2ban
```

### Vérification de l'installation

Pour vérifier que Fail2ban est correctement installé, vous pouvez utiliser la commande suivante :

```bash
fail2ban-client --version
```

## Fonctionnement de Fail2ban

Fail2ban fonctionne en surveillant les fichiers journaux des services configurés (comme SSH, Apache, etc.). Lorsqu'il détecte un comportement suspect, comme plusieurs tentatives de connexion échouées, il bannit l'adresse IP de l'attaquant en modifiant les règles du pare-feu pour bloquer cette adresse IP pendant une période définie.

## Configuration de Fail2ban

La configuration de Fail2ban est généralement située dans le répertoire `/etc/fail2ban`. Le fichier principal de configuration est `jail.conf`, mais il est recommandé de ne pas modifier ce fichier directement. À la place, créez un fichier `jail.local` pour vos configurations personnalisées.

### Exemple de configuration de base dans `/etc/fail2ban/jail.local`

```ini
[DEFAULT]
bantime  = 600
findtime  = 600
maxretry = 3

[sshd]
enabled = true
port    = 22
logpath = /var/log/auth.log
backend = systemd
```

## Options de configuration de Fail2ban

### Option `bantime`

Définit la durée (en secondes) pendant laquelle une adresse IP est bannie.

```ini
bantime = 600
```

**Explication :** Cette option définit le temps de bannissement à 600 secondes (10 minutes).

### Option `findtime`

Définit la période (en secondes) pendant laquelle les échecs de connexion doivent se produire pour déclencher un bannissement.

```ini
findtime = 600
```

**Explication :** Si `maxretry` tentatives échouées se produisent dans cette période, l'adresse IP sera bannie.

### Option `maxretry`

Définit le nombre de tentatives échouées avant de bannir une adresse IP.

```ini
maxretry = 3
```

**Explication :** Cette option définit le nombre maximal de tentatives échouées à 3.

### Option `ignoreip`

Définit les adresses IP qui ne devraient jamais être bannies.

```ini
ignoreip = 127.0.0.1/8 ::1
```

**Explication :** Les adresses IP locales ne seront pas bannies.

## Exemples concrets

### Exemple 1 : Configurer un jail pour SSH

Ajoutez ou modifiez la configuration dans `/etc/fail2ban/jail.local` pour protéger le service SSH.

```ini
[sshd]
enabled = true
port    = 22
logpath = /var/log/auth.log
backend = systemd
```

**Explication :** Ce jail surveille le fichier journal `/var/log/auth.log` pour les tentatives de connexion SSH échouées et bannit les adresses IP malveillantes.

### Exemple 2 : Configurer un jail pour Apache

Ajoutez la configuration suivante pour protéger un serveur web Apache contre les attaques.

```ini
[apache-auth]
enabled = true
port    = http,https
logpath = /var/log/apache2/*error.log
maxretry = 3
```

**Explication :** Ce jail surveille les fichiers journal d'erreurs d'Apache pour les tentatives de connexion échouées et bannit les adresses IP après 3 échecs.

### Exemple 3 : Débannir une adresse IP

Pour débannir une adresse IP manuellement, utilisez la commande suivante :

```bash
sudo fail2ban-client set sshd unbanip <IP_ADDRESS>
```

**Explication :** Remplacez `<IP_ADDRESS>` par l'adresse IP que vous souhaitez débannir.

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour installer, configurer et utiliser Fail2ban sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man fail2ban` ou la documentation officielle de Fail2ban.