---
title: AllowTcpForwarding
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
3. [Fonctionnement de la fonction `AllowTcpForwarding`](#fonctionnement-de-la-fonction-allowtcpforwarding)
4. [Syntaxe de la fonction `AllowTcpForwarding`](#syntaxe-de-la-fonction-allowtcpforwarding)
5. [Options de la fonction `AllowTcpForwarding`](#options-de-la-fonction-allowtcpforwarding)
    - [Option `yes`](#option-yes)
    - [Option `no`](#option-no)
    - [Option `local`](#option-local)
    - [Option `remote`](#option-remote)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Activer le transfert TCP](#exemple-1--activer-le-transfert-tcp)
    - [Exemple 2 : Désactiver le transfert TCP](#exemple-2--désactiver-le-transfert-tcp)
    - [Exemple 3 : Activer uniquement le transfert TCP local](#exemple-3--activer-uniquement-le-transfert-tcp-local)
    - [Exemple 4 : Activer uniquement le transfert TCP distant](#exemple-4--activer-uniquement-le-transfert-tcp-distant)

## Introduction

L'option `AllowTcpForwarding` dans la configuration du serveur SSH (`sshd_config`) contrôle si le transfert TCP est autorisé. Le transfert TCP permet de créer des tunnels sécurisés pour rediriger le trafic à travers une connexion SSH. Cela peut être utilisé pour des applications comme les VPN, le contournement de pare-feu, ou l'accès à des services distants de manière sécurisée.

## Installation

`AllowTcpForwarding` fait partie de la configuration du serveur OpenSSH, qui doit être installé sur votre système. Voici comment installer OpenSSH sur différentes distributions Linux.

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install openssh-server
```

### Sur Fedora

```bash
sudo dnf install openssh-server
```

### Sur Arch Linux

```bash
sudo pacman -S openssh
```

### Vérification de l'installation

Pour vérifier que le serveur SSH est installé et en cours d'exécution, utilisez la commande suivante :

```bash
sudo systemctl status sshd
```

## Fonctionnement de la fonction `AllowTcpForwarding`

L'option `AllowTcpForwarding` contrôle si les connexions TCP peuvent être redirigées via SSH. Cette fonctionnalité est souvent utilisée pour sécuriser des connexions à des services ou des applications distantes.

## Syntaxe de la fonction `AllowTcpForwarding`

L'option `AllowTcpForwarding` est définie dans le fichier de configuration du serveur SSH (`/etc/ssh/sshd_config`).

```text
AllowTcpForwarding option
```

### Options possibles

- `yes` : Active le transfert TCP (par défaut).
- `no` : Désactive le transfert TCP.
- `local` : Autorise uniquement le transfert TCP local.
- `remote` : Autorise uniquement le transfert TCP distant.

## Options de la fonction `AllowTcpForwarding`

### Option `yes`

Autorise le transfert TCP à la fois local et distant.

```text
AllowTcpForwarding yes
```

**Explication :** Permet à SSH de rediriger les connexions TCP à la fois localement et vers des hôtes distants. C'est l'option par défaut.

### Option `no`

Désactive complètement le transfert TCP.

```text
AllowTcpForwarding no
```

**Explication :** Empêche toute redirection de connexions TCP via SSH. Utilisé pour augmenter la sécurité en désactivant cette fonctionnalité.

### Option `local`

Autorise uniquement le transfert TCP local.

```text
AllowTcpForwarding local
```

**Explication :** Permet uniquement la redirection de connexions TCP vers des ports locaux sur le client SSH.

### Option `remote`

Autorise uniquement le transfert TCP distant.

```text
AllowTcpForwarding remote
```

**Explication :** Permet uniquement la redirection de connexions TCP vers des ports distants sur le serveur SSH.

## Exemples concrets

### Exemple 1 : Activer le transfert TCP

Pour activer le transfert TCP (local et distant), ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding yes
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Exemple 2 : Désactiver le transfert TCP

Pour désactiver complètement le transfert TCP, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding no
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Exemple 3 : Activer uniquement le transfert TCP local

Pour activer uniquement le transfert TCP local, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding local
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Exemple 4 : Activer uniquement le transfert TCP distant

Pour activer uniquement le transfert TCP distant, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding remote
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

## Conclusion

Cette documentation complète vous fournit toutes les informations nécessaires pour comprendre et utiliser l'option `AllowTcpForwarding` dans la configuration SSH sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man sshd_config` ou la documentation officielle de SSH.