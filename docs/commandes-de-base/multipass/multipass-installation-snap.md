---
title: multipass-installation-snap
date: 2024-07-12
tags:
  - ressource
  - programmes
  - linux
  - virtualisations
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[multipass-installation-deb]]"
---

# Comment installer Multipass via Snap

### Prérequis

1. Avoir `snapd` installé sur votre système. Si ce n'est pas le cas, installez-le en utilisant les commandes suivantes selon votre distribution.

### Installation de Snapd

#### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install snapd
```

#### Sur Fedora

```bash
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
```

#### Sur Arch Linux

```bash
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
```

### Installation de Multipass

Une fois `snapd` installé, vous pouvez installer Multipass en utilisant la commande `snap` :

```bash
sudo snap install multipass --classic
```

#### Option `--classic`

L'option `--classic` lors de l'installation d'un snap permet d'installer le logiciel en mode classique. Cela signifie que le logiciel aura accès au système de fichiers complet et qu'il ne sera pas confiné dans un environnement restreint comme c'est le cas pour les snaps standards. Cette option est nécessaire pour certains logiciels qui nécessitent un accès étendu au système.

**Explication :** L'option `--classic` est utilisée ici car Multipass peut nécessiter un accès plus large au système pour gérer les machines virtuelles et leurs fichiers.
### Vérification de l'installation

Pour vérifier que Multipass est correctement installé, utilisez la commande suivante :

```bash
multipass --version
```
