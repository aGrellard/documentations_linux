- [listes de contrôle d'accès (ACLs)](#listes-de-contrôle-daccès-acls)
  - [question](#question)
    - [suite](#suite)
      - [Pour le répertoire `Data`:](#pour-le-répertoire-data)
      - [Pour le répertoire `Partage`:](#pour-le-répertoire-partage)
      - [Analyse et Implications](#analyse-et-implications)
    - [suite : comment retirer les droits du groups users ?](#suite--comment-retirer-les-droits-du-groups-users-)
      - [Retirer les Droits du Groupe `users`](#retirer-les-droits-du-groupe-users)
      - [Vérification](#vérification)
      - [Note Importante](#note-importante)
    - [suite : recursive](#suite--recursive)
      - [Exemple pour `Data` et `Partage`](#exemple-pour-data-et-partage)
      - [Conseil](#conseil)
    - [suite : retire toutes les entrées ACL](#suite--retire-toutes-les-entrées-acl)
  - [Introduction](#introduction)
  - [Prérequis](#prérequis)
  - [Afficher les ACLs d'un Fichier ou Répertoire](#afficher-les-acls-dun-fichier-ou-répertoire)
  - [Modifier les ACLs d'un Fichier ou Répertoire](#modifier-les-acls-dun-fichier-ou-répertoire)
  - [Exemples d'Utilisation des ACLs](#exemples-dutilisation-des-acls)
    - [Autoriser un Utilisateur à Accéder à un Fichier](#autoriser-un-utilisateur-à-accéder-à-un-fichier)
    - [Autoriser un Groupe à Modifier un Répertoire](#autoriser-un-groupe-à-modifier-un-répertoire)
    - [Restreindre l'Accès à un Fichier à un Utilisateur](#restreindre-laccès-à-un-fichier-à-un-utilisateur)


# listes de contrôle d'accès (ACLs) 

## question

```bash
╰─$ ls -lsha                                                        
total 20K                                                           
 16K drwxrwxr-x  1 adri-rpi adri-rpi   22  3 nov.  05:32 .          
4,0K drwxr-xr-x  4 root     root     4,0K 31 mars  21:44 ..         
   0 drwxrwxr-x+ 1 adri-rpi adri-rpi   76  3 nov.  05:29 Data       
   0 drwxrwxr-x+ 1 adri-rpi adri-rpi   38 21 oct.  20:50 Partage    

a quoi cressponf le + de drwxrwxr-x+
```

Le `+` à la fin des permissions de fichier, comme dans `drwxrwxr-x+`, indique la présence de listes de contrôle d'accès (ACLs) supplémentaires sur le fichier ou le répertoire au-delà des permissions traditionnelles basées sur le propriétaire, le groupe et les autres (world).

Les ACLs fournissent un moyen plus flexible de spécifier des permissions, vous permettant de définir des permissions détaillées pour de multiples utilisateurs et groupes. Par exemple, vous pouvez utiliser une ACL pour donner à un utilisateur spécifique des droits de lecture sur un dossier, même si les permissions du groupe ou les autres permissions ne lui permettraient normalement pas cet accès.

Pour voir les ACLs définies sur un fichier ou un répertoire, vous pouvez utiliser la commande `getfacl`. Par exemple :

```bash
getfacl Data
getfacl Partage
```

Ces commandes afficheront les ACLs actuellement en place pour les répertoires `Data` et `Partage`. Vous verrez une sortie qui ressemble à ceci :

```
# file: Data
# owner: adri-rpi
# group: adri-rpi
user::rwx
user:someuser:rwx
group::r-x
mask::rwx
other::r-x
```

Dans cet exemple, `someuser` aurait des permissions spécifiques (comme `rwx`) définies via une ACL, en plus des permissions standards.

Les ACLs sont particulièrement utiles dans des environnements où vous devez avoir un contrôle précis sur qui peut accéder à quoi, au-delà de ce qui est possible avec les simples permissions de fichier de Linux.

### suite

```bash
╭─adri-rpi@rpi4-debi12 /media/usb_3T                                 
╰─$ ls -lsha                                                         
total 20K                                                            
 16K drwxrwxr-x  1 adri-rpi adri-rpi   22  3 nov.  05:32 .           
4,0K drwxr-xr-x  4 root     root     4,0K 31 mars  21:44 ..          
   0 drwxrwxr-x+ 1 adri-rpi adri-rpi   76  3 nov.  05:29 Data        
   0 drwxrwxr-x+ 1 adri-rpi adri-rpi   38 21 oct.  20:50 Partage     
╭─adri-rpi@rpi4-debi12 /media/usb_3T                                 
╰─$ getfacl Data                                                     
# file: Data                                                         
# owner: adri-rpi                                                    
# group: adri-rpi                                                    
user::rwx                                                            
group::r-x                                                           
group:users:--x                                                      
mask::rwx                                                            
other::r-x                                                           
                                                                     
╭─adri-rpi@rpi4-debi12 /media/usb_3T                                 
╰─$ getfacl Partage                                                  
# file: Partage                                                      
# owner: adri-rpi                                                    
# group: adri-rpi                                                    
user::rwx                                                            
group::rwx                                                           
group:users:--x                                                      
mask::rwx                                                            
other::r-x                                                           
```

D'après les informations fournies par `getfacl` pour les répertoires `Data` et `Partage`, on peut observer les détails des permissions ACL qui ont été définies au-delà des permissions Unix standard.

#### Pour le répertoire `Data`:

- **user::rwx** : Le propriétaire (adri-rpi) a le droit de lire, écrire et exécuter.
- **group::r-x** : Le groupe propriétaire (adri-rpi) a le droit de lire et exécuter, mais pas d'écrire.
- **group:users:--x** : Les membres du groupe `users` ont uniquement le droit d'exécuter.
- **mask::rwx** : Le masque ACL définit les permissions maximales que les entrées ACL utilisateur, groupe et autres peuvent avoir. Ici, il est réglé sur `rwx`, permettant toutes les permissions.
- **other::r-x** : Les autres utilisateurs (ceux qui ne sont ni le propriétaire, ni dans le groupe propriétaire, ni spécifiés dans les ACL supplémentaires) ont le droit de lire et exécuter.

#### Pour le répertoire `Partage`:

- **user::rwx** : Identique à `Data`, le propriétaire (adri-rpi) a tous les droits.
- **group::rwx** : Le groupe propriétaire a aussi tous les droits, ce qui est différent de `Data` où le groupe ne pouvait pas écrire.
- **group:users:--x** : Comme pour `Data`, les membres du groupe `users` ont uniquement le droit d'exécuter.
- **mask::rwx** : Le masque est également réglé sur `rwx`, permettant toutes les permissions pour les entrées ACL.
- **other::r-x** : Les permissions pour les autres utilisateurs sont identiques à celles de `Data`.

#### Analyse et Implications

La présence du `+` dans les permissions (comme vu avec `ls -lsha`) indique ces ACLs supplémentaires. Les ACLs fournissent une couche de contrôle d'accès plus granulaire, permettant des configurations de permissions qui ne seraient pas possibles avec seulement les permissions Unix standard.

Dans votre cas, l'ACL supplémentaire notable est `group:users:--x` sur les deux dossiers, ce qui signifie que tout membre du groupe `users` peut traverser ces répertoires (`--x`), mais ne peut ni lire le contenu (`-r`) ni écrire/modifier des fichiers (`-w`) dans ces répertoires, à moins que d'autres permissions ne s'appliquent à eux directement.

Cette configuration peut être utile dans des environnements où vous souhaitez restreindre les actions que certains utilisateurs ou groupes peuvent effectuer dans des répertoires spécifiques, tout en permettant à d'autres utilisateurs ou groupes plus de libertés.

### suite : comment retirer les droits du groups users ?

Pour retirer les droits spécifiques du groupe `users` que vous avez définis via les ACL sur les répertoires `Data` et `Partage`, vous pouvez utiliser la commande `setfacl` avec l'option `-x` pour supprimer ces entrées ACL. Voici comment procéder :

#### Retirer les Droits du Groupe `users`

Pour retirer l'entrée ACL pour le groupe `users` sur le répertoire `Data`, utilisez la commande suivante :

```bash
setfacl -x group:users Data
```

Et pour le répertoire `Partage` :

```bash
setfacl -x group:users Partage
```

Ces commandes vont supprimer les entrées ACL spécifiques pour le groupe `users`, effectivement retirant les permissions supplémentaires que ce groupe avait sur ces répertoires.

#### Vérification

Après avoir exécuté ces commandes, vous pouvez vérifier que les entrées ACL ont bien été supprimées en utilisant à nouveau `getfacl` sur chaque répertoire :

```bash
getfacl Data
getfacl Partage
```

Si les entrées pour le groupe `users` ont été correctement supprimées, elles n'apparaîtront plus dans la sortie de `getfacl`.

#### Note Importante

Assurez-vous que le paquet `acl` est installé sur votre système pour que les commandes `setfacl` et `getfacl` fonctionnent. Si ce n'est pas le cas, vous pouvez l'installer en utilisant la commande appropriée pour votre distribution Linux, comme indiqué dans les réponses précédentes.

### suite : recursive

Oui, `setfacl` permet d'appliquer des changements de manière récursive en utilisant l'option `-R`. Cela signifie que vous pouvez modifier les listes de contrôle d'accès (ACL) non seulement sur un dossier spécifique mais aussi récursivement sur tous ses sous-dossiers et fichiers.

Voici comment vous pourriez retirer récursivement les droits du groupe `users` sur un répertoire et tout son contenu :

```bash
setfacl -R -x group:users chemin/vers/le/dossier
```

Remplacez `chemin/vers/le/dossier` par le chemin réel du dossier sur lequel vous souhaitez retirer récursivement les droits pour le groupe `users`.

#### Exemple pour `Data` et `Partage`

Si vous souhaitez retirer les droits du groupe `users` sur `Data` et tous les fichiers et dossiers qu'il contient, vous utiliseriez :

```bash
setfacl -R -x group:users Data
```

Et de manière similaire pour `Partage` :

```bash
setfacl -R -x group:users Partage
```

Cela retirera les permissions spécifiques au groupe `users` de manière récursive sur le répertoire ciblé et tout son contenu, assurant que les modifications s'appliquent à tous les niveaux de la hiérarchie des dossiers et fichiers.

#### Conseil

- Utilisez `getfacl` après avoir appliqué les modifications pour vérifier que les ACL ont été modifiées comme prévu.
- Soyez prudent lorsque vous utilisez des commandes récursives, surtout avec `setfacl`, car elles peuvent modifier de manière significative l'accès aux fichiers et dossiers, potentiellement de manière indésirable si vous n'êtes pas attentif.


### suite : retire toutes les entrées ACL

Le `+` à la fin des permissions (comme vu dans `drwxrwxr-x+`) indique que des ACLs supplémentaires sont présentes sur le dossier `Partage`, au-delà des permissions Unix standards. Après avoir retiré les droits spécifiques pour le groupe `users` avec `setfacl`, le `+` reste visible. Cela se produit parce que la présence du `+` n'indique pas seulement des permissions spécifiques pour le groupe `users`, mais signale l'existence de toute entrée ACL supplémentaire, qu'elle concerne des permissions pour des utilisateurs, des groupes spécifiques, ou d'autres types d'entrées ACL.

Si vous avez retiré toutes les permissions ACL spécifiques pour le groupe `users` et voyez toujours le `+`, cela signifie qu'il y a d'autres ACLs définies sur le dossier qui ne sont pas des permissions standards Unix. Par exemple, il peut y avoir des ACLs explicites pour d'autres utilisateurs, ou des ACLs par défaut pour le dossier (qui appliquent des modèles de permissions aux nouveaux fichiers et dossiers créés à l'intérieur).

Pour voir toutes les ACLs détaillées sur `Partage`, y compris celles qui ne concernent pas le groupe `users`, utilisez à nouveau `getfacl` :

```bash
getfacl Partage
```

Dans votre cas, après avoir retiré les permissions pour le groupe `users`, la sortie de `getfacl Partage` ne montre plus d'entrées pour ce groupe, mais le `+` reste car il y a probablement d'autres ACLs en place ou des ACLs par défaut. Pour retirer complètement le `+`, vous devriez retirer toutes les entrées ACL spécifiques qui ne correspondent pas aux permissions Unix standards et, si elles existent, les ACLs par défaut.

Si votre intention est de nettoyer toutes les ACLs pour revenir strictement aux permissions Unix standards sans entrées ACL supplémentaires, vous pouvez utiliser la commande suivante pour supprimer toutes les ACLs d'un fichier ou dossier :

```bash
setfacl -b Partage
```

La commande `setfacl -b` retire toutes les entrées ACL du dossier `Partage`, ce qui devrait également enlever le `+` des permissions affichées par `ls -l`. Gardez à l'esprit que cette action remet les permissions du dossier à celles strictement définies par le système Unix standard, sans ACLs supplémentaires.


## Introduction

Les listes de contrôle d'accès (ACLs) sont un moyen de contrôler les autorisations d'accès aux fichiers et répertoires sur les systèmes de fichiers Linux. Elles permettent de définir des autorisations plus granulaires que les permissions traditionnelles basées sur les propriétaires, les groupes et les autres utilisateurs. Les ACLs peuvent être utilisées pour accorder ou refuser l'accès à des fichiers et répertoires spécifiques à des utilisateurs ou des groupes spécifiques.

Dans ce guide, nous allons explorer les bases des listes de contrôle d'accès (ACLs) sur Linux, y compris comment les afficher, les configurer et les gérer.

## Prérequis

- Un système Linux avec un noyau prenant en charge les ACLs. La plupart des distributions Linux modernes prennent en charge les ACLs par défaut.
- Un utilisateur avec des privilèges sudo ou root pour configurer les ACLs.
- Des connaissances de base sur les permissions de fichiers et de répertoires sur Linux.
- Un terminal ou une connexion SSH à votre système Linux.
- Les paquets `acl` et `getfacl` doivent être installés sur votre système. Vous pouvez les installer en utilisant le gestionnaire de paquets de votre distribution.
- Un système de fichiers prenant en charge les ACLs. Les systèmes de fichiers ext2, ext3, ext4, XFS, Btrfs et JFS prennent en charge les ACLs.
- Les ACLs sont activées par défaut sur les systèmes de fichiers ext4 et XFS. Pour les autres systèmes de fichiers, vous devrez peut-être les activer manuellement.
- Les ACLs ne sont pas activées par défaut sur les systèmes de fichiers montés en utilisant l'option `noacl`. Assurez-vous que vos systèmes de fichiers sont montés avec l'option `acl`.

## Afficher les ACLs d'un Fichier ou Répertoire

Pour afficher les ACLs d'un fichier ou d'un répertoire, vous pouvez utiliser la commande `getfacl`. Voici comment afficher les ACLs d'un fichier spécifique :

```bash
getfacl fichier
```

Pour afficher les ACLs d'un répertoire, utilisez la même commande avec le nom du répertoire :

```bash
getfacl répertoire
```

La sortie affichera les ACLs actuelles du fichier ou du répertoire, y compris les autorisations spécifiques pour les utilisateurs et les groupes.

## Modifier les ACLs d'un Fichier ou Répertoire

Pour modifier les ACLs d'un fichier ou d'un répertoire, vous pouvez utiliser la commande `setfacl`. Voici un exemple de syntaxe pour ajouter une ACL à un fichier :

```bash
setfacl -m u:utilisateur:permissions fichier
```

Dans cet exemple, `utilisateur` est le nom de l'utilisateur auquel vous souhaitez accorder des permissions spécifiques, et `permissions` est la liste des autorisations que vous souhaitez accorder. Vous pouvez également spécifier des ACLs pour les groupes en utilisant `g:nom_du_groupe:permissions`.

Pour ajouter une ACL à un répertoire, utilisez la même commande avec le nom du répertoire :

```bash
setfacl -m u:utilisateur:permissions répertoire
```

Pour supprimer une ACL d'un fichier ou d'un répertoire, utilisez la commande `setfacl` avec l'option `-x` :

```bash
setfacl -x u:utilisateur fichier
```

Dans cet exemple, `utilisateur` est le nom de l'utilisateur dont vous souhaitez supprimer les ACLs.

## Exemples d'Utilisation des ACLs

Voici quelques exemples d'utilisation courante des ACLs sur Linux :

### Autoriser un Utilisateur à Accéder à un Fichier

Pour autoriser un utilisateur spécifique à accéder à un fichier, vous pouvez ajouter une ACL avec les permissions appropriées :

```bash
setfacl -m u:utilisateur:r fichier
```

Dans cet exemple, `utilisateur` est le nom de l'utilisateur auquel vous accordez l'accès en lecture (`r`) au fichier.

### Autoriser un Groupe à Modifier un Répertoire

Pour autoriser un groupe spécifique à modifier un répertoire, vous pouvez ajouter une ACL avec les permissions appropriées :

```bash
setfacl -m g:groupe:rwx répertoire
```

Dans cet exemple, `groupe` est le nom du groupe auquel vous accordez les autorisations de lecture, écriture et exécution (`rwx`) sur le répertoire.

### Restreindre l'Accès à un Fichier à un Utilisateur

Pour restreindre l'accès à un fichier à un seul utilisateur, vous pouvez ajouter une ACL avec les permissions appropriées :

```bash
setfacl -m u:utilisateur:rw fichier
setfacl -x g:groupe fichier
```

Dans cet exemple, `utilisateur` est le nom de l'utilisateur auquel vous accordez les autorisations de lecture et d'écriture (`rw`) sur le fichier, et `groupe` est le nom du groupe dont vous supprimez les ACLs.

