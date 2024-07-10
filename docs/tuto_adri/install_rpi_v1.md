---
title: "RASPBERRY SERVEUR"
author: [Grellard Adrien]
date: "2024-21-03"
subject: "Markdown"
keywords: [Markdown, Example]
book: true
classoption: [oneside]
...


- [RASPBERRY SERVEUR](#raspberry-serveur)
  - [Objectis de ce tutoriel](#objectis-de-ce-tutoriel)
    - [Premiére partie](#premiére-partie)
    - [Deuxiéme partie](#deuxiéme-partie)
  - [Création de l'image pour la carte SD](#création-de-limage-pour-la-carte-sd)
    - [Une image disque](#une-image-disque)
      - [La création d'une image disque](#la-création-dune-image-disque)
      - [Un disque amorçable](#un-disque-amorçable)
    - [Téléchargez l’image Debian créée pour le Raspberry Pi.](#téléchargez-limage-debian-créée-pour-le-raspberry-pi)
    - [Flashez l'image sur une nouvelle carte SD avec Raspberry Pi Imager.](#flashez-limage-sur-une-nouvelle-carte-sd-avec-raspberry-pi-imager)
  - [Préparation du système](#préparation-du-système)
    - [Connexion en root](#connexion-en-root)
    - [Configuration du clavier](#configuration-du-clavier)
      - [Gestionnaire de paquets](#gestionnaire-de-paquets)
      - [Apt update](#apt-update)
  - [Gestions des utilisateurs et des groupes](#gestions-des-utilisateurs-et-des-groupes)
    - [Mettre a jour/ajouter un mot de passe à l'utilisateur root](#mettre-a-jourajouter-un-mot-de-passe-à-lutilisateur-root)
    - [Ajouter un utilisateur](#ajouter-un-utilisateur)
    - [Ajouter l'utilisateur au groupe sudo](#ajouter-lutilisateur-au-groupe-sudo)
  - [Installer le paquet sudo](#installer-le-paquet-sudo)
  - [Connection en tant qu'utilisateur](#connection-en-tant-quutilisateur)
  - [Mise à jour du système](#mise-à-jour-du-système)
  - [Nom d'Hôte (hostname)](#nom-dhôte-hostname)
    - [Afficher le Nom d'Hôte Actuel](#afficher-le-nom-dhôte-actuel)
    - [Modifier le Nom d'Hôte de Manière Permanente](#modifier-le-nom-dhôte-de-manière-permanente)
    - [Conseils](#conseils)
  - [Installation de quelques paquets de base](#installation-de-quelques-paquets-de-base)
    - [curl](#curl)
    - [wget](#wget)
    - [git](#git)
    - [tree](#tree)
  - [Terminal (TTY - Teletype Terminal Emulator)](#terminal-tty---teletype-terminal-emulator)
    - [Télechargement des scripts d'installation](#télechargement-des-scripts-dinstallation)
      - [méthode avec git clone](#méthode-avec-git-clone)
      - [méthode avec curl et unzip](#méthode-avec-curl-et-unzip)
    - [Rendre les scripts d'installation exécutable](#rendre-les-scripts-dinstallation-exécutable)
      - [`chmod`](#chmod)
        - [À quoi sert `chmod +x` ?](#à-quoi-sert-chmod-x-)
        - [Exemple](#exemple)
    - [Utilisation des scripts d'installation](#utilisation-des-scripts-dinstallation)
  - [installation des utilitaires pour le systéme de fichier](#installation-des-utilitaires-pour-le-systéme-de-fichier)
    - [Installation de ntfs-3g](#installation-de-ntfs-3g)
  - [Configuration du montage automatique des disques](#configuration-du-montage-automatique-des-disques)
    - [Création des points de montage](#création-des-points-de-montage)
    - [Configuration du fstab](#configuration-du-fstab)
  - [installation du serveur ssh (si besoin)](#installation-du-serveur-ssh-si-besoin)
    - [Configuration du serveur ssh](#configuration-du-serveur-ssh)
  - [Création des utilisateurs](#création-des-utilisateurs)
  - [Création des groupes](#création-des-groupes)
  - [Ajout des utilisateurs aux groupes](#ajout-des-utilisateurs-aux-groupes)
  - [Installation de samba](#installation-de-samba)
    - [Installation des outils nécessaires](#installation-des-outils-nécessaires)
    - [Création des utilisateurs samba](#création-des-utilisateurs-samba)
  - [installation du serveur samba](#installation-du-serveur-samba)
    - [Installation de samba](#installation-de-samba-1)


# RASPBERRY SERVEUR


## Objectis de ce tutoriel


### Premiére partie
installation | configuration | shell 
--- | --- | --- 
Téléchargement de l'image | Mise à jour du système                    | Installation de zsh
Création de la carte SD   | Configuration du clavier                  | Installation de ohmyzsh
Connexion en root         | Gestions des utilisateurs et des groupes  | installation des utilitaires
|                         | Configuration du nom d'hôte
|                         | Installation des paquets de base

### Deuxiéme partie
systéme de fichier | Contrôle a distance | partage de fichier
--- | --- | --- 

<br><hr><br>


## Création de l'image pour la carte SD

### Une image disque

Une image disque est un fichier qui contient une copie exacte d'un disque dur, d'une clé USB ou d'un autre support de stockage.

Les images disque sont souvent utilisées pour sauvegarder et restaurer des données, cloner des disques, ou créer des disques amorçables. 

Elles peuvent être stockées sur un disque dur, un serveur, un lecteur réseau ou un autre support de stockage.

#### La création d'une image disque

La création d'une image disque, comme une image ISO d'un CD d'installation de Windows, diffère substantiellement d'une simple opération de copier-coller des fichiers pour plusieurs raisons techniques et fonctionnelles importantes.

<details>

<summary>Voici les différences clés</summary>

**Réplication exacte vs. Copie de fichiers**
   - **Image disque** 
  
      Créer une image disque (comme une image ISO) consiste à faire une réplication exacte de tous les contenus du disque, incluant les fichiers, **la structure des dossiers**, **les informations de démarrage**, et **les attributs de fichiers**, en un seul fichier conteneur. 
      
      Cela inclut également **les secteurs de démarrage**, **les partitions**, et **les espaces non alloués**.

   - **Copier-coller**
  
      Le copier-coller des fichiers d'un CD vers un autre emplacement (par exemple, un disque dur) copie uniquement les fichiers et dossiers visibles, sans préserver **les informations de démarrage**, **les attributs spéciaux** des fichiers, ou la **structure exacte des données** sur le disque.

**Préservation des informations de démarrage**
   
      Les disques d'installation, comme ceux de Windows, contiennent des informations de démarrage spécifiques qui sont nécessaires pour lancer le processus d'installation lors du démarrage de l'ordinateur à partir du disque.

      Ces informations ne sont pas copiées lors d'une opération de copier-coller standard, mais elles sont intégralement incluses dans une image disque.

1. **Facilité de distribution et d'utilisation**
   
    Une image disque peut être facilement distribuée, stockée, ou montée comme un disque virtuel dans un système d'exploitation. 
    
    Elle peut également être gravée sur un disque vierge pour créer une copie exacte de l'original. 
    
    Cette polyvalence est particulièrement utile pour la distribution de logiciels ou le déploiement de systèmes d'exploitation.

2. **Intégrité et fidélité des données**

    La création d'une image disque assure la conservation de l'intégrité et de la fidélité des données originales, y compris les métadonnées et les attributs de fichiers, qui pourraient être modifiés ou perdus lors d'une simple copie. 
    
    Cela est crucial pour les logiciels et systèmes d'exploitation qui dépendent de configurations spécifiques et de données de démarrage pour fonctionner correctement.

</details><br>

En résumé, tandis que le copier-coller peut être suffisant pour des fichiers ordinaires, la création d'une image disque est nécessaire pour reproduire fidèlement un système de fichiers complexe, comme un CD d'installation de Windows, avec toutes ses fonctionnalités, structures, et informations de démarrage intactes.


#### Un disque amorçable

Un disque amorçable est un disque dur, une clé USB ou un autre support de stockage qui contient un système d'exploitation ou un programme qui peut être exécuté directement à partir du disque. 

Les disques amorçables sont souvent utilisés pour installer des systèmes d'exploitation, exécuter des programmes de récupération de données, ou tester des systèmes sans modifier le disque dur principal.

### Téléchargez l’image Debian créée pour le Raspberry Pi.

[site officiel de debian](https://raspi.debian.net/tested-images/)

### Flashez l'image sur une nouvelle carte SD avec Raspberry Pi Imager.

- Contrairement à la création d'une simple clé USB bootable pour un PC, qui nécessite souvent seulement le transfert d'un chargeur d'amorçage et d'un système d'exploitation minimal pour démarrer l'installation.
  
- Raspberry Pi Imager 
  
  Il installe directement le système d'exploitation sur la carte SD, plutôt que de créer une simple clé bootable. 
  
  Cela signifie que le Raspberry Pi peut démarrer et fonctionner immédiatement à partir de la carte SD, sans nécessiter d'installation ou de configuration supplémentaires de la part de l'utilisateur.

Pour flasher une image sur une carte SD, vous aurez besoin d'un logiciel de gravure d'image disque.

Raspberry Pi Imager est un outil gratuit et open-source qui vous permet de flasher des images sur des cartes SD, des clés USB, et d'autres supports de stockage. 

Voici comment utiliser Raspberry Pi Imager pour flasher une image Debian sur une carte SD :

- Téléchargement de raspberry Pi Imager
  - [raspberry Pi Imager](https://www.raspberrypi.org/software/) 
- Choix de l'image : custom os
  - récupération de l'image téléchargée précédemment
- Choix de la carte SD
- Post configuration du système
  - Aucune configuration 

## Préparation du système

### Connexion en root

Une fois que votre Raspberry Pi est démarré, vous pouvez vous connecter en tant qu'utilisateur root avec les identifiants suivants :

user | password
---- | --------
root | aucun

### Configuration du clavier

#### Gestionnaire de paquets

- C'est un outil logiciel qui automatise le processus d'installation, de mise à jour, de configuration et de suppression de logiciels sur le système d'exploitation d'un ordinateur.
  
- Les gestionnaires de paquets sont un composant essentiel des systèmes d'exploitation modernes, fournissant une interface cohérente pour gérer les logiciels et leurs dépendances, et garantissant ainsi l'intégrité et la stabilité du système. 
  
- Ils sont particulièrement prévalents et importants dans les systèmes d'exploitation basés sur Linux, mais des versions existent également pour Windows et macOS.

<details>

<summary>Fonctionnalités Clés</summary>

- **Installation de logiciels** : Permettent d'installer facilement des logiciels à partir de sources centralisées appelées dépôts ou repositories.
  
- **Gestion des dépendances** : Résolvent automatiquement les dépendances requises par un logiciel, évitant ainsi à l'utilisateur de devoir les installer manuellement.
  
- **Mises à jour et upgrades** : Facilitent la mise à jour des logiciels installés vers les dernières versions disponibles, améliorant ainsi la sécurité et la fonctionnalité.
  
- **Configuration et personnalisation** : Certains gestionnaires de paquets permettent de configurer et de personnaliser les logiciels au moment de l'installation.
  
- **Suppression propre** : Permettent de supprimer les logiciels de manière à ne laisser aucun fichier résiduel inutile.

</details>

#### Apt update

**apt update** permet de s'assurer que votre système dispose des informations les plus récentes sur les paquets et les versions disponibles, ce qui est crucial avant d'installer de nouveaux paquets ou de mettre à jour des paquets existants avec la commande apt upgrade ou apt install.

```bash
apt update
```

Nous allons installer les paquets `keyboard-configuration` et `console-setup` pour configurer le clavier.

```bash
apt install keyboard-configuration console-setup
```

Si la configuration du clavier n'a pas été appliquer, vous pouvez la forcer avec la commande suivante : 

```bash
setupcon
```

Si la configuration du clavier n'est pas correcte, vous pouvez la modifier avec la commande suivante : 
  
```bash
dpkg-reconfigure keyboard-configuration
```


## Gestions des utilisateurs et des groupes

### Mettre a jour/ajouter un mot de passe à l'utilisateur root

Changer le mot de passe de l'utilisateur root (avec l'iso debian 12, le mot de passe root n'est pas défini)

```bash
passwd root
```

### Ajouter un utilisateur
- [Documentation adduser](../cmd/utilisateurs_groups/adduser.md)
- [malekal adduser](https://www.malekal.com/gerer-les-utilisateurs-groupes-sur-linux-en-ligne-de-commandes-adduser-addgroup-usermod-passwd/)
- [ubuntu-fr adduser](https://doc.ubuntu-fr.org/adduser)
  
>Créer un nouvel utilisateur qui aura les droits sudo, il est recommandé de ne pas utiliser l'utilisateur root pour des tâches quotidiennes. Cet utilisateur sera l'administrateur du système.

<details>
<summary>Options Principales pour adduser</summary>

- --disabled-login : Crée un utilisateur sans possibilité de se connecter.
- --disabled-password : Crée un utilisateur sans mot de passe.
- --gecos GECOS : Définit les informations GECOS pour le nouvel utilisateur, qui peuvent inclure le nom complet, une chambre, un numéro de téléphone, un autre numéro de téléphone, et d'autres informations.
- --home RÉPERTOIRE : Spécifie le répertoire personnel de l'utilisateur à créer.
- --ingroup GROUPE : Ajoute l'utilisateur à un groupe existant.
- --no-create-home : Ne crée pas de répertoire personnel pour l'utilisateur.
- --shell INTERPRÉTEUR : Spécifie l'interpréteur de commandes pour l'utilisateur.
</details> <br>


```bash
adduser user1
```

### Ajouter l'utilisateur au groupe sudo

| | | | 
|---|---|---|
[usermod](../cmd/utilisateurs_groups/usermod.md) | [Malekal usermod](https://www.malekal.com/la-commande-usermod-exemples-et-utilisations/) | [linux-console gpaswd](https://fr.linux-console.net/?p=2138) 
[gpasswd](../cmd/utilisateurs_groups/usermod.md) | [tutorialspoint gpasswd](https://www.tutorialspoint.com/unix_commands/gpasswd.htm) | [ubuntu gpaswd](https://manpages.ubuntu.com/manpages/xenial/fr/man1/gpasswd.1.html)
[adduser](../cmd/utilisateurs_groups/adduser.md) | [ubuntu-fr adduser](https://doc.ubuntu-fr.org/adduser) | [man adduser](https://linux.die.net/man/8/adduser)
[deluser](../cmd/utilisateurs_groups/adduser.md) | [ubuntu-fr deluser](https://manpages.ubuntu.com/manpages/trusty/fr/man8/deluser.8.html) | [commandlinux deluser](https://www.commandlinux.com/man-page/man8/deluser.8.html)
  
Pour définir le groupe principal d'un utilisateur existant on utilise la commande usermod avec l'option -g :

<details>
<summary>Options Principales pour usermod</summary>

- `-d, --home HOME_DIR`: Change le répertoire personnel de l'utilisateur. L'option `-m` peut être utilisée conjointement pour déplacer le contenu vers le nouveau répertoire.
- `-m, --move-home`: Déplace le contenu du répertoire personnel de l'utilisateur vers le nouveau répertoire spécifié par `-d`.
- `-s, --shell SHELL`: Change le shell de connexion de l'utilisateur.
- `-g, --gid GROUP`: Change le groupe primaire de l'utilisateur. Ce peut être le nom ou le GID du groupe.
- `-G, --groups GROUPS`: Change la liste des groupes auxquels l'utilisateur appartient. Les groupes sont séparés par des virgules, sans espaces intercalaires. Si cette option est utilisée avec `-a`, l'utilisateur est ajouté aux groupes supplémentaires sans être retiré des autres.
- `-a, --append`: Utilisé avec `-G` pour ajouter l'utilisateur aux groupes supplémentaires sans le retirer des groupes existants.
- `-u, --uid UID`: Change l'UID de l'utilisateur. Attention, cela peut affecter la propriété des fichiers.
- `-L, --lock`: Verrouille le compte de l'utilisateur en désactivant son mot de passe.
- `-U, --unlock`: Déverrouille le compte de l'utilisateur.
- `-e, --expiredate EXPIRE_DATE`: Change la date d'expiration du compte. Le format doit être AAAA-MM-JJ.
- `-f, --inactive INACTIVE`: Change le nombre de jours après l'expiration du mot de passe pendant lesquels le compte est considéré comme inactif et sera désactivé.
</details> <br>


```bash
usermod -g sudo user1
```

Pour définir un groupe supplémentaire à un utilisateur existant on utilise la commande usermod avec l'option -aG :

```bash
usermod -aG sudo user1
```

ou pour plusieurs groupes :

```bash
usermod -aG groupe1,groupe2 user1
```

Nous pouvons aussi enlever un utilisateur d'un groupe avec la commande gpasswd :

<details>
<summary>Options Principales pour gpasswd</summary>

- -a UTILISATEUR : Ajoute un utilisateur au groupe spécifié.
- -d UTILISATEUR : Supprime un utilisateur du groupe.
- -R : Restreint l'usage du groupe aux membres du groupe.
- -r : Supprime le mot de passe du groupe, le rendant accessible sans mot de passe.
- -A UTILISATEUR1,UTILISATEUR2,... : Définit les utilisateurs spécifiés comme administrateurs du groupe.
- -M UTILISATEUR1,UTILISATEUR2,... : Établit une liste d'utilisateurs comme les seuls membres du groupe, en remplaçant tous les membres actuels.
</details><br>


```bash
gpasswd -d user1 groupe
```

Et nous pouvons supprimer un utilisateur avec la commande deluser :

```bash
deluser user1
```

Ou : si un système de fichier etait installer pour l'utilisateur :

```bash
deluser --remove-home user1
```

## Installer le paquet sudo

- L'installation du paquet sudo est nécessaire pour donner les droits d'administration à un utilisateur.
- La configuration des droits sudo se fait via le fichier /etc/sudoers. 
- Il est recommandé d'utiliser la commande visudo pour éditer ce fichier.

Dans notre cas, l'utilisateur a déjà été ajouté au groupe sudo, il est donc possible de lancer des commandes avec les droits d'administration.

Si nous n'avions pas ajouté l'utilisateur au groupe sudo, nous aurions pu editer le fichier sudoers et ajouter la ligne suivante :

```
user1 ALL=( ALL:ALL ) ALL
```

voici comment cette ligne est structurée :

- `user1` : l'utilisateur concerné
- `ALL` : les hôtes sur lesquels l'utilisateur peut exécuter des commandes
  - dans un environnement local ou il n'y a pas besoin de fair de la gestion de droits sur plusieurs machines, il est possible de mettre `ALL`
- `( ALL:ALL )` : les utilisateurs et les groupes qui peuvent être utilisés pour exécuter des commandes
- `ALL` : les commandes que l'utilisateur peut exécuter

par exemple, sur un fichier sudoers par default nous avons :

```
# User privilege specification
root    ALL=(ALL:ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
```
Voici comment la ligne est structurée : `group machine=(utilisateur_cible:groupe_cible) TAGS:commandes`

- **`root`** indique que l'utilisateur root peut exécuter toutes les commandes sur tous les hôtes.
- **`%sudo`** indique que tous les membres du groupe sudo peuvent exécuter toutes les commandes sur tous les hôtes.


```bash
apt install sudo
```

Vous pouvez redémarrer la machine pour valider la configuration, mais ce n'est pas obligatoire.

```bash
reboot
```




## Connection en tant qu'utilisateur

- Si vous avez redeamarrer la machine, vous pouvez vous connecter en tant qu'utilisateur avec les identifiants de votre nouvel utilisateur.

- Si non vous pouvez quitter la session root avec la commande `exit` et vous connecter en tant qu'utilisateur. 

- Vous pouvez aussi vous connecter en tant qu'utilisateur avec la commande `su` :

  ```bash
  su user1
  ```


## Mise à jour du système

Maintenant que nous avons un utilisateur avec les droits d'administration, nous pouvons utiliser des paquets pour administrer le système.

Mettons à jour la liste des paquets disponibles et mettons à jour les paquets installés sur le système.

```bash
sudo apt update 
```

```bash
sudo apt upgrade
```

ou : 
 
```bash
sudo apt update && sudo apt upgrade -y
```

## Nom d'Hôte (hostname) 

- Le nom d'hôte (ou hostname) d'une machine Linux est son identifiant unique au sein d'un réseau. 
- Il permet aux utilisateurs et aux applications de localiser spécifiquement cette machine dans un réseau de plusieurs noeuds. 
- Le nom d’hôte est associé à une adresse IP par le serveurs DNS, vous pouvez donc accéder à un équipement réseau par un nom commun et facile à retenir. 
- De cette façon, vous n’avez pas à rappeler une chaîne de nombres (une adresse IP) pour pour vous y connecter.
- Les noms d'hôte peuvent être simples, comme "ordinateur1", "serveur-web", ou plus complexes, et peuvent inclure des domaines pour former un nom de domaine complet (Fully Qualified Domain Name, FQDN), tel que "ordinateur1.monsite.com".


La commande `hostname` ou `hostnamectl` sont utilisées pour afficher ou modifier le nom d'hôte d'une machine Linux.

Documentation des commandes :
- [hostname](../cmd/systeme/hostname.md) 
- [hostnamectl](../cmd/systeme/hostnamectl.md) 

### Afficher le Nom d'Hôte Actuel

Pour voir l'état actuel et le nom d'hôte du système, plusiers commandes sont possibles, voici quelques exemples:

| | | | |
|---|---|---|---|
`hostnamectl status` | `hostname` | `cat /etc/hostname` | `echo "$HOSTNAME"`


### Modifier le Nom d'Hôte de Manière Permanente

Pour modifier le nom d'hôte de manière permanente sous les systèmes Linux, vous devez modifier certains fichiers de configuration :

1. **Modifier `/etc/hostname`** : Ce fichier contient le nom d'hôte de la machine.

    ```bash
    sudo nano /etc/hostname
    ```

    Remplacez le contenu par le nouveau nom d'hôte.

2. **Modifier `/etc/hosts`** : Ajoutez ou modifiez une entrée pour refléter le nouveau nom d'hôte.

    ```bash
    127.0.0.1   localhost nouveau_nom_dhôte
    ```

3. **Appliquer le Changement** : Pour que le changement prenne effet immédiatement, utilisez `hostnamectl` ou redémarrez le système.

    ```bash
    sudo hostnamectl set-hostname nouveau_nom_dhôte
    ```

### Conseils

- Changer le nom d'hôte peut affecter des applications ou des services qui dépendent du nom d'hôte pour la résolution réseau. Assurez-vous de mettre à jour toutes les configurations nécessaires.
- Après avoir modifié le nom d'hôte, il peut être nécessaire de redémarrer le réseau ou le système pour que tous les services reconnaissent le nouveau nom.


## Installation de quelques paquets de base

```bash
sudo apt install curl wget git util-linux tree
```

### curl

  - [Documentation](../soft/curl.md)
  - **Nom du paquet** : `curl`
  - **Description** : `curl` est un outil en ligne de commande conçu pour transférer des données à partir ou vers un serveur, utilisant divers protocoles tels que HTTP, HTTPS, FTP, FTPS, SCP, SFTP, TFTP, DICT, TELNET, LDAP ou FILE. L'un des usages principaux de `curl` est de télécharger des fichiers ou des pages web à partir d'adresses URL spécifiées. `curl` est célèbre pour sa polyvalence et son support étendu des protocoles, le rendant indispensable pour le scripting réseau et les opérations d'automatisation.
  - **Utilisations typiques** : Télécharger des fichiers, tester des requêtes API REST, envoyer des données vers des serveurs web.

### wget
  
  - [Documentation](../soft/wget.md)
  - **Nom du paquet** : `wget`
  - **Description** : `wget` est un outil en ligne de commande gratuit pour télécharger des fichiers depuis le web. Il supporte le téléchargement via HTTP, HTTPS, et FTP. Une des caractéristiques principales de `wget` est sa capacité à effectuer des téléchargements récursifs, rendant possible le téléchargement d'un site web entier ou de parties de celui-ci. `wget` fonctionne de manière non interactive, permettant son exécution en arrière-plan ou dans des scripts.
  - **Utilisations typiques** : Télécharger des fichiers ou des sites web complets pour une consultation hors ligne, récupérer le contenu de serveurs FTP.
  - 
 **`wget`** excelle dans le téléchargement de contenu web de manière récursive et non interactive, tandis que **`curl`** est plus adapté pour interagir avec des APIs et pour des opérations nécessitant une variété de protocoles.

### git

  - [Documentation](../soft/git.md)
  - **Nom du paquet** : `git`
  - **Description** : `git` est un système de contrôle de version décentralisé conçu pour gérer tout projet, du plus petit au plus grand, avec rapidité et efficacité. `git` est utilisé pour suivre les modifications dans les ensembles de fichiers, coordonner le travail que plusieurs personnes effectuent sur des fichiers partagés, et faciliter le déploiement de versions d'application. Il est essentiel dans le développement de logiciels modernes, permettant aux équipes de collaborer efficacement sur des projets.
  - **Utilisations typiques** : Gestion de versions de code source, collaboration sur des projets de développement logiciel, suivi des modifications et coordination des contributions.

### tree
  
  - [Documentation](../soft/tree.md)
  - **Nom du paquet** : `tree`
  - **Description** : `tree` est un outil en ligne de commande qui permet aux utilisateurs de visualiser la structure de répertoires (dossiers) sous forme d'une arborescence graphique. Chaque branche de l'arbre représente un dossier, et chaque feuille représente un fichier. Cela permet une vue d'ensemble claire et structurée des répertoires et de leur contenu. `tree` est particulièrement utile pour obtenir rapidement un aperçu de la hiérarchie et de la structure d'un projet ou d'un ensemble de fichiers et répertoires. Il offre diverses options pour personnaliser l'affichage, incluant la possibilité de filtrer les fichiers affichés selon des critères spécifiques, de contrôler la profondeur de l'arborescence affichée, et de manipuler la sortie pour des utilisations spécifiques.
  - **Utilisations typiques** : Visualiser la structure de répertoires d'un projet, documenter la hiérarchie de fichiers pour la documentation ou les rapports, filtrer et afficher des types de fichiers spécifiques dans une grande structure de répertoires.

## Terminal (TTY - Teletype Terminal Emulator)

>Sur un système Debian sans environnement de bureau, la première couche avec laquelle vous interagissez lorsque vous tapez une commande est le terminal virtuel (TTY)

<details>
<summary>Terminal et Client Terminal</summary>

Historiquement, un terminal était un appareil matériel qui permettait à un utilisateur d'interagir avec un ordinateur. 

Avec l'avènement des interfaces graphiques et des systèmes d'exploitation modernes, le terme terminal a évolué pour désigner une application logicielle, également connue sous le nom de client terminal ou émulateur de terminal. 

L'émulateur de terminal simule un terminal physique d'antan, traitant les entrées et sorties de texte entre l'utilisateur et le système.

Ces applications simulent le comportement d'un terminal matériel, fournissant une interface en ligne de commande où les utilisateurs peuvent lancer des shells et exécuter des programmes.

</details><br>

>Le termial est connecter au shell qui est un programme qui permet de communiquer avec le noyau du système d'exploitation.

Nous allons changer le shell par défaut qui est bash pour zsh. zsh est un shell plus moderne et plus puissant que bash. Il offre de nombreuses fonctionnalités supplémentaires, telles que la complétion intelligente, la correction orthographique, et la personnalisation avancée.


### Télechargement des scripts d'installation 

#### méthode avec git clone
- Nous allons utiliser git pour télécharger les scripts d'installation.

  La commande git clone permet de copier un dépôt (repository) existant dans un nouveau dossier. Vous aurez acces aux fichiers et à l'historique de version du projet, et vous pourrez contribuer au projet en poussant vos modifications, recupérer les modifications des autres et fusionner les modifications dans votre copie locale.

  Ici le but et juste d'avoir les scripts d'installation.

  ```bash
  git clone "https://github.com/aGrellard/documentations_linux.git" -o ./
  ```

#### méthode avec curl et unzip
- Nous pourrions aussi télécharger les scripts d'installation avec la commande curl :

  ```bash
  curl -L https://github.com/aGrellard/documentations_linux/archive/refs/heads/main.zip -o ./documentations_linux.zip
  ```
  
  - L'option `-L` permet à `curl` de suivre les redirections, ce qui est nécessaire car GitHub peut rediriger la demande vers un emplacement de téléchargement.

  Ensuite nous allons décompresser l'archive en utilisant la commande **`unzip`**:

  - **Nom du paquet** : `unzip`
  - **Description** : `unzip` est un utilitaire en ligne de commande pour l'extraction et la manipulation de fichiers archivés au format ZIP. Il permet aux utilisateurs de décompresser des archives, afficher le contenu d'archives ZIP sans les décompresser, tester des archives pour vérifier l'intégrité des fichiers, et extraire sélectivement des fichiers ou des dossiers d'une archive. `unzip` est largement utilisé pour accéder à des fichiers compressés téléchargés ou partagés via Internet, offrant une méthode simple et efficace pour gérer des archives ZIP sur des systèmes Unix et Linux.
  - **Utilisations typiques** : Extraire le contenu d'archives ZIP, lister le contenu d'archives sans décompression, vérifier l'intégrité des archives ZIP, et extraire sélectivement des composants d'une archive.

  ```bash
  unzip documentations_linux.zip
  ```

  Ensuite vous pouvez supprimer l'archive zip :

  ```bash
  rm documentations_linux.zip
  ```

Déplaçons nous dans le dossier contenant les scripts d'installation avec la commande `cd` :

- Si vous avez cloner le dépôt git :
  ```bash
  cd documentations_linux/_C0_SCRIPTS_LINUX
  ```

- Si vous avez télécharger l'archive zip :
  ```bash
  cd documentations_linux-main/_C0_SCRIPTS_LINUX
  ```

### Rendre les scripts d'installation exécutable

#### `chmod`

##### À quoi sert `chmod +x` ?
- **Rendre un script exécutable** : Si vous avez un script shell (`.sh`), Python (`.py`), ou tout autre script que vous souhaitez exécuter directement comme une commande, vous devez le rendre exécutable avec `chmod +x`.
- **Exécuter des programmes** : Après la compilation d'un programme, pour l'exécuter directement sans utiliser un interpréteur ou un compilateur, vous devez lui donner des permissions d'exécution.
- **Résoudre les problèmes de permissions** : Si vous téléchargez ou recevez un script ou un programme qui est supposé être exécutable mais qui ne l'est pas à cause des permissions de fichier, utiliser `chmod +x` résout ce problème.

##### Exemple
```bash
chmod +x mon_script.sh
```
>Cet exemple rend le script `mon_script.sh` exécutable. Après avoir exécuté cette commande, l'utilisateur peut lancer le script en utilisant `./mon_script.sh` depuis le terminal, à condition d'être dans le même répertoire que le script.

Nous allons donner les **droits d'exécution** aux scripts d'installation :

```bash
chmod +x installation_paquets.sh
chmod +x installation_plugins.sh
```

### Utilisation des scripts d'installation

le script `installation_paquets.sh` va installer les paquets nécessaires pour zsh si il ne sont pas déjà installés (il va aussi installer **tmux** ainsi que **unzip**), il va telecharger l'installateur de ohmyzsh et lancer l'installation de zsh.

Maintenant que nous avons rendu exécutable le script d'installation, nous pouvons lancer le script avec la commande suivante :

```bash
./installation_paquets.sh
```

Maintenant que **zsh** est installé, nous allons installer **ohmyzsh** avec le script `install_ohmyzsh.sh` :

Pour lui aussi il faut donner les droits d'exécution :

```bash
chmod +x install_ohmyzsh.sh
```
```bash
./install_ohmyzsh.sh
```

Pendant l'installation de ohmyzsh, il vous sera demandé si vous voulez **changer le shell par défaut**, répondez oui.

Ensuite le shell zsh sera lancé, vous pouvez le quitter avec la commande `exit` pour revenir au shell bash.

Maintenant nous pouvons telecharger des plugins pour ohmyzsh, pour cela nous allons utiliser le script `installation_plugins.sh` qui va telecharger les plugins suivants : zsh-autosuggestions et zsh-syntax-highlighting, ensuite le script va copier le fichier de configuration zsh que j'utilise dans votre dossier personnel ou se trouve le fichier de configuration zsh.

```bash
./installation_plugins.sh
```

Pour que les changements prennent effet, vous pouvez redémarrer le shell avec la commande `zsh` si vous etes sous le shell bash ou `source ~/.zshrc` si vous étes sous zsh.

Vous pouvez aussi vous déconnecter et vous reconnecter :
  
```bash
exit
```

Le script ìnstallation_paquets.sh a installer tmux qui est un multiplexeur de terminal, il permet de lancer plusieurs terminaux dans une seule fenêtre. Il est très utile pour travailler sur des serveurs distants ou pour diviser l'écran en plusieurs zones de travail.

vous pouvez lancer tmux avec la commande `tmux` et le quitter avec `Ctrl+b` puis `d`.

```bash
tmux
```


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

Obtenir l'UUID des disques

```bash
sudo blkid
```

Ajouter les lignes suivantes dans le fichier `/etc/fstab`

```bash
UUID=XXXX-XXXX /media/usb1 TYPE defaults,auto,users,rw,nofail 0 0
UUID=XXXX-XXXX /media/usb2 TYPE defaults,auto,users,rw,nofail 0 0
```
Test de la configuration

```bash
sudo mount -a
```

Redémarrer la machine pour valider la configuration

```bash
sudo reboot
```

## installation du serveur ssh (si besoin)
  
```bash
sudo apt install openssh-server
```

### Configuration du serveur ssh

```bash
sudo systemctl enable ssh
sudo systemctl start ssh
```

## Création des utilisateurs

```bash
sudo adduser user1
sudo adduser user2
```

## Création des groupes

```bash
sudo addgroup group1
sudo addgroup group2
```

## Ajout des utilisateurs aux groupes

```bash
sudo usermod -aG group1 user1
sudo usermod -aG group2 user2
```


## Installation de samba

- [Documentation](../linux/samba.md)
- [Documentation](../linux/mount_samba.md)

### Installation des outils nécessaires

```bash
sudo apt update && sudo apt install samba samba-common-bin
```

### Création des utilisateurs samba

```bash
sudo smbpasswd -a user1
sudo smbpasswd -a user2
```












## installation du serveur samba

mettre apt a jour

### Installation de samba

```bash
sudo apt install samba samba-common-bin 

