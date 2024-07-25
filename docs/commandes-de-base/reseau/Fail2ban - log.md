---
title: Fail2ban - log
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
# Documentation pour "
: Log et Journal" sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la fonction de log et journal de Fail2ban](#fonctionnement-de-la-fonction-de-log-et-journal-de-fail2ban)
4. [Configuration des logs et journaux de Fail2ban](#configuration-des-logs-et-journaux-de-fail2ban)
5. [Options de configuration des logs de Fail2ban](#options-de-configuration-des-logs-de-fail2ban)
    - [Option `logtarget`](#option-logtarget)
    - [Option `loglevel`](#option-loglevel)
    - [Option `syslogsocket`](#option-syslogsocket)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Configurer le niveau de log](#exemple-1--configurer-le-niveau-de-log)
    - [Exemple 2 : Changer la destination des logs](#exemple-2--changer-la-destination-des-logs)
    - [Exemple 3 : Utiliser Fail2ban avec rsyslog](#exemple-3--utiliser-fail2ban-avec-rsyslog)

## Introduction

Fail2ban est un outil de sécurité qui surveille les fichiers journaux des services pour détecter les tentatives de connexion échouées et autres comportements suspects, puis bannit les adresses IP malveillantes. La gestion des logs et journaux est cruciale pour le suivi et l'analyse des actions de Fail2ban.

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

Pour vérifier que Fail2ban est correctement installé, utilisez la commande suivante :

```bash
fail2ban-client --version
```

## Fonctionnement de la fonction de log et journal de Fail2ban

Fail2ban utilise les logs pour surveiller les activités suspectes et enregistrer ses propres actions. Les logs contiennent des informations sur les tentatives de connexion échouées, les adresses IP bannies, et d'autres événements liés à la sécurité.

## Configuration des logs et journaux de Fail2ban

Les options de configuration des logs de Fail2ban se trouvent dans le fichier de configuration principal `/etc/fail2ban/fail2ban.conf` et dans le fichier de configuration des actions `/etc/fail2ban/jail.conf` ou `/etc/fail2ban/jail.local`.

### Exemple de configuration de base dans `/etc/fail2ban/fail2ban.conf`

```ini
[Definition]
loglevel = INFO
logtarget = /var/log/fail2ban.log
syslogsocket = auto
```

## Options de configuration des logs de Fail2ban

### Option `logtarget`

Définit la destination des logs de Fail2ban.

```ini
logtarget = /var/log/fail2ban.log
```

**Explication :** Cette option peut être définie sur un fichier (`/var/log/fail2ban.log`), `SYSLOG`, `STDOUT`, ou `STDERR`.

### Option `loglevel`

Définit le niveau de détail des logs.

```ini
loglevel = INFO
```

**Explication :** Les niveaux disponibles sont `CRITICAL`, `ERROR`, `WARNING`, `NOTICE`, `INFO`, et `DEBUG`.

### Option `syslogsocket`

Définit le socket syslog à utiliser.

```ini
syslogsocket = auto
```

**Explication :** Cette option peut être définie sur `auto`, `udp`, ou `tcp`.

## Exemples concrets

### Exemple 1 : Configurer le niveau de log

Pour configurer le niveau de log à `DEBUG` pour obtenir des informations détaillées sur les actions de Fail2ban, modifiez le fichier `/etc/fail2ban/fail2ban.conf` :

```ini
[Definition]
loglevel = DEBUG
```

Redémarrez Fail2ban pour appliquer les modifications :

```bash
sudo systemctl restart fail2ban
```

### Exemple 2 : Changer la destination des logs

Pour changer la destination des logs vers syslog, modifiez le fichier `/etc/fail2ban/fail2ban.conf` :

```ini
[Definition]
logtarget = SYSLOG
```

Redémarrez Fail2ban pour appliquer les modifications :

```bash
sudo systemctl restart fail2ban
```

### Exemple 3 : Utiliser Fail2ban avec rsyslog

Pour envoyer les logs de Fail2ban à un serveur rsyslog distant, configurez rsyslog pour accepter les messages UDP ou TCP, puis modifiez le fichier `/etc/fail2ban/fail2ban.conf` :

```ini
[Definition]
logtarget = SYSLOG
syslogsocket = udp
```

Ensuite, configurez `/etc/rsyslog.conf` ou `/etc/rsyslog.d/` pour envoyer les logs à un serveur distant :

```text
*.* @remote-syslog-server:514
```

Redémarrez rsyslog et Fail2ban pour appliquer les modifications :

```bash
sudo systemctl restart rsyslog
sudo systemctl restart fail2ban
```

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour installer, configurer et utiliser les fonctionnalités de log et journal de Fail2ban sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man fail2ban` ou la documentation officielle de Fail2ban.