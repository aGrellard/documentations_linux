Pour accéder et naviguer dans un dossier partagé via Samba depuis un terminal Linux, vous devrez monter le partage réseau sur le système de fichiers local. Cela vous permettra d'accéder au partage Samba comme s'il s'agissait d'un dossier local sur votre machine. Voici comment procéder en plusieurs étapes :

### 1. Installation des outils nécessaires

Vous aurez besoin des outils `cifs-utils` pour monter des partages réseau utilisant le protocole SMB/CIFS. Pour l'installer, utilisez la commande correspondante à votre distribution Linux :

- Sur les distributions basées sur Debian/Ubuntu :
  ```sh
  sudo apt update && sudo apt install cifs-utils
  ```

- Sur les distributions basées sur Fedora :
  ```sh
  sudo dnf install cifs-utils
  ```

- Sur les distributions basées sur Arch Linux :
  ```sh
  sudo pacman -S cifs-utils
  ```

### 2. Création d'un point de montage

Créez un dossier local qui servira de point de montage pour le partage Samba :

```sh
mkdir -p ~/samba-partage
```

### 3. Montage du partage Samba

Pour monter le partage, utilisez la commande `mount` avec le protocole cifs. Vous devrez fournir l'URL du partage, le point de montage local, ainsi que les identifiants d'utilisateur si nécessaire :

```sh
sudo mount -t cifs //host.local/partage ~/samba-partage -o username=utilisateur,password=motdepasse
```

Remplacez `utilisateur` et `motdepasse` par vos identifiants de connexion au partage Samba. Si le partage ne requiert pas d'authentification, vous pouvez omettre l'option `-o username=utilisateur,password=motdepasse`.

### Conseils de sécurité :

- **Utilisation d'un fichier de credentials :** Au lieu de passer le nom d'utilisateur et le mot de passe directement dans la commande, il est plus sécurisé de les stocker dans un fichier à part. Créez un fichier (par exemple, `~/.smbcredentials`) avec le contenu suivant :
  ```
  username=utilisateur
  password=motdepasse
  ```
  Ensuite, modifiez la commande de montage pour utiliser ce fichier :
  ```sh
  sudo mount -t cifs //host.local/partage ~/samba-partage -o credentials=~/.smbcredentials, vers=3.0
  ```
  Assurez-vous que ce fichier a des permissions restrictives pour éviter les accès non autorisés :
  ```sh
  chmod 600 ~/.smbcredentials
  ```

- **Démontage du partage :** Lorsque vous avez terminé, n'oubliez pas de démonter le partage pour éviter tout accès non sécurisé :
  ```sh
  sudo umount ~/samba-partage
  ```

- **Automatisation :** Pour monter automatiquement le partage au démarrage, vous pouvez ajouter une entrée dans le fichier `/etc/fstab`. Notez que cela peut présenter des risques de sécurité, notamment si vous stockez des identifiants en clair dans ce fichier. Utilisez cette méthode avec prudence.

Suivez ces étapes pour accéder et naviguer dans un dossier partagé via Samba depuis la console Linux.