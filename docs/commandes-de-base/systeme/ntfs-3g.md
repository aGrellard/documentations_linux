- [Options de Montage Basiques](#options-de-montage-basiques)
- [Option `permissions`](#option-permissions)
- [Options de Performance](#options-de-performance)
- [Options de Comportement](#options-de-comportement)
- [Options Avancées](#options-avancées)
- [Gestion des Erreurs](#gestion-des-erreurs)
- [Compatibilité avec Windows](#compatibilité-avec-windows)
- [Augmentation des Performances](#augmentation-des-performances)
- [Utilisation dans `/etc/fstab`](#utilisation-dans-etcfstab)
- [Utilisation](#utilisation)
- [Utilisation](#utilisation-1)
- [Conseils](#conseils)


NTFS-3G est un pilote open source et un outil pour monter des partitions Windows NTFS dans des systèmes Linux, permettant la lecture et l'écriture sur ces partitions. NTFS-3G offre plusieurs options de montage qui permettent de personnaliser le comportement du système de fichiers NTFS sous Linux. Voici une liste des options de montage les plus couramment utilisées avec NTFS-3G et leur signification :

### Options de Montage Basiques

- **`uid=<value>`** : Définit l'ID de l'utilisateur propriétaire des fichiers (par défaut, l'UID de l'utilisateur qui monte le système de fichiers).
- **`gid=<value>`** : Définit l'ID du groupe propriétaire des fichiers (par défaut, le GID de l'utilisateur qui monte le système de fichiers).
- **`umask=<value>`** : Définit le masque de permission pour les fichiers et dossiers, contrôlant les permissions par défaut (par exemple, `umask=022` permet la lecture et l'exécution par tout le monde mais l'écriture seulement par le propriétaire).
- **`fmask=<value>`** : Définit le masque de permission spécifiquement pour les fichiers.
- **`dmask=<value>`** : Définit le masque de permission spécifiquement pour les dossiers.

### Option `permissions`

- **`permissions`** : Active la gestion des permissions POSIX sur le système de fichiers NTFS. Cela permet une gestion plus fine des droits d'accès aux fichiers et dossiers, similaire à celle des systèmes de fichiers Linux natifs. Avec cette option, les permissions définies par les commandes `chmod` et `chown` sont honorées, et le contrôle d'accès est basé sur ces permissions plutôt que sur les options `uid`, `gid`, et `umask`. Utilisez cette option si vous avez besoin d'un contrôle précis des permissions au niveau des fichiers individuels ou des dossiers.

### Options de Performance

- **`async`** : Active les écritures asynchrones (par défaut).
- **`sync`** : Active les écritures synchrones, où chaque écriture attend la confirmation de l'achèvement.

### Options de Comportement

- **`ro`** : Montage en lecture seule.
- **`rw`** : Montage en lecture-écriture (par défaut).
- **`exec`** : Autorise l'exécution de binaires.
- **`noexec`** : Interdit l'exécution de binaires (par défaut pour des raisons de sécurité).
- **`suid`** : Autorise les opérations suid/sgid.
- **`nosuid`** : Bloque les opérations suid/sgid (par défaut pour des raisons de sécurité).

### Options Avancées

- **`windows_names`** : Restreint les noms de fichiers pour qu'ils soient compatibles avec Windows, en refusant les fichiers dont les noms contiennent des caractères non autorisés par Windows ou se terminent par des points ou des espaces.
- **`ignore_case`** et **`noignore_case`** : `ignore_case` active le mode non sensible à la casse pour les noms de fichiers, simulant le comportement par défaut de Windows. `noignore_case` désactive ce comportement, rendant le système de fichiers sensible à la casse, ce qui est plus typique pour les systèmes Unix/Linux.
- **`no_def_opts`** : N'applique pas les options de montage par défaut de NTFS-3G, permettant un contrôle total.
- **`compression`** et **`nocompression`** : Active ou désactive la compression des fichiers écrits sur le système de fichiers NTFS. `compression` permet d'économiser de l'espace disque, tandis que `nocompression` peut améliorer les performances d'écriture.
- **`slower`** : Réduit les performances pour augmenter la compatibilité dans certaines situations spécifiques, comme travailler avec des volumes NTFS très fragmentés ou endommagés.
- **`acl`** : Active le support des listes de contrôle d'accès (ACL) Windows sur les systèmes de fichiers NTFS. Les ACL sont utilisées pour définir des politiques de sécurité fines sur les fichiers et dossiers. L'utilisation de cette option avec `permissions` permet une correspondance plus précise entre les ACL Windows et les permissions POSIX.
- **`usermapping=<fichier>`** : Spécifie l'emplacement du fichier de mappage des utilisateurs, qui mappe les identifiants de sécurité NTFS (SID) aux utilisateurs et groupes Linux. Cette option est essentielle pour un fonctionnement correct de l'option `permissions`, permettant une correspondance entre les utilisateurs Windows et Linux.
- 
### Gestion des Erreurs

- **`recover`** : Active la récupération des fichiers journalisés non fermés au prochain montage.
- **`norecover`** : Désactive la récupération automatique au montage.

### Compatibilité avec Windows

- **`remove_hiberfile`** : Supprime le fichier d'hibernation si présent, ce qui est nécessaire si Windows a été hiberné et non arrêté proprement.

### Augmentation des Performances

- **`big_writes`** : Réduit le nombre d'opérations d'écriture en permettant de plus grandes écritures en une seule fois. Cela peut significativement améliorer les performances lors de l'écriture de gros fichiers sur des volumes NTFS sous Linux.
- **`noatime`** : Empêche la mise à jour des timestamps d'accès aux fichiers lors de leur lecture. L'accès en lecture aux fichiers n'entraînera pas d'écriture sur le disque uniquement pour mettre à jour le timestamp, améliorant ainsi les performances.


### Utilisation dans `/etc/fstab`

Pour monter automatiquement avec des options avancées au démarrage, vous pouvez ajouter une entrée dans `/etc/fstab` :

```
UUID=1234-ABCD /mnt/ntfs_volume ntfs-3g permissions,compression,windows_names,uid=1000,gid=1000 0 0
```

Assurez-vous de remplacer `UUID=1234-ABCD` par l'UUID de votre partition NTFS, et ajustez le point de montage et les options selon vos besoins.


### Utilisation

Pour utiliser une option de montage avec NTFS-3G, ajoutez-la à la ligne de commande `mount` avec l'option `-o`, par exemple :

```bash
sudo mount -t ntfs-3g -o rw,uid=1000,gid=1000 /dev/sda1 /mnt/windows
```

Ou dans `/etc/fstab` :

```
/dev/sda1 /mnt/windows ntfs-3g rw,uid=1000,gid=1000 0 0
```

Ces options offrent une flexibilité considérable dans la gestion des systèmes de fichiers NTFS sous Linux, permettant aux utilisateurs d'ajuster le comportement selon leurs besoins spécifiques. Pour une liste complète et à jour des options et leurs explications, consultez la page de manuel de `ntfs-3g` (`man ntfs-3g`) sur votre système.

### Utilisation

Pour utiliser ces options avancées dans vos montages NTFS-3G, vous pouvez les ajouter à la commande `mount` avec l'option `-o`, ou les inclure dans votre fichier `/etc/fstab`. Par exemple, pour monter un volume NTFS avec la gestion complète des permissions et le support ACL :

```bash
sudo mount -t ntfs-3g -o rw,permissions,acl /dev/sda1 /mnt/ntfs
```

Ou pour un montage via `/etc/fstab` avec permissions et compression :

```plaintext
UUID=XXXX-XXXX /mnt/ntfs ntfs-3g rw,permissions,compression 0 0
```

Ces options offrent une flexibilité et un contrôle significatifs sur la manière dont les volumes NTFS sont montés et gérés sous Linux, permettant une intégration plus transparente et sécurisée de NTFS dans un environnement Linux.

### Conseils

- **Testez les Options** : Certaines options peuvent avoir des effets inattendus sur la compatibilité ou les performances. Testez-les dans votre environnement spécifique pour vous assurer qu'elles répondent à vos besoins.
- **Consultez la Documentation** : Pour une liste complète des options disponibles et des explications détaillées sur leur utilisation, consultez la documentation officielle de `ntfs-3g`. Vous pouvez souvent y accéder via la commande `man ntfs-3g` sur votre système.

Utiliser `ntfs-3g` avec des options avancées peut considérablement améliorer l'interaction avec les systèmes de fichiers NTFS sous Linux, offrant une flexibilité et des fonctionnalités accrues pour les utilisateurs et les administrateurs système.
