# Tutoriel et Documentation Complète sur Samba

## Introduction

Samba est une suite logicielle open-source qui permet le partage de fichiers et d'imprimantes entre systèmes Unix/Linux et Windows. Elle implémente le protocole SMB/CIFS et fournit une intégration transparente entre ces systèmes d'exploitation différents.

## Installation

**Debian/Ubuntu :**

```bash
sudo apt update
sudo apt install samba
```

**Fedora :**

```bash
sudo dnf install samba
```

**CentOS/RHEL :**

```bash
sudo yum install samba
```

## Configuration Principale : smb.conf

Le fichier de configuration principal de Samba est `/etc/samba/smb.conf`. Il est divisé en plusieurs sections :

- `[global]` : Paramètres généraux applicables à tout Samba.
- Sections dédiées à chaque partage, par exemple `[homes]` pour les répertoires personnels ou `[printers]` pour les partages d'imprimantes.

### Options Globales Communes

- `workgroup` : Nom du groupe de travail ou du domaine.
- `server string` : Description du serveur.
- `security` : Mode de sécurité (`user`, `share`, `domain`).
- `map to guest` : Comportement pour les utilisateurs invités.
- `log file` : Emplacement du fichier de log.

### Exemple de Configuration Minimale

```ini
[global]
   workgroup = WORKGROUP
   server string = Samba Server
   security = user
   map to guest = Bad User
   log file = /var/log/samba/log.%m
   max log size = 50

[homes]
   comment = Home Directories
   browseable = no
   writable = yes
   valid users = %S
```

## Gestion des Utilisateurs Samba

Pour qu'un utilisateur puisse accéder aux partages Samba, il doit avoir un compte système et un compte Samba. Pour ajouter un utilisateur à Samba :

```bash
sudo smbpasswd -a username
```

Pour activer/désactiver un utilisateur :

```bash
sudo smbpasswd -e username
sudo smbpasswd -d username
```

## Exemples de Configuration de Partage

### Partage Simple

```ini
[shared]
   path = /srv/samba/shared
   writable = yes
   guest ok = yes
   guest only = yes
   create mask = 0777
   directory mask = 0777
```

### Partage Sécurisé

```ini
[secure]
   path = /srv/samba/secure
   writable = yes
   valid users = @samba
   guest ok = no
```

## Commandes Utiles

- **Vérifier la Configuration** : `testparm`
- **Lister les Partages** : `smbclient -L localhost -U%`
- **Redémarrer le Service Samba** :

  ```bash
  sudo systemctl restart smbd
  sudo systemctl restart nmbd
  ```

## Sécurité et Maintenance

- **Mises à jour régulières** : Gardez Samba et votre système d'exploitation à jour.
- **Gestion des accès** : Utilisez les options `valid users` et `write list` pour contrôler l'accès.
- **Sécurisation des communications** : Considérez l'utilisation de `smb encrypt` pour sécuriser les échanges entre clients et serveur.

## Conclusion

Samba est un outil essentiel pour la mise en place de partages de fichiers et d'imprimantes entre systèmes Unix/Linux et Windows. Une bonne compréhension de son fichier de configuration `smb.conf` et une gestion appropriée des utilisateurs Samba sont cruciales pour sécuriser et optimiser votre environnement de partage.****