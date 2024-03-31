# utilisateurs-samba

## Ajouter des Utilisateurs Système pour les Partages Samba

Pour ajouter des utilisateurs système destinés à être utilisés uniquement pour un partage Samba, sans leur donner d'accès physique au serveur, vous pouvez suivre ces étapes sous un système d'exploitation Linux. Cela permettra aux utilisateurs de s'authentifier pour accéder aux partages Samba, mais ils n'auront pas de shell interactif sur le serveur Linux lui-même.

### Étape 1: Ajouter un utilisateur système

1. **Ouvrir un terminal** ou se connecter à votre serveur via SSH.

2. **Ajouter un nouvel utilisateur système**. Pour cela, utilisez la commande `useradd` avec l'option `-r` (qui crée un compte système) et l'option `-s /usr/sbin/nologin` (qui empêche l'utilisateur de se connecter au serveur). Vous pouvez aussi utiliser l'option `-M` pour ne pas créer de répertoire home, si ce n'est pas nécessaire.

   ```bash
   sudo useradd -r -s /usr/sbin/nologin -M nom_utilisateur
   ```

   Remplacez `nom_utilisateur` par le nom de l'utilisateur système que vous souhaitez ajouter.

### Étape 2: Définir un mot de passe pour l'utilisateur Samba

Même si l'utilisateur n'a pas de shell interactif sur le serveur, vous devez définir un mot de passe Samba pour lui. Ce mot de passe sera utilisé pour s'authentifier sur les partages Samba.

1. **Définir le mot de passe Samba**. Utilisez la commande `smbpasswd` pour ajouter un mot de passe à l'utilisateur dans la base de données Samba.

   ```bash
   sudo smbpasswd -a nom_utilisateur
   ```

   Vous serez invité à entrer et confirmer le mot de passe pour l'utilisateur.

### Étape 3: Configurer les partages Samba

Assurez-vous que votre configuration Samba (/etc/samba/smb.conf) est correcte et inclut l'utilisateur ou le groupe d'utilisateurs système que vous avez créé, selon vos besoins spécifiques de partage.

1. **Ouvrez le fichier de configuration Samba** avec votre éditeur préféré (par exemple, nano ou vim).

   ```bash
   sudo nano /etc/samba/smb.conf
   ```

2. **Ajoutez ou modifiez la section du partage** pour inclure l'option `valid users` avec le nom de l'utilisateur système que vous avez ajouté. Cela limitera l'accès au partage aux utilisateurs spécifiés.

   ```
   [nom_partage]
   path = /chemin/vers/dossier/partage
   valid users = nom_utilisateur
   read only = No
   ```

3. **Redémarrez le service Samba** pour appliquer les changements.

   ```bash
   sudo systemctl restart smbd
   ```

Cette configuration vous permet d'ajouter des utilisateurs système dédiés à l'utilisation des partages Samba, sans leur donner d'accès au serveur lui-même. Veillez à sécuriser votre serveur et vos partages Samba en suivant les meilleures pratiques de sécurité.