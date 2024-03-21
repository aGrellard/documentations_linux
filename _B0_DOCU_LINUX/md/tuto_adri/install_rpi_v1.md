# RASPBERRY SERVEUR

instal debian12, sans environnement
    utilisateur 
        sudo

install environnement shell
    zsh
    ohmyzsh
        plugins
    zshrc
    defaultshell

install serveur ssh

montage des disques via fsb

install serveur samba
    créations d'utilisateur samba
    creation de group pour les oartages disk usb
    creations des partages des disque

mettre en place ngix

## Création de l'image pour la carte SD
- Téléchargement de raspberry Pi Imager
  - [raspberry Pi Imager](https://www.raspberrypi.org/software/) 
- Choix de l'image : Raspberry Pi OS (autre)
  - Raspberry Pi OS Lite (64-bit)
- Choix de la carte SD
- Post configuration du système
  - Activation du SSH
  - Configuration utilisateur et mot de passe
  - configuration du nom de la machine
  - configuration du wifi si besoin 

## Préparation du système

### Mise à jour du système

```bash
sudo apt update
sudo apt upgrade
```

### Installation des paquets de base

```bash
sudo apt install curl wget git vim 
```

## Installation de l'environnement shell

### Télechargement des scripts d'installation 

```bash
git clone "https://github.com/aGrellard/documentations_linux.git" -o /YOUR_PATH/
```

### Installation de zsh

```bash
cd documentations_linux/_C0_SCRIPTS_LINUX
chmod +x installation_paquets.sh
./installation_paquets.sh
zsh
chmod +x installation_ohmyzsh.sh
```

redémarer la session si necessaire


## installation des utilitaires pour le systéme de fichier

### Installation de ntfs-3g

- [Documentation](../linux/ntfs-3g.md)

```bash
sudo apt install ntfs-3g
```

## Configuration du montage automatique des disques

### Création des points de montage

```bash
sudo mkdir /media/usb1
sudo mkdir /media/usb2
```

### Configuration du fstab

- [Documentation fstab](../linux/fstab.md)
- [Documentation fstab cifs](../linux/mount_samba.md)

```bash
sudo blkid
```









## installation du serveur samba

mettre apt a jour

### Installation de samba

```bash
sudo apt install samba samba-common-bin 

