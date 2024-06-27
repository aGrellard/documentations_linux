Pour utiliser un ancien commit dans une nouvelle branche sur GitHub, vous pouvez suivre ces étapes :

1. **Cloner le dépôt si ce n'est pas déjà fait** :
    ```bash
    git clone https://github.com/utilisateur/repository.git
    cd repository
    ```

2. **Lister les commits pour trouver l'ancien commit que vous souhaitez utiliser** :
    ```bash
    git log
    ```
    Notez l'ID du commit (un long hash).

3. **Créer et basculer sur une nouvelle branche** :
    ```bash
    git checkout -b nouvelle-branche
    ```

4. **Réinitialiser la nouvelle branche sur l'ancien commit** :
    ```bash
    git reset --hard <commit-id>
    ```
    Remplacez `<commit-id>` par l'ID du commit que vous avez noté.

5. **Pousser la nouvelle branche vers GitHub** :
    ```bash
    git push origin nouvelle-branche
    ```

### Exemple complet

1. Cloner le dépôt :
    ```bash
    git clone https://github.com/utilisateur/repository.git
    cd repository
    ```

2. Lister les commits et noter l'ID de l'ancien commit :
    ```bash
    git log
    ```

3. Créer et basculer sur une nouvelle branche :
    ```bash
    git checkout -b ancienne-version
    ```

4. Réinitialiser la nouvelle branche sur l'ancien commit :
    ```bash
    git reset --hard abcdef1234567890
    ```

5. Pousser la nouvelle branche vers GitHub :
    ```bash
    git push origin ancienne-version
    ```

Cela créera une nouvelle branche `ancienne-version` basée sur l'ancien commit spécifié. Vous pouvez maintenant travailler sur cette branche comme vous le feriez normalement.

#######################
#######################
#######################
#######################
#######################


Lorsque vous montez une partition Windows (NTFS) sous Debian, il se peut que vous rencontriez des problèmes de permissions qui vous empêchent de supprimer des dossiers ou des fichiers. Voici quelques raisons possibles et solutions pour ce problème :

### 1. **Problèmes de Permissions NTFS**
Le système de fichiers NTFS utilise un modèle de permissions différent de celui de Linux, ce qui peut entraîner des conflits.

#### Solution :
- Montez la partition NTFS avec les bonnes options pour les permissions. Par exemple, vous pouvez utiliser `ntfs-3g` avec les options `uid`, `gid`, `umask`, `dmask`, et `fmask` pour définir les permissions correctes.

  ```bash
  sudo mount -t ntfs-3g -o uid=1000,gid=1000,umask=0022 /dev/sdXN /mnt/windows
  ```

  - `uid=1000` : Définit l'UID de l'utilisateur propriétaire (remplacez `1000` par votre UID).
  - `gid=1000` : Définit le GID du groupe propriétaire (remplacez `1000` par votre GID).
  - `umask=0022` : Définit le masque de permission par défaut pour les fichiers et dossiers.

### 2. **Partition NTFS en État Sale (Dirty State)**
Si Windows n'a pas été correctement arrêté ou si la partition NTFS est marquée comme étant en état sale, vous ne pourrez pas écrire sur cette partition sous Linux.

#### Solution :
- Démarrez sur Windows et faites un redémarrage complet pour assurer que la partition NTFS est correctement démontée.
- Utilisez `ntfsfix` pour réparer la partition NTFS sous Linux :

  ```bash
  sudo ntfsfix /dev/sdXN
  ```

### 3. **Problèmes de Montage**
Assurez-vous que la partition est montée avec les permissions de lecture et écriture.

#### Solution :
- Vérifiez les options de montage actuelles avec `mount` :

  ```bash
  mount | grep /dev/sdXN
  ```

- Si nécessaire, démontez et remontez la partition avec les options correctes.

  ```bash
  sudo umount /mnt/windows
  sudo mount -t ntfs-3g /dev/sdXN /mnt/windows
  ```

### 4. **Fast Startup de Windows**
Windows 10 a une fonctionnalité appelée "Fast Startup" qui ne démonte pas complètement le système de fichiers NTFS lors de l'arrêt, ce qui peut empêcher des écritures sous Linux.

#### Solution :
- Désactivez le "Fast Startup" dans Windows :
  - Allez dans Panneau de configuration > Options d'alimentation > Choisir ce que font les boutons d’alimentation > Modifier des paramètres actuellement non disponibles > Désactivez l'option "Activer le démarrage rapide".

En suivant ces étapes, vous devriez être en mesure de monter et d'interagir avec votre partition NTFS depuis Debian sans problème de permissions.


Le message d'erreur que vous voyez indique que la partition NTFS n'a pas été correctement démontée et est dans un état "sale". Voici les étapes que vous pouvez suivre pour résoudre ce problème :

### 1. **Redémarrage complet de Windows**

Assurez-vous que Windows est complètement arrêté sans utiliser l'hibernation ou le démarrage rapide.

1. Démarrez dans Windows.
2. Désactivez le démarrage rapide :
   - Allez dans **Panneau de configuration** > **Options d'alimentation** > **Choisir ce que font les boutons d’alimentation** > **Modifier des paramètres actuellement non disponibles**.
   - Décochez l'option **Activer le démarrage rapide**.
3. Arrêtez Windows en utilisant l'option de **Redémarrage** pour vous assurer que Windows ne met pas en hibernation les partitions :
   - Appuyez sur **Shift** et cliquez sur **Arrêter** ou **Redémarrer**.

### 2. **Utiliser `ntfsfix` sous Linux**

1. Redémarrez dans votre système Debian.
2. Utilisez `ntfsfix` pour essayer de réparer le système de fichiers NTFS.

   ```bash
   sudo ntfsfix /dev/sdXN
   ```

   Remplacez `/dev/sdXN` par la partition appropriée (par exemple, `/dev/sda1`).

### 3. **Démonter et remonter la partition**

Une fois que `ntfsfix` a réparé le système de fichiers, vous pouvez essayer de démonter et remonter la partition avec les permissions de lecture et écriture.

1. Démontage :

   ```bash
   sudo umount /mnt/windows
   ```

2. Montage avec `ntfs-3g` :

   ```bash
   sudo mount -t ntfs-3g /dev/sdXN /mnt/windows
   ```

   Vous pouvez également ajouter des options pour définir les permissions si nécessaire, comme mentionné précédemment.

### 4. **Si `ntfsfix` échoue**

Si `ntfsfix` ne résout pas le problème, il se peut que vous deviez effectuer une vérification complète du disque sous Windows.

1. Redémarrez dans Windows.
2. Ouvrez une fenêtre de commande en tant qu'administrateur et exécutez :

   ```cmd
   chkdsk /f /r C:
   ```

   Remplacez `C:` par la lettre de la partition concernée. Cette commande vérifie et répare les erreurs sur le disque.

### Récapitulatif

1. Désactivez le démarrage rapide dans Windows.
2. Arrêtez complètement Windows sans utiliser l'hibernation.
3. Utilisez `ntfsfix` sous Debian pour réparer le système de fichiers.
4. Si nécessaire, exécutez `chkdsk` sous Windows pour une réparation complète.

En suivant ces étapes, vous devriez pouvoir monter votre partition NTFS en lecture-écriture sous Debian.





#######################
#######################
#######################
#######################
#######################
