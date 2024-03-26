- [installation de vscode sous debian 12 bookworm](#installation-de-vscode-sous-debian-12-bookworm)
  - [Installation via le gestionnaire de paquets APT](#installation-via-le-gestionnaire-de-paquets-apt)
    - [GPG (GNU Privacy Guard)](#gpg-gnu-privacy-guard)
    - [software-properties-common](#software-properties-common)
    - [Wget](#wget)
    - [installation des paquets](#installation-des-paquets)
    - [1. Ajouter le dépôt Microsoft](#1-ajouter-le-dépôt-microsoft)
    - [2. Ajouter le dépôt VSCode](#2-ajouter-le-dépôt-vscode)
    - [3. Installer Visual Studio Code](#3-installer-visual-studio-code)
  - [Installation via le script d'installation officiel](#installation-via-le-script-dinstallation-officiel)
    - [1. Télécharger le paquet .deb de VSCode](#1-télécharger-le-paquet-deb-de-vscode)
    - [2. Installer le paquet .deb](#2-installer-le-paquet-deb)
    - [3. Nettoyer les fichiers temporaires](#3-nettoyer-les-fichiers-temporaires)



# installation de vscode sous debian 12 bookworm

Pour installer Visual Studio Code (VSCode) sous Debian 12 (Bookworm), je propose deux méthodes : l'installation via le gestionnaire de paquets APT et l'installation via le script d'installation officiel.

## Installation via le gestionnaire de paquets APT

prérequis :
- Avoir un système Debian 12 (Bookworm) à jour
- Avoir les droits d'administration (root)
- Avoir installé les paquest suivant :
  - wget
  - gpg
  - software-properties-common

### GPG (GNU Privacy Guard)

- **Nom du paquet** : `gnupg` ou `gpg`
- **Description** : GPG est l'implémentation GNU du standard OpenPGP (RFC 4880) pour le chiffrement et la signature de données. GPG permet de chiffrer et de signer vos communications et vos documents, de gérer vos clés et celles d'autres personnes avec lesquelles vous communiquez, et d'accéder à des réseaux de distribution de clés publiques. Il est largement utilisé pour sécuriser les échanges d'informations, vérifier l'intégrité et l'authenticité des logiciels (via la vérification des signatures numériques) et pour l'encryption de fichiers et de communications.
- **Utilisations typiques** : Chiffrement de courriels, signature de code, vérification d'authenticité des paquets logiciels, gestion des clés de chiffrement.

### software-properties-common

- **Nom du paquet** : `software-properties-common`
- **Description** : `software-properties-common` fournit un ensemble d'outils de gestion de la configuration des sources des paquets logiciels pour Ubuntu et d'autres distributions basées sur Debian. Ce paquet contient les outils nécessaires pour ajouter, supprimer et gérer les dépôts de logiciels, ainsi que pour gérer les clés GPG associées aux dépôts de logiciels. Il inclut des outils en ligne de commande tels que `add-apt-repository`, qui est fréquemment utilisé pour ajouter des PPA (Personal Package Archives) à la liste des sources de logiciels, et `apt-key` pour la gestion des clés d'authentification des dépôts.
- **Utilisations typiques** : Ajout et gestion des dépôts de logiciels et des PPA, ajout de clés GPG pour la vérification de l'intégrité et de l'authenticité des dépôts, configuration des sources de mises à jour logicielles.

Ces deux paquets jouent des rôles clés dans la gestion de la sécurité et des sources de logiciels sur les systèmes Linux, en particulier ceux basés sur Debian et Ubuntu, en facilitant une gestion sécurisée et flexible des paquets logiciels et de leur provenance.

### Wget

- **Nom du paquet** : `wget`
- **Description** : `wget` est un utilitaire de ligne de commande non interactif pour le téléchargement de fichiers depuis le web. Il supporte le téléchargement via les protocoles HTTP, HTTPS et FTP. Une des caractéristiques les plus notables de `wget` est sa capacité à effectuer des téléchargements récursifs, lui permettant de miroiter des sites Web entiers ou de télécharger des séquences de fichiers. `wget` est hautement configurable, offrant des options pour ajuster presque tous les aspects de ses opérations de téléchargement, y compris la personnalisation des en-têtes HTTP, le passage à travers des proxy, et la reprise des téléchargements interrompus.
- **Utilisations typiques** : Téléchargement de fichiers individuels ou en masse depuis Internet, création de miroirs de sites Web pour une consultation hors ligne, automatisation de téléchargements via des scripts.

`wget` est extrêmement utile dans des scénarios où vous avez besoin de télécharger des fichiers automatiquement ou en batch, comme dans le cadre de scripts ou lors de l'installation de logiciels sur des serveurs sans interface graphique. Sa capacité à reprendre des téléchargements interrompus et à miroiter des sites entiers en fait un outil précieux pour la récupération de données et la gestion de contenu web.

### installation des paquets
    
```bash
sudo apt update
```

```bash
sudo apt install wget gpg software-properties-common
```

### 1. Ajouter le dépôt Microsoft
    
```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
```

Expliquation de la commande :
- `wget -qO- URL` : Télécharge le contenu de l'URL et l'affiche sur la sortie standard.
- `|` : Redirige la sortie de la commande précédente vers l'entrée de la commande suivante.
- `gpg --dearmor` : Décode le contenu de l'URL en un fichier binaire.
- `>` : Redirige la sortie de la commande précédente vers un fichier.
- `packages.microsoft.gpg` : Nom du fichier de sortie.

```bash
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
```

Expliquation de la commande :
- `install` : Copie des fichiers et définit les attributs.
- `-o root` : Définit le propriétaire du fichier.
- `-g root` : Définit le groupe du fichier.
- `-m 644` : Définit les permissions du fichier.
- `packages.microsoft.gpg` : Fichier source.
- `/etc/apt/keyrings/packages.microsoft.gpg` : Répertoire de destination.

### 2. Ajouter le dépôt VSCode

```bash
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
```
Expliquation de la commande :
- `sudo` : Exécute la commande en tant qu'administrateur.
- `sh -c 'commande'` : Exécute une commande dans un nouveau shell.
  - `echo "texte" > fichier` : Écrit le texte dans le fichier.
  - `deb` : Type de dépôt Debian.
  - `[arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg]` : Architecture et signature du dépôt.
  - `https://packages.microsoft.com/repos/code` : URL du dépôt.
  - `stable` : Version stable du dépôt.
  - `main` : Section principale du dépôt.
  - `>` : Redirige la sortie de la commande précédente vers un fichier.
  - `/etc/apt/sources.list.d/vscode.list` : Fichier de configuration du dépôt.

```bash
rm -f packages.microsoft.gpg
```

### 3. Installer Visual Studio Code

```bash
sudo apt update
```

```bash
sudo apt install code
```

## Installation via le script d'installation officiel

Prérequis :
- Avoir un système Debian 12 (Bookworm) à jour
- Avoir les droits d'administration (root)
- Avoir installé les paquets suivants :
  - wget
- Avoit telecharger le paquet .deb de vscode

### 1. Télécharger le paquet .deb de VSCode

```bash
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
```

### 2. Installer le paquet .deb

```bash
sudo apt install ./code_*.deb
```

### 3. Nettoyer les fichiers temporaires

```bash
rm -f code_*.deb
```





