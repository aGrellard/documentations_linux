- [le masque de chmod](#le-masque-de-chmod)
  - [Notation Symbolique](#notation-symbolique)
    - [Exemples d'utilisation](#exemples-dutilisation)
  - [Notation Octale](#notation-octale)
    - [Exemples d'utilisation](#exemples-dutilisation-1)
  - [Structure](#structure)
  - [Comprendre et Modifier les Permissions](#comprendre-et-modifier-les-permissions)
  - [Conseils](#conseils)
  - [Masque umask](#masque-umask)
    - [Comment umask Fonctionne](#comment-umask-fonctionne)
      - [Explication de la "Différence d'Écriture"](#explication-de-la-différence-décriture)
      - [Pourquoi `newFile` a des permissions `644`](#pourquoi-newfile-a-des-permissions-644)
- [création de fichier avec `sudo touch`](#création-de-fichier-avec-sudo-touch)
  - [Pour Modifier les Permissions](#pour-modifier-les-permissions)
  - [Résumé](#résumé)


# le masque de chmod

Le masque de `chmod` dans Linux détermine les permissions par défaut qui seront attribuées aux fichiers et répertoires au moment de leur création. Chaque fichier et répertoire dans un système de fichiers Linux a des permissions qui spécifient ce que les utilisateurs peuvent faire avec eux (lire, écrire, exécuter pour les fichiers, ou entrer pour les répertoires).

## Notation Symbolique

La notation symbolique permet de modifier les permissions de fichier de manière intuitive, en utilisant des lettres pour les catégories d'utilisateurs et des symboles pour les actions à effectuer.

- ### **Catégories d'utilisateurs** :
  - `u` pour le propriétaire (user)
  - `g` pour le groupe
  - `o` pour les autres (others)
  - `a` pour tous (all)

- ### **Types de permissions** :
  - `r` pour lire (read)
  - `w` pour écrire (write)
  - `x` pour exécuter (execute)

- ### **Opérateurs** :
  - `+` pour ajouter une permission
  - `-` pour retirer une permission
  - `=` pour définir exactement les permissions

### Exemples d'utilisation

**Ajouter la permission d'exécution pour le propriétaire** :

```bash
chmod u+x fichier
```

**Retirer la permission de lecture pour les autres** :

```bash
chmod o-r fichier
```

**Définir les permissions pour que le propriétaire ait tous les droits, le groupe puisse lire et exécuter, et les autres aucun droit** :

```bash
chmod u=rwx,g=rx,o= fichier
```

## Notation Octale

La notation octale simplifie le processus en attribuant un chiffre unique pour chaque combinaison de permissions.

- ### **Chiffres et leurs significations** :
  - `4` pour lire
  - `2` pour écrire
  - `1` pour exécuter
  - Les permissions sont la somme de ces valeurs pour chaque catégorie d'utilisateur.

### Exemples d'utilisation

**Donner le droit de lire et écrire au propriétaire, lire au groupe, et rien aux autres** :

```bash
chmod 640 fichier
```

- `chmod 755 fichier` : Définit les permissions de `fichier` pour que le propriétaire ait tous les droits (lire, écrire, exécuter), et que le groupe et les autres aient seulement le droit de lire et exécuter.
- `chmod 644 fichier` : Définit les permissions de `fichier` pour que le propriétaire puisse lire et écrire dans le fichier, tandis que le groupe et les autres ne peuvent que le lire.


## Structure

`chmod xyz fichier`

- `x` est le chiffre pour le propriétaire
- `y` est le chiffre pour le groupe
- `z` est le chiffre pour les autres


## Comprendre et Modifier les Permissions

**Vérifier les permissions** : Utilisez `ls -l` pour afficher les permissions actuelles des fichiers et répertoires.

**Changer les permissions** : Selon les besoins, utilisez la notation symbolique pour des ajustements précis ou la notation octale pour définir les permissions globales.

## Conseils

- **Utilisation prudente des droits d'écriture** : Soyez prudent en accordant des droits d'écriture, surtout pour les groupes ou les autres, car cela pourrait permettre des modifications non souhaitées.
- **Droits d'exécution pour les répertoires** : N'oubliez pas que les droits d'exécution sont nécessaires pour accéder à un répertoire et à son contenu.
- **Sécurité et partage** : Adaptez les permissions en fonction du niveau de partage et de sécurité requis. Utilisez des groupes pour gérer efficacement l'accès aux fichiers partagés.


## Masque umask

Le masque `umask` détermine les permissions qui seront retirées des permissions par défaut lors de la création de nouveaux fichiers et répertoires. Par exemple, un `umask` de `022` empêche les membres du groupe et les autres utilisateurs d'écrire dans les nouveaux fichiers (permissions par défaut de `666` pour les fichiers, donc `644` après application du `umask`), et de créer des répertoires avec des permissions de `755` (permissions par défaut de `777` pour les répertoires, donc `755` après application du `umask`).

Pour voir le `umask` actuel, tapez `umask` dans le terminal. Pour changer le `umask`, tapez `umask` suivi du nouveau masque, par exemple `umask 022`.

Le `umask` est particulièrement utile dans des environnements multi-utilisateurs pour contrôler les permissions par défaut des fichiers et répertoires et ainsi sécuriser les données contre un accès non autorisé.

Votre question soulève un point important sur la manière dont `umask` et les permissions de fichiers (souvent réglées via `chmod`) interagissent dans les systèmes UNIX et Linux.

Lorsque vous observez `umask` à `022` et que vous vous demandez pourquoi un fichier nouvellement créé avec `touch` a des permissions `644` au lieu de refléter directement le `umask`, il est crucial de comprendre la relation entre `umask` et les permissions de fichier.

### Comment umask Fonctionne

```bash
╭─adrien@adri ~/Documents                                         
╰─$ umask                                                         
022                                                               
╭─adrien@adri ~/Documents                                         
╰─$ touch newFile                                                 
╭─adrien@adri ~/Documents                                         
╰─$ ls -la                                                        
total 8                                                           
drwxr-xr-x  2 adrien adrien 4096 10 mars  21:15 .                 
drwx------ 23 adrien adrien 4096 10 mars  21:15 ..                
-rw-r--r--  1 adrien adrien    0 10 mars  21:15 newFile 
```
Le `umask` (mask de l'utilisateur) sert à déterminer les permissions *non accordées* par défaut lors de la création de nouveaux fichiers et répertoires. Les permissions par défaut pour les fichiers sont normalement `666` (rw-rw-rw-) et pour les répertoires `777` (rwxrwxrwx). Le `umask` est ensuite soustrait de ces permissions par défaut pour déterminer les permissions effectives du nouveau fichier ou répertoire.

- **`umask` à `022`** : Soustrait les droits d'écriture (w) pour le groupe (g) et les autres (o), mais laisse toutes les permissions intactes pour le propriétaire (u).
  - Pour un fichier, cela signifie que de `666`, on soustrait `022`, ce qui aboutit à des permissions de `644` (rw-r--r--), donnant le droit de lire et écrire au propriétaire, mais seulement de lire au groupe et aux autres.
  - Pour un répertoire, cela signifie que de `777`, on soustrait `022`, résultant en des permissions de `755` (rwxr-xr-x), donnant tous les droits au propriétaire mais limitant le groupe et les autres à lire et exécuter.

#### Explication de la "Différence d'Écriture"

La "différence d'écriture" entre le `umask` et les permissions effectives (`644` pour les fichiers dans votre cas) n'est pas une différence au sens littéral, mais plutôt le résultat de l'application du `umask` aux permissions par défaut. `umask` définit les bits qui doivent être *retirés* des permissions complètes, et non les permissions elles-mêmes.

#### Pourquoi `newFile` a des permissions `644`

Quand vous créez `newFile` avec `touch`, le système applique le `umask` actuel (`022`) aux permissions par défaut pour un fichier (`666`). Ainsi, `666 - 022 = 644`, ce qui signifie que le fichier est créé avec des permissions `644` (rw-r--r--), ce qui est exactement ce que vous avez observé. Le `umask` ne spécifie pas les permissions directement, mais plutôt quelles permissions retirer des permissions maximales autorisées pour les nouveaux fichiers et répertoires.



<hr><br>

# création de fichier avec `sudo touch`

Lorsque vous utilisez la commande `sudo touch mesDroits`, le fichier `mesDroits` sera créé avec `root` comme propriétaire et `root` comme groupe associé par défaut. Cela est dû à l'utilisation de `sudo`, qui exécute la commande avec les privilèges du superutilisateur, `root`.

Pour accéder au fichier `mesDroits` après sa création avec `sudo`, cela dépend des permissions attribuées au fichier. Par défaut, un fichier créé avec `touch` aura généralement les permissions `644` (ou une autre valeur par défaut, dépendant du `umask` en vigueur), ce qui signifie :

- Le propriétaire (`root`, dans ce cas) a le droit de lire et d'écrire dans le fichier.
- Le groupe (`root`, ici) a le droit de lire le fichier.
- Les autres utilisateurs ont également le droit de lire le fichier.

## Pour Modifier les Permissions

Si vous souhaitez restreindre ou modifier l'accès au fichier pour qu'un utilisateur spécifique puisse y accéder, vous pouvez le faire de plusieurs manières :

1. **Changer le propriétaire et/ou le groupe du fichier** : Vous pouvez utiliser `sudo chown` pour changer le propriétaire et `sudo chgrp` (ou `chown` avec `:`) pour changer le groupe du fichier. Par exemple, pour changer le propriétaire du fichier en `adrien` et le groupe en `adrien`, vous pouvez utiliser :
   
   ```bash
   sudo chown adrien:adrien mesDroits
   ```
   
   Après cette opération, `adrien` sera le propriétaire et aura le contrôle total sur le fichier, selon les permissions définies.

2. **Modifier les permissions** : Si vous souhaitez que certains utilisateurs ou groupes aient accès au fichier sans en changer la propriété, vous pouvez utiliser `chmod` pour ajuster les permissions. Par exemple, pour permettre à tous les utilisateurs de lire le fichier :
   
   ```bash
   sudo chmod 644 mesDroits
   ```
   
   Ou, si vous souhaitez que seul le groupe ait accès au fichier, vous pourriez d'abord changer le groupe puis ajuster les permissions :
   
   ```bash
   sudo chgrp groupe_cible mesDroits
   sudo chmod 640 mesDroits
   ```
   
   Cela donnerait au propriétaire (`root`) et aux membres du `groupe_cible` le droit de lire le fichier, mais aucun droit aux autres utilisateurs.

## Résumé

Pour qu'un utilisateur puisse accéder au fichier `mesDroits` créé avec `sudo touch` (donc appartenant à `root` par défaut), vous devrez ajuster soit la propriété du fichier (avec `chown`) et/ou les permissions du fichier (avec `chmod`) en fonction de vos besoins de sécurité et de partage. Le groupe auquel l'utilisateur doit appartenir (ou les permissions à ajuster) dépendra de la manière dont vous configurez ces permissions.