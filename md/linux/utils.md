- [Programmes Utils sous Linux](#programmes-utils-sous-linux)
  - [Gestion des Utilisateurs](#gestion-des-utilisateurs)
    - [`id`](#id)
    - [`su`](#su)
    - [`whoami`](#whoami)
  - [Manipulation de Texte](#manipulation-de-texte)
    - [`xclip`](#xclip)
    - [`pandoc`](#pandoc)
  - [Personnalisation et Productivité](#personnalisation-et-productivité)
    - [`screen` / `tmux`](#screen--tmux)
    - [`alias`](#alias)
    - [`cron`](#cron)
  - [Shells Alternatifs](#shells-alternatifs)
    - [`zsh`](#zsh)
  - [Navigation Web en Ligne de Commande](#navigation-web-en-ligne-de-commande)
    - [`lynx`](#lynx)
  - [Surveillance et Maintenance](#surveillance-et-maintenance)
    - [`journalctl`](#journalctl)
    - [`du`](#du)
    - [`df`](#df)
  - [Surveillance et Analyse du Système](#surveillance-et-analyse-du-système)
    - [`htop`](#htop)
    - [`iotop`](#iotop)
    - [`nmon`](#nmon)
    - [`dmesg`](#dmesg)
    - [`lsof`](#lsof)
  - [Gestion de Paquets](#gestion-de-paquets)
    - [`apt` (pour Debian, Ubuntu et dérivés)](#apt-pour-debian-ubuntu-et-dérivés)
    - [`yum` (pour CentOS, RHEL)](#yum-pour-centos-rhel)
    - [`dnf` (pour Fedora)](#dnf-pour-fedora)
  - [Sécurité](#sécurité)
    - [`iptables`](#iptables)
    - [`chmod` / `chown`](#chmod--chown)
    - [`fail2ban`](#fail2ban)
    - [`ufw`](#ufw)
  - [Archivage et Compression](#archivage-et-compression)
    - [`tar`](#tar)
    - [`gzip` / `bzip2`](#gzip--bzip2)
  - [Recherche et Triage](#recherche-et-triage)
    - [`grep`](#grep)
    - [`find`](#find)
    - [`sed`](#sed)
    - [`awk`](#awk)
    - [`sort`](#sort)
    - [`uniq`](#uniq)
  - [requette http](#requette-http)
    - [`wget`](#wget)
    - [`curl`](#curl)
  - [Connectivité](#connectivité)
    - [`ssh`](#ssh)
    - [`scp`](#scp)
    - [`rsync`](#rsync)
  - [Développement et Monitoring Réseau](#développement-et-monitoring-réseau)
    - [`netstat`](#netstat)
    - [`ping`](#ping)
    - [`traceroute` / `tracepath`](#traceroute--tracepath)
  - [Développement et Débogage](#développement-et-débogage)
    - [`git`](#git)
    - [`vim` / `nano`](#vim--nano)
    - [`gdb`](#gdb)
  - [Gestion de Versions](#gestion-de-versions)
    - [`git`](#git-1)
  - [Edition de Texte](#edition-de-texte)
    - [`nano` / `vim`](#nano--vim)
  - [Surveillance de Logs](#surveillance-de-logs)
    - [`tail`](#tail)
    - [`journalctl`](#journalctl-1)
  - [Manipulation d'Images Disque](#manipulation-dimages-disque)
    - [`dd`](#dd)
  - [Compression et Archivage](#compression-et-archivage)
    - [`zip` / `unzip`](#zip--unzip)
  - [Sécurité et Chiffrement](#sécurité-et-chiffrement)
    - [`gpg`](#gpg)
  - [Virtualisation](#virtualisation)
    - [`docker`](#docker)
    - [`virtualbox`](#virtualbox)


# Programmes Utils sous Linux

## Gestion des Utilisateurs

### `id`

- **Utilité** : Affiche les identifiants de l'utilisateur courant ou d'un utilisateur spécifié, y compris UID, GID, et appartenance aux groupes.
- **Commande** : `id [nom_utilisateur]`

### `su`

- **Utilité** : Permet de changer l'identité de l'utilisateur courant, souvent utilisé pour obtenir les privilèges du superutilisateur.
- **Commande** : `su - [nom_utilisateur]`

### `whoami`

- **Utilité** : Affiche le nom de l'utilisateur courant.
- **Commande** : `whoami`

## Manipulation de Texte

### `xclip`

- **Utilité** : Permet de copier du texte dans le presse-papier depuis la ligne de commande.
- **Commande** : `echo "texte" | xclip -selection clipboard`

### `pandoc`

- **Utilité** : Un convertisseur de documents permettant de transformer des fichiers Markdown, HTML, LaTeX, et d'autres formats de texte.
- **Commande** : `pandoc fichier_source -o fichier_destination`

## Personnalisation et Productivité

### `screen` / `tmux`

- **Utilité** : Multiplexeurs de terminal qui permettent à l'utilisateur de travailler avec plusieurs fenêtres de terminal dans une session unique. `tmux` offre des fonctionnalités plus riches par rapport à `screen`.
- **Commande** : `tmux` ou `screen`

### `alias`

- **Utilité** : Permet de créer des alias, c'est-à-dire des raccourcis pour des commandes longues ou complexes.
- **Exemple** : Ajouter `alias ll='ls -la'` dans `.bashrc` ou `.zshrc` pour créer un raccourci pour `ls -la`.

### `cron`

- **Utilité** : Planificateur de tâches qui exécute des scripts ou des commandes à des moments spécifiés.
- **Configuration** : Éditez la table de cron avec `crontab -e` pour ajouter, modifier ou supprimer des tâches planifiées.

## Shells Alternatifs

### `zsh`

- **Utilité** : Un interpréteur de commandes puissant et extensible souvent utilisé avec le framework de configuration `oh-my-zsh`.
- **Installation** : `sudo apt-get install zsh`

## Navigation Web en Ligne de Commande

### `lynx`

- **Utilité** : Un navigateur Web en mode texte permettant de naviguer sur Internet directement depuis le terminal.
- **Commande** : `lynx [URL]`

## Surveillance et Maintenance

### `journalctl`

- **Utilité** : Partie du système `systemd`, cet outil permet de consulter et d'analyser les journaux système.
- **Commande** : `journalctl -u nom_du_service`

### `du`

- **Utilité** : Outil pour estimer l'espace disque utilisé par les fichiers/dossiers.
- **Commande** : `du -sh /chemin/dossier`

### `df`

- **Utilité** : Affiche l'utilisation du disque par les systèmes de fichiers montés.
- **Commande** : `df -h`

## Surveillance et Analyse du Système

### `htop`

- **Utilité** : Une version améliorée de `top`, offrant une vue interactive des processus en cours d'exécution et de l'utilisation des ressources système.
- **Commande** : `htop`

### `iotop`

- **Utilité** : Outil pour surveiller l'utilisation du disque par les processus, utile pour diagnostiquer la lenteur du système liée aux opérations d'entrée/sortie.
- **Commande** : `sudo iotop`

### `nmon`

- **Utilité** : Outil de performance système qui affiche les statistiques CPU, mémoire, réseau, disque, et autres en temps réel.
- **Commande** : `nmon`

### `dmesg`

- **Utilité** : Affiche les messages du noyau, utile pour le diagnostic de matériel et les problèmes de démarrage.
- **Commande** : `dmesg | less`

### `lsof`

- **Utilité** : Liste les fichiers ouverts et les processus qui les ont ouverts.
- **Commande** : `lsof /chemin/fichier`
  
## Gestion de Paquets

### `apt` (pour Debian, Ubuntu et dérivés)

- **Utilité** : Outil de gestion de paquets pour les systèmes basés sur Debian, permettant d'installer, mettre à jour et supprimer des logiciels.
- **Commandes** : 
  - Installer un paquet : `sudo apt install nom_paquet`
  - Mettre à jour la liste des paquets : `sudo apt update`
  - Mettre à jour les paquets : `sudo apt upgrade`

### `yum` (pour CentOS, RHEL)

- **Utilité** : Outil de gestion de paquets pour les distributions basées sur Red Hat.
- **Commandes** :
  - Installer un paquet : `sudo yum install nom_paquet`
  - Mettre à jour tous les paquets : `sudo yum update`

### `dnf` (pour Fedora)

- **Utilité** : Le successeur de `yum`, offrant une gestion de paquets améliorée pour Fedora.
- **Commandes** :
  - Installer un paquet : `sudo dnf install nom_paquet`
  - Mettre à jour tous les paquets : `sudo dnf upgrade`

## Sécurité

### `iptables`

- **Utilité** : Outil de filtrage de paquets. `iptables` permet de configurer les règles de firewall au sein du système.
- **Commande** : `sudo iptables -L` pour lister les règles actuelles.

### `chmod` / `chown`

- **Utilité** : Commandes pour modifier les permissions et la propriété des fichiers et répertoires, essentielles pour la sécurisation des données.
- **Commandes** : 
  - `chmod 755 fichier` pour définir les permissions.
  - `chown utilisateur:groupe fichier` pour changer la propriété.
  
### `fail2ban`

- **Utilité** : Protège le système contre les attaques par force brute en bannissant les adresses IP qui tentent de se connecter de manière répétée et échouée.
- **Installation** : `sudo apt install fail2ban` (sur les systèmes basés sur Debian/Ubuntu)

### `ufw`

- **Utilité** : Interface utilisateur simplifiée pour `iptables`, permettant de gérer facilement un pare-feu.
- **Commandes** :
  - Activer ufw : `sudo ufw enable`
  - Autoriser un port : `sudo ufw allow 22`

## Archivage et Compression

### `tar`

- **Utilité** : Outil d'archivage qui permet de regrouper plusieurs fichiers et répertoires en un seul fichier archive `.tar` ou `.tar.gz`.
- **Commandes** :
  - Créer une archive : `tar -cvzf archive.tar.gz /chemin/vers/dossier`
  - Extraire une archive : `tar -xvzf archive.tar.gz`

### `gzip` / `bzip2`

- **Utilité** : Outils de compression de fichiers, avec `bzip2` offrant généralement un taux de compression supérieur à `gzip`.
- **Commandes** :
  - Compresser : `gzip fichier` ou `bzip2 fichier`
  - Décompresser : `gunzip fichier.gz` ou `bunzip2 fichier.bz2`

## Recherche et Triage

### `grep`

- **Utilité** : Recherche des motifs dans le texte. Utile pour trouver des lignes correspondant à un motif dans des fichiers.
- **Commande** : `grep "motif" fichier`

### `find`

- **Utilité** : Recherche de fichiers et de répertoires dans l'arborescence du système de fichiers basée sur divers critères.
- **Commande** : `find /chemin/de/recherche -type f -name "nom_fichier"`

### `sed`

- **Utilité** : L'éditeur de flux pour la transformation de texte. `sed` est extrêmement puissant pour manipuler les fichiers texte de manière programmatique.
- **Commande** : `sed 's/ancien/nouveau/g' fichier`

### `awk`

- **Utilité** : Langage de programmation conçu pour le traitement et l'analyse de fichiers texte. Excellent pour manipuler des données tabulaires.
- **Commande** : `awk '{if ($1 > 100) print $0}' fichier`

### `sort`

- **Utilité** : Trie les lignes d'un fichier texte.
- **Commande** : `sort fichier`

### `uniq`

- **Utilité** : Supprime ou signale les lignes répétées d'un fichier.
- **Commande** : `uniq fichier`

## requette http

### `wget`

- **Utilité** : Outil de téléchargement de fichiers depuis le web.
- **Commande** : `wget [URL]`

### `curl`

- **Utilité** : Outil pour transférer des données depuis ou vers un serveur, utilisé avec de nombreux protocoles.
- **Commande** : `curl [URL]`

## Connectivité

### `ssh`

- **Utilité** : Programme pour se connecter à distance à une autre machine via le protocole SSH.
- **Commande** : `ssh utilisateur@hôte`

### `scp`

- **Utilité** : Permet de copier des fichiers entre des hôtes sur un réseau en utilisant le protocole SSH.
- **Commande** : `scp fichier_source utilisateur@hôte:destination`

### `rsync`

- **Utilité** : Outil de synchronisation de fichiers/dossiers, optimisé pour minimiser la quantité de données transférées.
- **Commande** : `rsync options source destination`

## Développement et Monitoring Réseau

### `netstat`

- **Utilité** : Affiche les connexions réseau, les tables de routage, les statistiques d'interface, les connexions masquées, et plus encore.
- **Commande** : `netstat -tuln`

### `ping`

- **Utilité** : Vérifie la connectivité réseau avec un hôte spécifique. Utile pour diagnostiquer les problèmes de réseau.
- **Commande** : `ping adresse_ip_ou_domaine`

### `traceroute` / `tracepath`

- **Utilité** : Affiche la route empruntée par les paquets pour atteindre un hôte réseau. `traceroute` offre plus d'options, tandis que `tracepath` ne nécessite pas de privilèges élevés.
- **Commande** : `traceroute adresse_ip_ou_domaine` ou `tracepath adresse_ip_ou_domaine`

## Développement et Débogage

### `git`

- **Utilité** : Système de contrôle de version décentralisé pour suivre les modifications dans les fichiers et coordonner le travail entre plusieurs personnes.
- **Commande** : `git clone https://url_du_repository.git`

### `vim` / `nano`

- **Utilité** : Éditeurs de texte en ligne de commande. `vim` est puissant mais a une courbe d'apprentissage plus élevée, tandis que `nano` est plus accessible pour les débutants.
- **Commande** : `vim fichier` ou `nano fichier`

### `gdb`

- **Utilité** : Le GNU Debugger, un outil puissant pour le débogage de programmes écrits en C, C++, et d'autres langages.
- **Commande** : `gdb ./programme`
  
## Gestion de Versions

### `git`

- **Utilité** : Système de contrôle de version décentralisé essentiel pour la gestion de code source et de projets de développement.
- **Commande** : `git clone url_du_dépôt`

## Edition de Texte

### `nano` / `vim`

- **Utilité** : Éditeurs de texte en ligne de commande. `nano` est plus simple et convivial pour les débutants, tandis que `vim` est plus puissant mais a une courbe d'apprentissage plus raide.
- **Commandes** : 
  - `nano fichier`
  - `vim fichier`

## Surveillance de Logs

### `tail`

- **Utilité** : Affiche les dernières lignes d'un fichier texte, souvent utilisé pour surveiller les fichiers de log en temps réel.
- **Commande** : `tail -f /chemin/vers/fichier.log`

### `journalctl`

- **Utilité** : Utilitaire pour interroger et afficher les logs du système journalisés par systemd.
- **Commande** : `journalctl -u nom_du_service`

## Manipulation d'Images Disque

### `dd`

- **Utilité** : Copie et convertit des fichiers bloc par bloc. Utilisé pour créer des images disque, cloner des partitions, etc.
- **Commande** : `dd if=/chemin/vers/source of=/chemin/vers/destination bs=taille_bloc`

## Compression et Archivage

### `zip` / `unzip`

- **Utilité** : Outils pour compresser des fichiers et répertoires en archives `.zip` et pour extraire le contenu d'archives `.zip`.
- **Commandes** :
  - `zip -r archive.zip /chemin/vers/répertoire`
  - `unzip archive.zip`

## Sécurité et Chiffrement

### `gpg`

- **Utilité** : GNU Privacy Guard, outil pour le chiffrement et la signature de données. 
- **Commande** : `gpg -c fichier` pour chiffrer ou `gpg fichier.gpg` pour déchiffrer.

## Virtualisation

### `docker`

- **Utilité** : Plateforme de conteneurisation permettant de développer, déployer et exécuter des applications dans des conteneurs.
- **Commande** : `docker run image`

### `virtualbox`

- **Utilité** : Logiciel de virtualisation pour exécuter plusieurs systèmes d'exploitation simultanément.
- **Installation** : Souvent disponible dans les dépôts de logiciels de votre distribution.
