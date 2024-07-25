---
title: X11Forwarding
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
" sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la fonction `X11Forwarding`](#fonctionnement-de-la-fonction-x11forwarding)
4. [Syntaxe de la fonction `X11Forwarding`](#syntaxe-de-la-fonction-x11forwarding)
5. [Options de la fonction `X11Forwarding`](#options-de-la-fonction-x11forwarding)
    - [Option `yes`](#option-yes)
    - [Option `no`](#option-no)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Activer le transfert X11](#exemple-1--activer-le-transfert-x11)
    - [Exemple 2 : Désactiver le transfert X11](#exemple-2--désactiver-le-transfert-x11)

## Introduction

L'option `X11Forwarding` dans la configuration du serveur SSH (`sshd_config`) permet le transfert des sessions X11 via SSH. Cette fonctionnalité est couramment utilisée pour exécuter des applications graphiques sur un serveur distant et afficher l'interface graphique sur une machine locale.

## Installation

Pour utiliser le transfert X11 via SSH, vous devez installer OpenSSH et un serveur X sur les machines client et serveur.

### Sur Debian/Ubuntu

Pour installer le serveur SSH (OpenSSH) et le serveur X :

```bash
sudo apt update
sudo apt install openssh-server xauth
```

### Sur Fedora

Pour installer le serveur SSH (OpenSSH) et le serveur X :

```bash
sudo dnf install openssh-server xorg-x11-xauth
```

### Sur Arch Linux

Pour installer OpenSSH et le serveur X :

```bash
sudo pacman -S openssh xorg-xauth
```

### Vérification de l'installation

Pour vérifier que le serveur SSH est installé et en cours d'exécution, utilisez la commande suivante :

```bash
sudo systemctl status sshd
```

## Fonctionnement de la fonction `X11Forwarding`

La fonction `X11Forwarding` permet de rediriger les connexions X11 (utilisées pour les interfaces graphiques) à travers une connexion SSH. Cela permet aux utilisateurs de lancer des applications graphiques sur un serveur distant et d'afficher leur interface graphique sur leur machine locale.

## Syntaxe de la fonction `X11Forwarding`

L'option `X11Forwarding` est définie dans le fichier de configuration du serveur SSH (`/etc/ssh/sshd_config`).

```text
X11Forwarding option
```

### Options possibles

- `yes` : Active le transfert X11.
- `no` : Désactive le transfert X11 (par défaut).

## Options de la fonction `X11Forwarding`

### Option `yes`

Active le transfert X11.

```text
X11Forwarding yes
```

**Explication :** Permet au serveur SSH de rediriger les connexions X11 vers le client SSH. Cela permet aux applications graphiques sur le serveur distant d'être affichées sur la machine locale.

### Option `no`

Désactive le transfert X11.

```text
X11Forwarding no
```

**Explication :** Empêche le serveur SSH de rediriger les connexions X11. Cela peut être utilisé pour des raisons de sécurité si le transfert X11 n'est pas nécessaire.

## Exemples concrets

### Exemple 1 : Activer le transfert X11

Pour activer le transfert X11, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
X11Forwarding yes
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Sur le client

Pour utiliser le transfert X11 lors de la connexion à un serveur SSH, utilisez l'option `-X` :

```bash
ssh -X user@server
```

### Exemple 2 : Désactiver le transfert X11

Pour désactiver le transfert X11, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
X11Forwarding no
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

---

Cette documentation vous fournit toutes les informations nécessaires pour comprendre et utiliser l'option `X11Forwarding` dans la configuration SSH sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man sshd_config` ou la documentation officielle de SSH.