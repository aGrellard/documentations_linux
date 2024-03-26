# Nodejs sous debian12 bookworm

Pour installer Node.js sous Debian 12 (Bookworm), je propose deux méthodes : l'installation via le gestionnaire de paquets APT et l'installation via le script d'installation officiel.

## Installation via le gestionnaire de paquets APT

Debian12 (Bookworm) propose Node.js (Node.js 18 LTS) dans ses dépôts officiels. Pour l'installer, il suffit de mettre à jour la liste des paquets disponibles et d'installer le paquet `nodejs`.

```bash
sudo apt update
```

```bash
sudo apt install nodejs
```

Pour vérifier que Node.js a bien été installé, vous pouvez exécuter la commande suivante :

```bash
node --version
```

## Installation via le script d'installation officiel

Si vous souhaitez installer une version spécifique de Node.js ou si vous préférez utiliser le script d'installation officiel, voici les étapes à suivre.

Prérequis :
- Avoir un système Debian 12 (Bookworm) à jour
- Avoir les droits d'administration (root)
- Avoir installé les paquets suivants :
  - **curl** : (pour télécharger le script)
  - **gpg** : (pour vérifier les signatures)
  - **gnupg2** : (pour gérer les clés GPG)
  - **software-properties-common** : (pour ajouter des dépôts)
  - **apt-transport-https** : (Obsolètes : pour les dépôts HTTPS, maintenant inclus dans APT)
  - **lsb-release** : (pour obtenir des informations sur la distribution)
  - **ca-certificates** : (pour vérifier les certificats SSL)

### 1.  Mettre à jour APT

```bash
sudo apt update && sudo apt dist-upgrade -y
```

### 2. Supprimer les anciens packages PPA. (optionnel)

```bash
sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list
sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list.save
```

### 3. Ajouter le dépôt Node.js

S'assurer que le dossier `/etc/apt/keyrings` existe.

Ajouter la clé GPG du dépôt Node.js avec la commande suivante :

```bash
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
```

Explication de la commande :

- `curl -fsSL` :
  - `-f` : Ne pas afficher les messages d'erreur.
  - `-s` : Mode silencieux.
  - `-S` : Afficher les erreurs si nécessaire.
  - `-L` : Suivre les redirections.
- `https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key` : URL de la clé GPG.
- `|` : Redirige la sortie de la commande précédente vers l'entrée de la commande suivante.
- `sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg` :
  - `sudo` : Exécute la commande en tant qu'administrateur.
    - `gpg --dearmor` : Décode le contenu de l'URL en un fichier binaire.
      - `-o /etc/apt/keyrings/nodesource.gpg` : Nom du fichier de sortie.    


### 4. Insérez le référentiel nodesource.

Déclarer une variable local pour la version de Node.js souhaitée.

```bash
NODE_MAJOR=20
# NODE_MAJOR=18
# NODE_MAJOR=16
```

Insérez le référentiel nodesource.

```bash
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
```

Explication de la commande :

- `sudo` : Exécute la commande en tant qu'administrateur.
- `deb` : Type de dépôt Debian.
- `[signed-by=/etc/apt/keyrings/nodesource.gpg]` : Fichier de signature du dépôt.
- `https://deb.nodesource.com/node_$NODE_MAJOR.x` : URL du dépôt Node.js.
- `nodistro` : Distribution de Node.js.
- `main` : Section principale du dépôt.
- `|` : Redirige la sortie de la commande précédente vers l'entrée de la commande suivante.
- `sudo tee /etc/apt/sources.list.d/nodesource.list` : Écrit la sortie dans le fichier de configuration du dépôt.
- `/etc/apt/sources.list.d/nodesource.list` : Fichier de configuration du dépôt.

### 5. Installer Node.js

```bash
sudo apt update
```

```bash
sudo apt install nodejs
```

### 6. Vérifier l'installation

Pour vérifier que Node.js a bien été installé, vous pouvez exécuter la commande suivante :

```bash
node --version
```




