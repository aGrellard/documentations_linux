- [fstab](#fstab)
  - [Monter un disque dur ou une partition](#monter-un-disque-dur-ou-une-partition)
    - [1. Identifier le Disque](#1-identifier-le-disque)
    - [2. Créer un Point de Montage](#2-créer-un-point-de-montage)
    - [3. Obtenir l'UUID du Disque](#3-obtenir-luuid-du-disque)
    - [4. Modifier le Fichier `/etc/fstab`](#4-modifier-le-fichier-etcfstab)
    - [5. Tester le Montage](#5-tester-le-montage)
    - [6. Vérification](#6-vérification)
    - [7. Redémarrage et Vérification Automatique](#7-redémarrage-et-vérification-automatique)
    - [Conclusion](#conclusion)
  - [Les options de montage dans le fichier /etc/fstab](#les-options-de-montage-dans-le-fichier-etcfstab)
    - [Options Générales](#options-générales)
    - [Options de Sécurité et d'Accès](#options-de-sécurité-et-daccès)
    - [Gestion des Erreurs](#gestion-des-erreurs)
    - [Performance et Fiabilité](#performance-et-fiabilité)
    - [Options Spécifiques au Type de Système de Fichiers](#options-spécifiques-au-type-de-système-de-fichiers)
    - [Options Avancées](#options-avancées)
    - [Conclusion](#conclusion-1)
  - [Sauvegarde et Restauration avec `dump`](#sauvegarde-et-restauration-avec-dump)
    - [Structure d'une Ligne fstab](#structure-dune-ligne-fstab)
    - [Configurer le Champ Dump](#configurer-le-champ-dump)
    - [Exemple](#exemple)
    - [Conseils pour la Configuration](#conseils-pour-la-configuration)
  - [fsck : Vérification et Réparation des Systèmes de Fichiers](#fsck--vérification-et-réparation-des-systèmes-de-fichiers)
    - [Valeurs et Significations](#valeurs-et-significations)
    - [Exemple](#exemple-1)
    - [Conseils d'Utilisation](#conseils-dutilisation)
  - [Monter un system de fichiers samba](#monter-un-system-de-fichiers-samba)
    - [1. Installer les Paquets Nécessaires](#1-installer-les-paquets-nécessaires)
    - [2. Créer un Point de Montage](#2-créer-un-point-de-montage-1)
    - [3. Monter le Partage Manuellement (Optionnel)](#3-monter-le-partage-manuellement-optionnel)
    - [4. Configuration pour le Montage Automatique](#4-configuration-pour-le-montage-automatique)
      - [Sécuriser les Identifiants de Connexion](#sécuriser-les-identifiants-de-connexion)
      - [Ajouter la Ligne dans `/etc/fstab`](#ajouter-la-ligne-dans-etcfstab)
    - [Montage Automatique avec `username` et `password`](#montage-automatique-avec-username-et-password)
    - [uid et gid](#uid-et-gid)
      - [Contrôle de l'Accès aux Fichiers](#contrôle-de-laccès-aux-fichiers)
      - [Exemple Pratique](#exemple-pratique)
      - [Conclusion](#conclusion-2)


# fstab

## Monter un disque dur ou une partition

### 1. Identifier le Disque

D'abord, vous devez identifier le disque que vous souhaitez monter automatiquement. Connectez le disque à votre ordinateur et ouvrez un terminal.

Exécutez la commande suivante pour lister tous les disques et partitions :

```bash
lsblk
```

Recherchez votre disque dans la liste (par exemple, `/dev/sdb1`). Notez son identifiant; vous en aurez besoin pour les étapes suivantes.

### 2. Créer un Point de Montage

Un point de montage est un répertoire dans votre système de fichiers où le disque sera monté (accessible). Vous devez créer ce répertoire.

Par exemple, pour créer un point de montage dans `/mnt/mon_disque`, exécutez :

```bash
sudo mkdir -p /mnt/mon_disque
```

### 3. Obtenir l'UUID du Disque

Chaque disque a un UUID unique. Il est recommandé d'utiliser l'UUID pour monter le disque afin d'éviter tout conflit si l'identifiant du disque change.

Pour obtenir l'UUID, utilisez la commande :

```bash
sudo blkid
```

Repérez votre disque et notez son UUID, qui ressemblera à quelque chose comme `UUID="1234-ABCD"`.

### 4. Modifier le Fichier `/etc/fstab`

Le fichier `fstab` est utilisé pour définir comment les disques doivent être montés au démarrage.

Ouvrez ce fichier avec un éditeur de texte en mode superutilisateur. Par exemple, avec nano :

```bash
sudo nano /etc/fstab
```

Ajoutez une ligne à la fin du fichier pour votre disque. Par exemple, si vous voulez monter une partition NTFS :

```plaintext
UUID=1234-ABCD /mnt/mon_disque ntfs defaults,auto,users,rw,nofail 0 0
```

Remplacez `1234-ABCD` par l'UUID de votre disque, `/mnt/mon_disque` par votre point de montage, et `ntfs` par le système de fichiers de votre disque (ntfs pour un disque Windows, ext4 pour un disque Linux, etc.). Les options `defaults,auto,users,rw,nofail` sont des paramètres de montage courants qui devraient convenir à la plupart des utilisations.

### 5. Tester le Montage

Avant de redémarrer, vous pouvez tester si le montage fonctionne correctement avec :

```bash
sudo mount -a
```

Cela tentera de monter tous les systèmes de fichiers définis dans `/etc/fstab`.

### 6. Vérification

Vérifiez que le disque est correctement monté en utilisant `lsblk` ou en naviguant vers le point de montage dans votre explorateur de fichiers.

```bash
lsblk
```

Ou

```bash
cd /mnt/mon_disque && ls
```

### 7. Redémarrage et Vérification Automatique

Redémarrez votre système pour s'assurer que le disque se monte automatiquement au démarrage.

```bash
sudo reboot
```

Après le redémarrage, vérifiez à nouveau que le disque est monté automatiquement.

### Conclusion

En suivant ces étapes, vous aurez configuré votre système Debian pour monter automatiquement un disque externe à chaque démarrage. Cette configuration est utile pour les disques fréquemment utilisés, évitant la nécessité de les monter manuellement à chaque fois.

## Les options de montage dans le fichier /etc/fstab 

Les options de montage dans le fichier `/etc/fstab` peuvent influencer le comportement du système de fichiers monté de diverses manières. Voici une liste des options de montage les plus courantes et leur signification :

### Options Générales

- **defaults** : Applique un ensemble d'options par défaut (`rw, suid, dev, exec, auto, nouser, async`).
- **ro** : Montage en lecture seule.
- **rw** : Montage en lecture-écriture.
- **auto** : Permet au système de monter automatiquement le système de fichiers au démarrage.
- **noauto** : Le système de fichiers ne sera pas monté automatiquement au démarrage.
- **user** : Permet à un utilisateur (pas seulement root) de monter le système de fichiers.
- **nouser** : Seul root peut monter le système de fichiers (c'est la valeur par défaut).
- **users** : Plusieurs utilisateurs peuvent monter et démonter le système de fichiers.
- **sync** : Les entrées/sorties seront synchrones.
- **async** : Les entrées/sorties seront asynchrones (par défaut).

### Options de Sécurité et d'Accès

- **suid** : Autorise les opérations suid et sgid.
- **nosuid** : Bloque les opérations suid et sgid.
- **exec** : Permet l'exécution de binaires.
- **noexec** : Interdit l'exécution de binaires.
- **dev** : Interprète les fichiers de périphériques.
- **nodev** : N'interprète pas les fichiers de périphériques.
- **umask=XXX** : Définit le masque de permission pour les fichiers nouvellement créés.
- **uid=XXX** : Définit l'ID de l'utilisateur propriétaire.
- **gid=XXX** : Définit l'ID du groupe propriétaire.

### Gestion des Erreurs

- **errors=continue** : Continue à lire/écrire sur un système de fichiers même après une erreur.
- **errors=remount-ro** : Remonte le système de fichiers en lecture seule après une erreur.
- **errors=panic** : Provoque un kernel panic après une erreur (utilisé généralement pour des partitions cruciales).

### Performance et Fiabilité

- **relatime** : Met à jour les temps d'accès aux fichiers relativement à d'autres opérations pour améliorer les performances.
- **noatime** : Ne met pas à jour les temps d'accès aux fichiers, ce qui peut améliorer les performances.
- **nodiratime** : Ne met pas à jour les temps d'accès aux répertoires.
- **strictatime** : Met à jour les temps d'accès aux fichiers à chaque accès (comportement traditionnel).
- **data=ordered** : Les données sont écrites avant le journal (pour les systèmes de fichiers journalisés).
- **data=journal** : Toutes les données passent par le journal (pour les systèmes de fichiers journalisés).

### Options Spécifiques au Type de Système de Fichiers

- Pour **NTFS** : `ntfs-3g` permet d'utiliser le driver NTFS-3G pour le montage en lecture-écriture.
- Pour **vfat (FAT32)** : `utf8` active le support de l'UTF-8 pour les noms de fichiers, `shortname=mixed` permet des noms courts en mélangeant majuscules et minuscules.

### Options Avancées

- **nofail** : Ne pas signaler d'erreur si le périphérique n'est pas présent au démarrage, empêchant le système de se bloquer.
- **discard** : Active le TRIM sur les SSD pour un meilleur temps de réponse et une durée de vie prolongée.

### Conclusion

C'est une liste non exhaustive, car il existe de nombreuses autres options spécifiques à certains types de systèmes de fichiers ou à des cas d'utilisation particuliers. Toujours consulter la documentation spécifique à votre système de fichiers ou utiliser la commande `man fstab` pour plus de détails.

## Sauvegarde et Restauration avec `dump`

Pour configurer l'utilisation de `dump` sur un point de montage spécifique dans votre fichier `/etc/fstab`, vous devez ajuster le cinquième champ de la ligne correspondant à ce point de montage. Voici les étapes pour comprendre et configurer `dump` via `/etc/fstab` :

### Structure d'une Ligne fstab

Chaque ligne du fichier `/etc/fstab` est structurée comme suit :

```
<device> <mount point> <type> <options> <dump> <pass>
```

Le cinquième champ, `<dump>`, est celui qui concerne directement `dump`. Voici comment le configurer :

### Configurer le Champ Dump

- **0** : Ne pas sauvegarder. Si vous mettez `0` dans ce champ, cela indique à `dump` d'ignorer ce système de fichiers et de ne pas le sauvegarder.
- **1** (ou tout autre nombre positif) : Sauvegarder. Un chiffre autre que `0` active la sauvegarde pour ce système de fichiers. Habituellement, on met `1` pour indiquer que ce système de fichiers doit être sauvegardé.

### Exemple

Supposons que vous ayez une partition `/dev/sda1` montée sur `/home` avec un système de fichiers `ext4` que vous souhaitez sauvegarder régulièrement avec `dump`. La ligne correspondante dans `/etc/fstab` pourrait ressembler à ceci :

```
UUID=xxxx-xxxx /home ext4 defaults 1 2
```

Ici, le `1` dans le cinquième champ indique que `dump` doit sauvegarder cette partition.

### Conseils pour la Configuration

- **Choisir les Systèmes de Fichiers à Sauvegarder** : Réfléchissez bien aux systèmes de fichiers que vous devez sauvegarder. Les systèmes contenant des données utilisateur, comme `/home`, sont de bons candidats, tandis que des systèmes de fichiers temporaires ou de cache, comme `/tmp`, peuvent ne pas nécessiter de sauvegarde.
- **Planifier les Sauvegardes** : `dump` ne s'exécute pas automatiquement selon les configurations dans `/etc/fstab`. Vous devez planifier les sauvegardes à l'aide de cron ou d'un autre planificateur de tâches, en spécifiant la commande `dump` avec les options appropriées.
- **Tester les Restaurations** : Après avoir configuré et exécuté `dump` pour la première fois, assurez-vous de tester la procédure de restauration pour vérifier que vos sauvegardes fonctionnent comme prévu. Utilisez l'outil `restore` pour tester la récupération de fichiers à partir de vos sauvegardes.

En suivant ces instructions, vous pourrez configurer `dump` pour sauvegarder les systèmes de fichiers souhaités en modifiant le fichier `/etc/fstab`. Assurez-vous de compléter cette configuration avec un script ou une tâche planifiée pour exécuter réellement les sauvegardes à intervalles réguliers.

## fsck : Vérification et Réparation des Systèmes de Fichiers

Le sixième champ dans une ligne du fichier `/etc/fstab` est connu sous le nom de "pass", "fsck order" ou simplement "ordre de vérification par fsck". Ce champ indique à `fsck` (File System Consistency checK), l'outil de vérification de la cohérence des systèmes de fichiers sous Unix et Linux, dans quel ordre les systèmes de fichiers doivent être vérifiés au démarrage du système. Voici comment ce champ fonctionne et comment l'utiliser :

### Valeurs et Significations

- **0** : Indique à `fsck` de ne pas vérifier ce système de fichiers. C'est généralement utilisé pour des systèmes de fichiers qui n'ont pas besoin de vérification au démarrage, comme un système de fichiers non-Linux (par exemple, une partition NTFS utilisée principalement sous Windows) ou un périphérique de stockage amovible qui n'est pas toujours connecté.
- **1** : Les systèmes de fichiers avec cette valeur sont vérifiés en premier. Il devrait y avoir au maximum un seul système de fichiers avec cette valeur, et c'est typiquement la partition racine (`/`). Cela garantit que le système de fichiers racine est sain avant de vérifier les autres systèmes de fichiers.
- **2** ou plus : Ces systèmes de fichiers sont vérifiés après ceux avec une valeur de 1. Si plusieurs systèmes de fichiers ont la même valeur dans ce champ, `fsck` peut les vérifier simultanément, ce qui peut réduire le temps de démarrage sur les systèmes avec de nombreux systèmes de fichiers et/ou des processeurs multicœurs.

### Exemple

Voici un exemple de ligne dans `/etc/fstab` :

```
UUID=xxxx-xxxx / ext4 defaults 0 1
```

Dans cet exemple, la partition racine (`/`) a une valeur de `1` dans le champ "pass", indiquant qu'elle doit être vérifiée en premier au démarrage.

### Conseils d'Utilisation

- **Partitions Racine** : Assurez-vous que la partition racine (`/`) a une valeur de "pass" réglée sur `1` pour garantir sa vérification et sa réparation si nécessaire avant que les autres systèmes de fichiers soient montés.
- **Autres Systèmes de Fichiers** : Réglez le champ "pass" des autres systèmes de fichiers (comme `/home`, `/var`, etc.) sur `2` ou plus pour indiquer qu'ils doivent être vérifiés après la partition racine. Si vous avez des raisons de prioriser certains systèmes de fichiers par rapport à d'autres, vous pouvez leur attribuer différents niveaux supérieurs à `2`, mais dans la pratique, `2` est suffisant pour la plupart des configurations.
- **Systèmes de Fichiers Non-Critiques ou Externes** : Pour les systèmes de fichiers qui ne sont pas critiques pour le démarrage du système ou pour des périphériques de stockage externes/amovibles, vous pouvez utiliser une valeur de `0` pour éviter de ralentir le processus de démarrage avec des vérifications inutiles.

En ajustant soigneusement le champ "pass" pour chaque système de fichiers dans `/etc/fstab`, vous pouvez contrôler l'ordre et la manière dont `fsck` vérifie les systèmes de fichiers au démarrage, contribuant ainsi à la santé et à la stabilité du système.

## Monter un system de fichiers samba

Pour monter un emplacement réseau utilisant le protocole SMB/CIFS (Server Message Block/Common Internet File System), couramment utilisé pour le partage de fichiers dans les environnements Windows, sous Linux, vous devez suivre plusieurs étapes. Ces étapes impliquent l'installation de paquets supplémentaires, la création d'un point de montage et la configuration de `/etc/fstab` pour le montage automatique. Voici un guide détaillé :

### 1. Installer les Paquets Nécessaires

Vous aurez besoin du paquet `cifs-utils` pour monter des partages SMB/CIFS sous Linux. Ouvrez un terminal et installez `cifs-utils` avec la commande suivante :

```bash
sudo apt update && sudo apt install cifs-utils
```

### 2. Créer un Point de Montage

Créez un dossier qui servira de point de montage pour le partage réseau. Par exemple, pour créer un point de montage sous `/mnt/nom_du_partage` :

```bash
sudo mkdir -p /mnt/nom_du_partage
```

### 3. Monter le Partage Manuellement (Optionnel)

Pour tester le montage du partage avant de le configurer pour un montage automatique, utilisez la commande `mount` :

```bash
sudo mount -t cifs //serveur/partage /mnt/nom_du_partage -o username=utilisateur,password=motdepasse
```

Remplacez `//serveur/partage` par le chemin du partage SMB, `/mnt/nom_du_partage` par votre point de montage, et `username=utilisateur,password=motdepasse` par vos identifiants de connexion au partage.

### 4. Configuration pour le Montage Automatique

Pour éviter de saisir manuellement la commande de montage à chaque redémarrage, vous pouvez configurer le montage automatique via le fichier `/etc/fstab`.

#### Sécuriser les Identifiants de Connexion

Il est recommandé de stocker les identifiants de connexion dans un fichier séparé pour des raisons de sécurité :

1. Créez un fichier pour stocker les identifiants :

```bash
sudo nano /etc/samba/user.cred
```

2. Ajoutez les informations de connexion :

```
username=votre_nom_d_utilisateur
password=votre_mot_de_passe
```

3. Changez les permissions du fichier pour restreindre l'accès :

```bash
sudo chmod 600 /etc/samba/user.cred
```

#### Ajouter la Ligne dans `/etc/fstab`

1. Ouvrez le fichier `/etc/fstab` :

```bash
sudo nano /etc/fstab
```

2. Ajoutez une ligne pour le partage SMB/CIFS :

```plaintext
//serveur/partage /mnt/nom_du_partage cifs credentials=/etc/samba/user.cred,_netdev,uid=1000,gid=1000 0 0
```

Remplacez les chemins et options comme nécessaire. L'option `_netdev` indique que le montage dépend de la connexion réseau, `uid` et `gid` (optionnels) définissent l'ID utilisateur et groupe sous lesquels les fichiers seront montés, permettant ainsi un accès utilisateur non-root aux fichiers.

### Montage Automatique avec `username` et `password`

Pour un montage manuel temporaire sans modifier `/etc/fstab`, vous pouvez utiliser la commande `mount` directement avec `username` et `password` :

```bash
//serveur/partage /mnt/nom_du_partage cifs username=monuser,password=monmdp,_netdev,uid=1000,gid=1000 0 0
```
### uid et gid

Ceci est particulièrement utile pour des tests ou des montages ponctuels où la facilité d'utilisation prévaut sur la sécurité des informations d'identification.

L'utilisation des options `uid` (User ID) et `gid` (Group ID) dans le contexte du montage d'un système de fichiers, tel qu'un partage réseau SMB/CIFS dans Linux, a des implications importantes pour la gestion des permissions et l'accès aux fichiers. Voici pourquoi `uid` et `gid` sont importants et utiles :

#### Contrôle de l'Accès aux Fichiers

- **Propriété des Fichiers** : Lorsque vous montez un système de fichiers externe (comme un partage SMB/CIFS) sur un système Linux, Linux doit attribuer la propriété des fichiers et des dossiers à un utilisateur et à un groupe locaux. Par défaut, sans spécifier `uid` ou `gid`, les fichiers pourraient être attribués à l'utilisateur root ou à un autre utilisateur par défaut, ce qui pourrait empêcher les utilisateurs normaux d'accéder aux fichiers montés correctement.
- **Accès des Utilisateurs Non-root** : En spécifiant un `uid` et un `gid`, vous définissez explicitement l'utilisateur et le groupe propriétaire des fichiers dans le système de fichiers monté. Cela est particulièrement utile pour garantir que les utilisateurs normaux (non-root) peuvent lire, écrire ou exécuter les fichiers sur le système de fichiers monté, selon les permissions définies.

#### Exemple Pratique

Imaginons que vous ayez un partage réseau contenant des documents que plusieurs utilisateurs sur un système Linux doivent pouvoir lire et modifier. Sans spécifier `uid` et `gid` lors du montage :

- Les fichiers pourraient être accessibles uniquement en lecture pour les utilisateurs normaux, ou pas accessibles du tout, si le système de fichiers est monté avec les permissions root par défaut.
- Les utilisateurs pourraient rencontrer des problèmes pour modifier des fichiers ou créer de nouveaux fichiers dans le partage.

En spécifiant `uid` et `gid` lors du montage :

- Vous pouvez définir un utilisateur et un groupe spécifique (par exemple, un groupe de travail) comme propriétaire des fichiers, ce qui permet à tous les membres du groupe d'avoir les permissions nécessaires pour travailler avec les fichiers.
- Cela simplifie la gestion des accès et assure que les fichiers soient accessibles conformément aux besoins de l'équipe ou de l'organisation.

#### Conclusion

L'utilisation de `uid` et `gid` lors du montage de systèmes de fichiers externes est une technique de gestion des permissions qui assure que les fichiers sont accessibles de manière appropriée aux utilisateurs et aux groupes sur le système hôte. C'est un aspect important de la configuration de sécurité et d'accès dans des environnements multi-utilisateurs ou lorsque vous travaillez avec des ressources partagées entre systèmes.