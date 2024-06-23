À ma dernière mise à jour, `wsdd` est un service qui implémente une partie du protocole de découverte de services Web (WS-Discovery) pour permettre aux systèmes Linux/Unix d'apparaître dans le réseau Windows sur les réseaux qui utilisent le protocole SMB/CIFS. C'est particulièrement utile dans les environnements mixtes où les utilisateurs de Windows veulent voir les partages Samba des machines Unix/Linux dans leur environnement réseau sans avoir à configurer chaque partage manuellement.

## Installation

L'installation de `wsdd` peut varier selon la distribution Linux. Pour les distributions basées sur Debian (comme Ubuntu), vous devrez peut-être télécharger le script depuis le dépôt GitHub officiel et l'exécuter comme un service systemd.

**Étape 1 :** Télécharger `wsdd` :

```bash
wget https://github.com/christgau/wsdd/archive/master.zip
```

**Étape 2 :** Décompressez l'archive et déplacez le script dans un répertoire approprié :

```bash
unzip master.zip
sudo mv wsdd-master/src/wsdd.py /usr/local/bin/wsdd
sudo chmod +x /usr/local/bin/wsdd
```

**Étape 3 :** Créer un service systemd :

1. Créez un fichier `wsdd.service` dans `/etc/systemd/system/`.
2. Ajoutez le contenu suivant :

```ini
[Unit]
Description=Web Services Dynamic Discovery host daemon
After=network.target

[Service]
ExecStart=/usr/local/bin/wsdd --chroot /run/wsdd --uid nobody --gid nogroup

[Install]
WantedBy=multi-user.target
```

3. Activez et démarrez le service :

```bash
sudo systemctl enable wsdd.service
sudo systemctl start wsdd.service
```

## Options de Configuration

Voici les principales options de ligne de commande pour `wsdd` :

- `-i`, `--interface` : Spécifie l'interface réseau à utiliser.
- `-w`, `--workgroup` : Définit le groupe de travail pour les clients non membres d'un domaine AD.
- `-d`, `--domain` : Spécifie le domaine AD auquel wsdd doit prétendre appartenir.
- `-n`, `--hostname` : Définit le nom d'hôte à annoncer.
- `--chroot` : Change le répertoire racine de `wsdd`.
- `--uid` : Définit l'UID avec lequel exécuter `wsdd`.
- `--gid` : Définit le GID avec lequel exécuter `wsdd`.

## Exemples d'Utilisation

### Exécuter wsdd sur une Interface Spécifique

```bash
/usr/local/bin/wsdd --interface eth0
```

### Définir un Groupe de Travail

```bash
/usr/local/bin/wsdd --workgroup WORKGROUP
```

### Utiliser un Domaine AD

Si vous êtes dans un environnement de domaine Active Directory :

```bash
/usr/local/bin/wsdd --domain ad.example.com
```

### Définir un Nom d'Hôte

Pour annoncer un nom d'hôte spécifique :

```bash
/usr/local/bin/wsdd --hostname mon-serveur
```

## Sécurité et Déploiement

- Assurez-vous que les ports nécessaires par WS-Discovery (typiquement le port UDP 3702) sont ouverts dans votre pare-feu.
- Pour des raisons de sécurité, envisagez d'exécuter `wsdd` sous un utilisateur et un groupe système non privilégiés en utilisant les options `--uid` et `--gid`.

## Conclusion

`wsdd` est un outil essentiel dans les environnements réseau mixtes, facilitant la découverte de machines Linux/Unix dans les réseaux Windows. En configurant et en déployant correctement `wsdd`, vous pouvez améliorer l'intégration réseau et la visibilité de vos ressources partagées, rendant l'accès aux fichiers et aux imprimantes plus transparent pour les utilisateurs Windows.