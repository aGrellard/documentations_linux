

---

<!-- File: dnsutils.md -->

- [Documentation sur le paquet `dnsutils` sous Debian et dérivés](#documentation-sur-le-paquet-dnsutils-sous-debian-et-dérivés)
  - [Introduction](#introduction)
  - [Contenu de `dnsutils`](#contenu-de-dnsutils)
  - [Installation](#installation)
  - [Exemples d'utilisation](#exemples-dutilisation)
    - [Utilisation de `dig`](#utilisation-de-dig)
    - [Utilisation de `nslookup`](#utilisation-de-nslookup)
    - [Utilisation de `host`](#utilisation-de-host)
  - [Bonnes pratiques et conseils](#bonnes-pratiques-et-conseils)
  - [Conclusion](#conclusion)


# Documentation sur le paquet `dnsutils` sous Debian et dérivés

## Introduction

`dnsutils` est un ensemble d'outils en ligne de commande pour interroger et tester le système de noms de domaine (DNS). Disponible sur les distributions basées sur Debian, `dnsutils` est indispensable pour les administrateurs réseau et toute personne travaillant avec des configurations DNS ou résolvant des problèmes de connectivité réseau.

## Contenu de `dnsutils`

Le paquet `dnsutils` inclut plusieurs utilitaires clés :

- **`dig`** (Domain Information Groper) : Utilisé pour interroger les serveurs DNS et obtenir des informations détaillées sur différents enregistrements DNS (A, MX, TXT, etc.).
- **`nslookup`** : Outil pour rechercher des informations DNS sur des domaines. Bien que `nslookup` soit considéré comme obsolète par certains, il reste largement utilisé pour sa simplicité.
- **`host`** : Permet de rechercher des noms de domaine et d'afficher leurs correspondances d'adresse IP, ainsi que des enregistrements DNS inversés.

## Installation

Pour installer `dnsutils` sur un système Debian ou un dérivé de Debian, ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install dnsutils
```

Cela met à jour la liste des paquets disponibles et installe `dnsutils` et ses dépendances.

## Exemples d'utilisation

### Utilisation de `dig`

- **Interroger un enregistrement A pour un domaine** :
  
  ```bash
  dig example.com A
  ```
  
  Ceci renvoie l'enregistrement A (adresse IP) pour `example.com`.

- **Obtenir tous les types d'enregistrements pour un domaine** :
  
  ```bash
  dig example.com ANY
  ```
  
  Notez que l'utilisation de `ANY` est souvent limitée par les serveurs DNS en raison de considérations de sécurité.

### Utilisation de `nslookup`

- **Rechercher les enregistrements MX (serveurs de messagerie) d'un domaine** :
  
  ```bash
  nslookup -query=MX example.com
  ```
  
  Cela renvoie la liste des serveurs de messagerie pour `example.com`.

### Utilisation de `host`

- **Trouver l'adresse IP associée à un nom de domaine** :
  
  ```bash
  host example.com
  ```
  
  Affiche les adresses IP associées à `example.com`.

- **Effectuer une recherche DNS inverse** :
  
  ```bash
  host 93.184.216.34
  ```
  
  Renvoie le nom de domaine associé à l'adresse IP `93.184.216.34`.

## Bonnes pratiques et conseils

- **Tester la propagation DNS** : Utilisez `dig` avec différents serveurs DNS (en utilisant l'option `@`) pour tester la propagation d'un changement DNS.
- **Déboguer les problèmes de messagerie** : Utilisez `dig` pour interroger les enregistrements MX et vérifier que les serveurs de messagerie sont correctement configurés.
- **Automatiser les requêtes DNS** : Les outils de `dnsutils` peuvent être utilisés dans des scripts pour automatiser la surveillance et le dépannage du DNS.

## Conclusion

`dnsutils` offre une suite puissante d'outils pour interroger et diagnostiquer le système DNS. Que vous soyez un administrateur réseau expérimenté ou simplement quelqu'un qui a besoin de résoudre des problèmes de connectivité, connaître `dnsutils` est essentiel pour travailler efficacement avec DNS sous Debian et ses dérivés. Ces outils fournissent des informations précieuses et détaillées qui aident à comprendre et à résoudre les problèmes de DNS.

---

<!-- File: dpkg-reconfiure.md -->



---

<!-- File: index.md -->

# Commandes de base


---

<!-- File: combined_all.md -->



---

<!-- File: chown.md -->

- [`chown`](#chown)
  - [Introduction](#introduction)
  - [Syntaxe de Base](#syntaxe-de-base)
  - [Changement de Propriétaire](#changement-de-propriétaire)
  - [Changement de Groupe](#changement-de-groupe)
  - [Changement de Propriétaire et de Groupe](#changement-de-propriétaire-et-de-groupe)
  - [Options Communes](#options-communes)
  - [Exemples Pratiques](#exemples-pratiques)
  - [Conseils de Sécurité](#conseils-de-sécurité)
  - [Conclusion](#conclusion)

# `chown`

## Introduction

La commande `chown` (change owner) est un outil crucial dans les systèmes d'exploitation basés sur UNIX et Linux. Elle permet de changer le propriétaire et/ou le groupe associé à des fichiers et des répertoires. Comprendre comment utiliser `chown` est essentiel pour gérer les permissions et l'accès aux fichiers dans un système multi-utilisateurs.

## Syntaxe de Base

La syntaxe de base de la commande `chown` est :

```bash
chown [OPTION]... [PROPRIETAIRE][:[GROUPE]] FICHIER...
```

- **[PROPRIETAIRE]** : Le nom de l'utilisateur qui deviendra le nouveau propriétaire du fichier ou répertoire.
- **[GROUPE]** : Le nom du groupe qui sera associé au fichier ou répertoire. Le nom du groupe est optionnel; si un groupe est spécifié, il doit être précédé d'un deux-points `:` sans espace entre le propriétaire et le groupe.
- **FICHIER...** : Le chemin vers le(s) fichier(s) ou répertoire(s) sur le(s)quel(s) appliquer le changement.

## Changement de Propriétaire

Pour changer le propriétaire d'un fichier ou d'un répertoire :

```bash
chown nouveau_proprietaire fichier.txt
```

Cette commande attribuera `nouveau_proprietaire` comme nouveau propriétaire de `fichier.txt`.

## Changement de Groupe

Pour changer uniquement le groupe associé sans modifier le propriétaire :

```bash
chown :nouveau_groupe fichier.txt
```

Notez le deux-points `:` avant le nom du groupe, indiquant que seul le groupe est modifié.

## Changement de Propriétaire et de Groupe

Pour changer à la fois le propriétaire et le groupe :

```bash
chown nouveau_proprietaire:nouveau_groupe fichier.txt
```

Cette commande change le propriétaire en `nouveau_proprietaire` et le groupe en `nouveau_groupe` pour `fichier.txt`.

## Options Communes

- `-R`, `--recursive` : Appliquer le changement de manière récursive à tous les fichiers et sous-répertoires.
- `--from=PROPRIETAIRE_ACTUEL:GROUPE_ACTUEL` : Ne changer le propriétaire et/ou le groupe que si le propriétaire et/ou le groupe actuel correspondent aux spécifications.

## Exemples Pratiques

**Changer le propriétaire de tous les fichiers dans un répertoire de manière récursive** :

```bash
chown -R nouveau_proprietaire /chemin/vers/repertoire
```

**Changer le groupe d'un répertoire et de son contenu** :

```bash
chown -R :nouveau_groupe /chemin/vers/repertoire
```

**Changer le propriétaire et le groupe si le fichier appartient à un certain propriétaire et groupe** :

```bash
chown --from=ancien_proprietaire:ancien_groupe nouveau_proprietaire:nouveau_groupe fichier.txt
```

## Conseils de Sécurité

- **Utilisez `chown` avec précaution** : Changer le propriétaire ou le groupe peut affecter l'accès aux fichiers et répertoires, assurez-vous donc de comprendre les implications.
- **Vérifiez avant d'appliquer récursivement** : L'option `-R` peut modifier de nombreux fichiers. Vérifiez le chemin et les fichiers concernés avant de l'exécuter.
- **Gestion des droits d'accès** : Souvenez-vous que `chown` modifie le propriétaire et le groupe, mais pas les permissions. Utilisez `chmod` pour ajuster les permissions si nécessaire après un changement de propriété.

## Conclusion

La commande `chown` est un outil essentiel pour la gestion des propriétaires et des groupes de fichiers sur les systèmes Linux et UNIX. Elle offre une flexibilité considérable dans la gestion des accès et des droits, essentielle dans un environnement sécurisé et multi-utilisateurs. En maîtrisant `chown`, vous pouvez contrôler efficacement qui peut accéder à quoi sur votre système, ce qui est crucial pour la sécurité et l'organisation des fichiers.

---

<!-- File: groups.md -->

- [les Groupes sous Linux](#les-groupes-sous-linux)
  - [Introduction](#introduction)
  - [Comprendre les Groupes](#comprendre-les-groupes)
    - [Afficher les Groupes](#afficher-les-groupes)
    - [Gérer les Groupes](#gérer-les-groupes)
      - [Créer un Groupe](#créer-un-groupe)
      - [Supprimer un Groupe](#supprimer-un-groupe)
      - [Ajouter un Utilisateur à un Groupe](#ajouter-un-utilisateur-à-un-groupe)
      - [Changer le Groupe Principal d'un Utilisateur](#changer-le-groupe-principal-dun-utilisateur)
    - [Gestion des Permissions avec les Groupes](#gestion-des-permissions-avec-les-groupes)
    - [Exemple Pratique](#exemple-pratique)
  - [Conseils de Sécurité](#conseils-de-sécurité)
  - [Conclusion](#conclusion)


# les Groupes sous Linux

## Introduction

Dans les systèmes d'exploitation basés sur Linux, les groupes sont utilisés pour organiser et gérer les permissions d'accès aux fichiers et répertoires pour un ensemble d'utilisateurs. Cela permet à l'administrateur système de gérer les droits d'accès de manière plus efficace et granulaire.

## Comprendre les Groupes

Un groupe est une collection d'utilisateurs. Chaque utilisateur appartient à au moins un groupe, son groupe principal, mais peut également appartenir à d'autres groupes. Les fichiers et répertoires sur le système ont non seulement un propriétaire mais aussi un groupe associé, qui détermine les permissions d'accès pour les membres du groupe.

### Afficher les Groupes

- **Lister les groupes d'un utilisateur** : Pour voir à quels groupes un utilisateur appartient, utilisez la commande `groups`.

  ```bash
  groups [nom_utilisateur]
  ```

- **Voir le groupe principal d'un utilisateur** : La commande `id` montre également le groupe principal d'un utilisateur ainsi que les autres groupes auxquels il appartient.

  ```bash
  id [nom_utilisateur]
  ```

### Gérer les Groupes

#### Créer un Groupe

- **`groupadd`** : Utilisez cette commande pour créer un nouveau groupe.

  ```bash
  sudo groupadd [nom_du_groupe]
  ```

#### Supprimer un Groupe

- **`groupdel`** : Supprime un groupe existant.

  ```bash
  sudo groupdel [nom_du_groupe]
  ```

#### Ajouter un Utilisateur à un Groupe

- **`usermod`** : Pour ajouter un utilisateur à un groupe supplémentaire.

  ```bash
  sudo usermod -a -G [nom_du_groupe] [nom_utilisateur]
  ```

- **`gpasswd`** : Une autre méthode pour ajouter ou supprimer des membres d'un groupe.

  ```bash
  sudo gpasswd -a [nom_utilisateur] [nom_du_groupe]
  ```

#### Changer le Groupe Principal d'un Utilisateur

- **`usermod`** : Change le groupe principal d'un utilisateur.

  ```bash
  sudo usermod -g [nouveau_groupe_principal] [nom_utilisateur]
  ```

### Gestion des Permissions avec les Groupes

Les permissions sous Linux sont définies pour trois catégories : le propriétaire du fichier, le groupe associé au fichier, et les autres utilisateurs. Les permissions sont indiquées comme suit :

- **Lire (r)** : Permet de voir le contenu du fichier/dossier.
- **Écrire (w)** : Permet de modifier le fichier/dossier.
- **Exécuter (x)** : Permet d'exécuter le fichier ou d'accéder au dossier.

### Exemple Pratique

Supposons que vous souhaitiez permettre à plusieurs utilisateurs de travailler sur des projets dans le dossier `/projets`. Vous pourriez :

1. **Créer un groupe pour le projet** :

   ```bash
   sudo groupadd projetX
   ```

2. **Ajouter des utilisateurs au groupe** :

   ```bash
   sudo usermod -a -G projetX utilisateur1
   sudo usermod -a -G projetX utilisateur2
   ```

3. **Changer le groupe propriétaire du dossier de projets** :

   ```bash
   sudo chown :projetX /projets
   ```

4. **Définir les permissions appropriées** :

   ```bash
   sudo chmod 770 /projets
   ```

Cela permet aux membres du groupe `projetX` de lire, écrire et exécuter dans le dossier `/projets`, tandis que personne d'autre en dehors du groupe ne peut accéder au dossier.

## Conseils de Sécurité

- **Principe de moindre privilège** : Attribuez les utilisateurs aux groupes uniquement quand nécessaire. Limitez les permissions pour réduire les risques de sécurité.
- **Surveillance des appartenances aux groupes** : Revoyez régulièrement qui appartient à quels groupes pour s'assurer que les permissions restent appropriées.

## Conclusion

La gestion des groupes est une composante essentielle de la gestion des systèmes Linux, permettant un contrôle précis des permissions d'accès aux ressources du système. En utilisant des groupes, vous pouvez simplifier la gestion des permissions pour un ensemble d'utilisateurs, ce qui est particulièrement utile dans des environnements où de nombreux utilisateurs ont besoin d'accéder et de travailler avec les mêmes fichiers ou répertoires.

---

<!-- File: mask.md -->

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

---

<!-- File: markdown_in_terminal.md -->


1. **Glow**: Glow est un lecteur de Markdown conçu pour le terminal. Il rend les fichiers Markdown avec style, en gérant le formatage et les couleurs pour une meilleure lisibilité. Pour l'installer et l'utiliser :
   - Installation : Vous pouvez installer Glow en utilisant Homebrew sur macOS (`brew install glow`) ou le gestionnaire de paquets de votre distribution Linux (par exemple, `sudo apt install glow` pour Debian/Ubuntu).
   - Utilisation : Pour prévisualiser un fichier Markdown, utilisez simplement la commande `glow nom_du_fichier.md`.

2. **Bat**: Bat est un clone de `cat` avec syntax highlighting et support Git. Il supporte également la prévisualisation de fichiers Markdown en ligne de commande. Pour l'installer et l'utiliser :
   - Installation : Similaire à Glow, vous pouvez installer Bat via Homebrew (`brew install bat`) ou le gestionnaire de paquets de votre système.
   - Utilisation : Pour afficher un fichier Markdown, tapez `bat nom_du_fichier.md`. Cependant, notez que Bat affiche le Markdown sans le rendre comme le ferait Glow; il met plutôt en évidence la syntaxe.

3. **Pandoc** avec un visualiseur de terminal : Pandoc est un convertisseur de documents qui peut transformer des fichiers Markdown en différents formats. Pour une prévisualisation en terminal, vous pouvez convertir le Markdown en HTML, puis utiliser un visualiseur de terminal tel que `lynx` pour afficher le résultat.
   - Installation : Installez Pandoc (`sudo apt install pandoc` pour Debian/Ubuntu) et Lynx (`sudo apt install lynx`).
   - Utilisation : Convertissez d'abord le Markdown en HTML (`pandoc nom_du_fichier.md -o temp.html`), puis utilisez Lynx pour le visualiser (`lynx temp.html`). N'oubliez pas de supprimer le fichier HTML temporaire après.

Ces outils devraient vous permettre de prévisualiser efficacement des fichiers Markdown directement depuis votre terminal. Choisissez celui qui correspond le mieux à vos besoins ou à votre environnement de travail.

---

<!-- File: pandoc.md -->

- [`pandoc`](#pandoc)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Paramètres et Options Principales](#paramètres-et-options-principales)
  - [Exemples d'Utilisation de `pandoc`](#exemples-dutilisation-de-pandoc)
    - [Convertir un Fichier Markdown en HTML](#convertir-un-fichier-markdown-en-html)
    - [Créer un PDF à partir d'un Fichier Markdown](#créer-un-pdf-à-partir-dun-fichier-markdown)
    - [Générer un EPUB à partir d'un Fichier Markdown](#générer-un-epub-à-partir-dun-fichier-markdown)
    - [Ajouter une Table des Matières à un Document HTML](#ajouter-une-table-des-matières-à-un-document-html)
    - [Convertir un Document Word en Markdown](#convertir-un-document-word-en-markdown)
    - [Lier une Feuille de Style CSS à un Document HTML](#lier-une-feuille-de-style-css-à-un-document-html)
    - [Utiliser un Moteur PDF Spécifique](#utiliser-un-moteur-pdf-spécifique)
    - [Définir les Métadonnées d'un Document](#définir-les-métadonnées-dun-document)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `pandoc`

## Introduction

`pandoc` est un convertisseur de documents universel, reconnu pour sa flexibilité et sa capacité à gérer une multitude de formats de fichiers, allant du Markdown au HTML, LaTeX, EPUB, PDF, et bien d'autres. C'est l'outil idéal pour les auteurs, chercheurs, et toute personne ayant besoin de convertir des documents d'un format à un autre.

## Installation

Pour installer `pandoc`, utilisez le gestionnaire de paquets de votre distribution Linux :

- **Debian/Ubuntu** :
  ```bash
  sudo apt install pandoc
  ```
- **Fedora** :
  ```bash
  sudo dnf install pandoc
  ```
- **Arch Linux** :
  ```bash
  sudo pacman -S pandoc
  ```

## Paramètres et Options Principales

`pandoc` offre un vaste ensemble d'options pour personnaliser le processus de conversion. Voici quelques-unes des options les plus couramment utilisées :

- `-f`, `--from=FORMAT` : Spécifie le format du document source.
- `-t`, `--to=FORMAT` : Définit le format de sortie.
- `-o`, `--output=FILE` : Indique le fichier de sortie. Sans cette option, `pandoc` écrit sur `stdout`.
- `--list-input-formats` : Liste tous les formats d'entrée disponibles.
- `--list-output-formats` : Liste tous les formats de sortie disponibles.
- `--list-extensions[=FORMAT]` : Montre toutes les extensions disponibles pour un format donné.
- `-s`, `--standalone` : Produit un document autonome, incluant un entête et un pied de page, si nécessaire.
- `--toc`, `--table-of-contents` : Ajoute une table des matières au document final.
- `-c`, `--css=URL` : Lie une feuille de style CSS externe (pour les formats HTML).
- `--pdf-engine=ENGINE` : Spécifie le moteur à utiliser pour la conversion en PDF (par exemple, `wkhtmltopdf`, `weasyprint`).
- `--metadata=KEY[:VALUE]` : Définit une valeur de métadonnée (par exemple, titre, auteur).

## Exemples d'Utilisation de `pandoc`

### Convertir un Fichier Markdown en HTML

```bash
pandoc -f markdown -t html -o document.html document.md
```

### Créer un PDF à partir d'un Fichier Markdown

```bash
pandoc document.md -o document.pdf
```

### Générer un EPUB à partir d'un Fichier Markdown

```bash
pandoc document.md -o document.epub
```

### Ajouter une Table des Matières à un Document HTML

```bash
pandoc document.md --toc -s -o document.html
```

### Convertir un Document Word en Markdown

```bash
pandoc -f docx -t markdown -o document.md document.docx
```

### Lier une Feuille de Style CSS à un Document HTML

```bash
pandoc document.md -c style.css -s -o document.html
```

### Utiliser un Moteur PDF Spécifique

```bash
pandoc document.md --pdf-engine=wkhtmltopdf -o document.pdf
```

### Définir les Métadonnées d'un Document

```bash
pandoc document.md -o document.pdf --metadata title="Mon Titre" --metadata author="Mon Nom"
```

## Bonnes Pratiques

- **Conversion de Fichiers Volumineux** : Pour les documents particulièrement longs ou complexes, surveillez l'utilisation des ressources système, car `pandoc` peut être gourmand en ressources pour certaines tâches.
- **Personnalisation avec des Fichiers CSS** : Pour les conversions vers HTML ou EPUB, personnalisez l'apparence de votre document en liant des fichiers CSS externes.
- **Utilisation des Extensions** : Profitez des nombreuses extensions de `pandoc` pour ajuster le comportement du Markdown et d'autres formats, permettant une personnalisation plus fine du document final.
- **Scripts et Automatisation** : Intégrez `pandoc` dans des scripts pour automatiser la conversion de documents dans le cadre de workflows de publication, de recherche, ou de développement de documentation.

## Conclusion

`pandoc` est un outil extrêmement puissant et polyvalent pour la conversion de documents. Sa capacité à traiter une

 large gamme de formats en fait un outil indispensable pour quiconque travaille régulièrement avec des documents numériques. En maîtrisant `pandoc` et ses nombreuses options, vous pouvez simplifier et automatiser vos tâches de conversion de documents, améliorant ainsi votre productivité et l'efficacité de votre workflow.

---

<!-- File: vscode_commandLine.md -->

- [1. Ouvrir VS Code](#1-ouvrir-vs-code)
  - [**Ouvrir VS Code**:](#ouvrir-vs-code)
  - [**Ouvrir un fichier ou dossier**:](#ouvrir-un-fichier-ou-dossier)
  - [**Ouvrir un fichier à une ligne et colonne spécifiques**:](#ouvrir-un-fichier-à-une-ligne-et-colonne-spécifiques)
- [2. Gestion des fenêtres et des sessions](#2-gestion-des-fenêtres-et-des-sessions)
  - [**Ajouter un dossier à la dernière fenêtre active**:](#ajouter-un-dossier-à-la-dernière-fenêtre-active)
  - [**Nouvelle fenêtre**:](#nouvelle-fenêtre)
  - [**Rejoindre une fenêtre (pour le développement multi-serveur)**:](#rejoindre-une-fenêtre-pour-le-développement-multi-serveur)
  - [**Aller à un fichier (Quick Open)**:](#aller-à-un-fichier-quick-open)
- [3. Gestion des espaces de travail](#3-gestion-des-espaces-de-travail)
  - [**Ouvrir un espace de travail**:](#ouvrir-un-espace-de-travail)
  - [**Créer un nouvel espace de travail avec des dossiers spécifiques**:](#créer-un-nouvel-espace-de-travail-avec-des-dossiers-spécifiques)
- [4. Différences et modifications](#4-différences-et-modifications)
  - [**Comparer deux fichiers**:](#comparer-deux-fichiers)
- [5. Options diverses](#5-options-diverses)
  - [**Forcer une nouvelle instance**:](#forcer-une-nouvelle-instance)
  - [**Ouvrir un fichier ou dossier en mode lecture seule** (Preview) :](#ouvrir-un-fichier-ou-dossier-en-mode-lecture-seule-preview-)
  - [**Désactiver les extensions**:](#désactiver-les-extensions)
  - [**Ouvrir VS Code avec une langue spécifique**:](#ouvrir-vs-code-avec-une-langue-spécifique)
  - [**Afficher la version de VS Code**:](#afficher-la-version-de-vs-code)
  - [**Afficher l'aide sur la ligne de commande**:](#afficher-laide-sur-la-ligne-de-commande)
- [Exemples pratiques](#exemples-pratiques)
  - [**Ouvrir plusieurs dossiers dans une nouvelle fenêtre**:](#ouvrir-plusieurs-dossiers-dans-une-nouvelle-fenêtre)
  - [**Comparer deux fichiers directement**:](#comparer-deux-fichiers-directement)


### 1. Ouvrir VS Code

#### **Ouvrir VS Code**:
-
    ```bash
    code
    ```
#### **Ouvrir un fichier ou dossier**:
  - 
    ```bash
    code /chemin/vers/fichier_ou_dossier
    ```

#### **Ouvrir un fichier à une ligne et colonne spécifiques**:
  - 
    ```bash
    code /chemin/vers/fichier:ligne:colonne
    ```

### 2. Gestion des fenêtres et des sessions

#### **Ajouter un dossier à la dernière fenêtre active**:
  - 
    ```bash
    code --add /chemin/vers/dossier
    ```

#### **Nouvelle fenêtre**:
  - 
    ```bash
    code --new-window
    ```

  ou pour ouvrir un fichier/dossier dans une nouvelle fenêtre:

  - 
    ```bash
    code --new-window /chemin/vers/fichier_ou_dossier
    ```

#### **Rejoindre une fenêtre (pour le développement multi-serveur)**:
  - 
    ```bash
    code --reuse-window
    ```

#### **Aller à un fichier (Quick Open)**:
  - 
    ```bash
    code --goto /chemin/vers/fichier:ligne:colonne
    ```

### 3. Gestion des espaces de travail

#### **Ouvrir un espace de travail**:
  - 
    ```bash
    code /chemin/vers/espace_de_travail.code-workspace
    ```

#### **Créer un nouvel espace de travail avec des dossiers spécifiques**:
  - 
    ```bash
    code --new-window --add /chemin/vers/dossier1 --add /chemin/vers/dossier2
    ```

### 4. Différences et modifications

#### **Comparer deux fichiers**:
  - 
    ```bash
    code --diff /chemin/vers/fichier1 /chemin/vers/fichier2
    ```

### 5. Options diverses

#### **Forcer une nouvelle instance**:
  - 
    ```bash
    code --new-instance
    ```

#### **Ouvrir un fichier ou dossier en mode lecture seule** (Preview) :
  - 
    ```bash
    code --preview /chemin/vers/fichier_ou_dossier
    ```

#### **Désactiver les extensions**:
  - 
    ```bash
    code --disable-extensions
    ```

#### **Ouvrir VS Code avec une langue spécifique**:
  - 
    ```bash
    code --locale=fr
    ```

#### **Afficher la version de VS Code**:
  - 
    ```bash
    code --version
    ```

#### **Afficher l'aide sur la ligne de commande**:
  - 
    ```bash
    code --help
    ```

### Exemples pratiques

#### **Ouvrir plusieurs dossiers dans une nouvelle fenêtre**:
  - 
    ```bash
    code --new-window --add /chemin/vers/dossier1 --add /chemin/vers/dossier2
    ```

#### **Comparer deux fichiers directement**:
  - 
    ```bash
    code --diff /chemin/vers/fichier1.txt /chemin/vers/fichier2.txt
    ```

Cette liste couvre les options de ligne de commande les plus courantes et utiles. VS Code est régulièrement mis à jour avec de nouvelles fonctionnalités, donc pour la liste la plus à jour des options de ligne de commande, vous pouvez exécuter `code --help` dans votre terminal ou consulter la documentation officielle de VS Code.

---

<!-- File: xclip.md -->

- [`xclip`](#xclip)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Paramètres et Options](#paramètres-et-options)
  - [Comment Utiliser `xclip`](#comment-utiliser-xclip)
    - [Copier du Texte dans le Presse-papiers](#copier-du-texte-dans-le-presse-papiers)
    - [Coller du Texte depuis le Presse-papiers](#coller-du-texte-depuis-le-presse-papiers)
  - [Exemples d'Utilisation de `xclip`](#exemples-dutilisation-de-xclip)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `xclip`

## Introduction

`xclip` est un outil de ligne de commande sous Linux qui fournit une interface aux presse-papiers de X11, permettant la redirection du contenu de la sortie de commandes vers le presse-papiers, facilitant ainsi le partage de données entre le terminal et les applications graphiques.

## Installation

Sur Debian, Ubuntu, et leurs dérivés :

```bash
sudo apt install xclip
```

Sur Fedora et dérivés :

```bash
sudo dnf install xclip
```

Sur Arch Linux et dérivés :

```bash
sudo pacman -S xclip
```

## Paramètres et Options

`xclip` propose plusieurs options pour contrôler son comportement :

- `-i`, `--in` : Lit le texte depuis l'entrée standard (c'est le comportement par défaut).

- `-o`, `--out` : Affiche le contenu du presse-papiers sélectionné.

- `-selection`, `-sel` : Spécifie le presse-papiers à utiliser. Les valeurs possibles sont `primary`, `secondary`, et `clipboard`. Par défaut, `xclip` utilise le presse-papiers `primary`.

- `-target`, `-t` : Spécifie le type MIME du contenu à manipuler. Utile pour des opérations avancées, comme copier des images.

- `-verbose`, `-v` : Affiche des informations supplémentaires sur les opérations effectuées.

- `-version`, `-V` : Affiche la version de `xclip`.

- `-display`, `-d` : Spécifie le serveur X à utiliser.

- `-help`, `-h` : Affiche l'aide.

## Comment Utiliser `xclip`

### Copier du Texte dans le Presse-papiers

Pour copier le texte "Bonjour, monde!" dans le presse-papiers principal :

```bash
echo "Bonjour, monde!" | xclip
```

Pour copier dans le presse-papiers système (celui utilisé par Ctrl+C, Ctrl+V) :

```bash
echo "Bonjour, monde!" | xclip -selection clipboard
```

### Coller du Texte depuis le Presse-papiers

Pour coller du texte depuis le presse-papiers principal :

```bash
xclip -o
```

Pour coller depuis le presse-papiers système :

```bash
xclip -selection clipboard -o
```

## Exemples d'Utilisation de `xclip`

1. **Copier le contenu d'un fichier dans le presse-papiers :**

   ```bash
   xclip -sel clip < fichier.txt
   ```

2. **Copier la sortie d'une commande directement dans le presse-papiers :**

   ```bash
   ls | xclip -sel clip
   ```

3. **Coller le contenu du presse-papiers système dans un fichier :**

   ```bash
   xclip -sel clip -o > nouveau_fichier.txt
   ```

4. **Utiliser `xclip` pour copier des images (requiert spécification du type MIME) :**

   ```bash
   xclip -sel clip -t image/png -i image.png
   ```

5. **Afficher des informations détaillées lors de la copie :**

   ```bash
   echo "Infos détaillées" | xclip -sel clip -verbose
   ```

## Bonnes Pratiques

- **Sécurité des Données :** Soyez conscient des données que vous copiez dans le presse-papiers, surtout sur des systèmes partagés ou accessibles publiquement.
  
- **Automatisation :** Utilisez `xclip` dans des scripts pour améliorer l'efficacité de tâches répétitives, comme copier des logs ou des résultats de commandes pour une utilisation dans d'autres applications.

- **Intégration avec le Workflow :** Intégrez `xclip` dans votre workflow de ligne de commande pour faciliter le transfert d'informations entre le terminal et les applications graphiques sans interruption.

## Conclusion

`xclip` est un outil essentiel pour les utilisateurs de Linux qui travaillent régulièrement dans des environnements graphiques et en ligne de commande, offrant une passerelle flexible entre le terminal et le presse-papiers. La maîtrise de `xclip` peut grandement améliorer votre productivité en simplifiant le partage de données entre applications.

---

<!-- File: network-manager_install.md -->

// Documentation sur Network Manager sous Debian et dérivés

- [Network manager](#network-manager)
  - [Installation](#installation)
  - [Utilisation](#utilisation)
  - [Utilisation en Ligne de Commande](#utilisation-en-ligne-de-commande)
    - [Liste des Connexions](#liste-des-connexions)
    - [Activer/Désactiver une Connexion](#activerdésactiver-une-connexion)
    - [Ajouter une Connexion](#ajouter-une-connexion)
    - [modifier une connexion](#modifier-une-connexion)
    - [Supprimer une Connexion](#supprimer-une-connexion)
    - [lister les interfaces réseau](#lister-les-interfaces-réseau)
    - [lister les réseaux disponibles](#lister-les-réseaux-disponibles)
    - [Se connecter à un réseau Wi-Fi](#se-connecter-à-un-réseau-wi-fi)
    - [Se connecter à un réseau Wi-Fi caché](#se-connecter-à-un-réseau-wi-fi-caché)
    - [Se connecter à un réseau Wi-Fi avec une adresse IP statique](#se-connecter-à-un-réseau-wi-fi-avec-une-adresse-ip-statique)
    - [Se connecter à un réseau Wi-Fi avec un proxy](#se-connecter-à-un-réseau-wi-fi-avec-un-proxy)
    - [Supprimer un réseau Wi-Fi](#supprimer-un-réseau-wi-fi)
    - [Lister les Connexions Actives](#lister-les-connexions-actives)
    - [Lister les réseaux Wi-Fi enregistrés](#lister-les-réseaux-wi-fi-enregistrés)
    - [Se deconnecter d'un réseau Wi-Fi](#se-deconnecter-dun-réseau-wi-fi)
    - [Se deconnecter d'un réseau Ethernet](#se-deconnecter-dun-réseau-ethernet)
    - [Se connecter à un réseau Ethernet](#se-connecter-à-un-réseau-ethernet)
    - [se deconnecter de tous les réseaux](#se-deconnecter-de-tous-les-réseaux)
    - [configuration d'une adresse IP statique](#configuration-dune-adresse-ip-statique)
    - [configuration d'une adresse IP dynamique](#configuration-dune-adresse-ip-dynamique)
    - [configuration automatique de l'adresse IP](#configuration-automatique-de-ladresse-ip)
    - [configuration d'un serveur DNS](#configuration-dun-serveur-dns)


# Network manager

Network Manager est un outil de gestion de réseau qui permet de configurer facilement les connexions réseau sur les systèmes Linux. Il est installé par défaut sur la plupart des distributions Linux modernes.

## Installation

Sur Debian et ses dérivés, Network Manager peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install network-manager
```

Démarrez le service Network Manager :

```bash
sudo systemctl start NetworkManager
```

Pour activer le service au démarrage :

```bash
sudo systemctl enable NetworkManager
```

## Utilisation

Network Manager peut être utilisé en ligne de commande ou via une interface graphique. Pour lancer l'interface graphique, exécutez la commande suivante :

```bash
nm-connection-editor
```

## Utilisation en Ligne de Commande


### Liste des Connexions

Pour afficher la liste des connexions réseau :

```bash
nmcli connection show
```

### Activer/Désactiver une Connexion

Pour activer une connexion :

```bash
nmcli connection up <nom_connexion>
```

Pour désactiver une connexion :

```bash
nmcli connection down <nom_connexion>
```

### Ajouter une Connexion

Pour ajouter une connexion, vous pouvez utiliser la commande `nmcli` ou l'interface graphique `nm-connection-editor`.

Voici un exemple pour ajouter une connexion Ethernet statique :

```bash
sudo nmcli connection add con-name "eth0" ifname eth0 type ethernet ip4
```

exemple :

```bash
nmcli connection add con-name "eth0" ifname eth0 type ethernet ip4  
```

ajouter une connexion Wi-Fi :

```bash
nmcli connection add con-name <nom_connexion> type wifi ifname <interface> ssid <SSID> password <password>
```

exemple :

```bash
nmcli connection add con-name "MyWifi" type wifi ifname wlp3s0 ssid "MyWifi" password "password"
```

### modifier une connexion

```bash
nmcli connection modify <nom_connexion> <paramètres>
```

exemple :

```bash
nmcli connection modify "MyWifi" ipv4.method auto
```



### Supprimer une Connexion

Pour supprimer une connexion :

```bash
nmcli connection delete <nom_connexion>
```

### lister les interfaces réseau

```bash
nmcli device status
```

### lister les réseaux disponibles

```bash
nmcli device wifi list
```

### Se connecter à un réseau Wi-Fi

```bash
nmcli device wifi connect <SSID> password <password>
```

### Se connecter à un réseau Wi-Fi caché

```bash
nmcli device wifi connect <SSID> password <password> hidden yes
```

### Se connecter à un réseau Wi-Fi avec une adresse IP statique

```bash
nmcli device wifi connect <SSID> password <password> ip4 <IP> gw4 <Gateway>
```

### Se connecter à un réseau Wi-Fi avec un proxy

```bash
nmcli device wifi connect <SSID> password <password> ip4 <IP> gw4 <Gateway> ipv4.dns <DNS> ipv4.method auto 802-1x.eap peap 802-1x.phase2-auth mschapv2 802-1x.identity <Identity> 802-1x.password <Password>
```

### Supprimer un réseau Wi-Fi

```bash
nmcli connection delete <SSID>
```

### Lister les Connexions Actives

Pour afficher les connexions actives :

```bash
nmcli connection show --active
```

### Lister les réseaux Wi-Fi enregistrés

Pour afficher les réseaux Wi-Fi enregistrés :

```bash
nmcli connection show
```

### Se deconnecter d'un réseau Wi-Fi

```bash
nmcli connection down <SSID>
```

### Se deconnecter d'un réseau Ethernet

```bash
nmcli connection down <ethernet>
```

### Se connecter à un réseau Ethernet

```bash
nmcli connection up <ethernet>
```

### se deconnecter de tous les réseaux

```bash
nmcli connection down --all
```

### configuration d'une adresse IP statique

```bash
nmcli connection modify <nom_connexion> ipv4.method manual ipv4.address <IP> ipv4.gateway <Gateway> ipv4.dns <DNS>
```

### configuration d'une adresse IP dynamique

```bash
nmcli connection modify <nom_connexion> ipv4.method auto
```

### configuration automatique de l'adresse IP

```bash
nmcli connection modify <nom_connexion> ipv4.method auto
```

### configuration d'un serveur DNS

```bash
nmcli connection modify <nom_connexion> ipv4.dns <DNS>
```

ajouter un serveur DNS supplémentaire

```bash
nmcli connection modify <nom_connexion> +ipv4.dns <DNS>
```





---

<!-- File: vite.md -->

# vite + react

## node
```bash
sudo apt install nodejs
```
```bash
node -v
```

## npm
```bash
sudo apt install npm
```
```bash
npm -v
```

## nouveau projet vite
```bash
npx create-vite@latest
```
```bash
npm i
```
```bash
npm run dev
```

---

<!-- File: cut.md -->

# Tutoriel et Documentation Complète sur `cut`

## Introduction

`cut` est un utilitaire en ligne de commande Unix/Linux qui permet d'extraire des sections à partir de chaque ligne de fichiers ou de l'entrée standard. Il est particulièrement utile pour extraire des colonnes de texte dans des fichiers structurés par des délimiteurs ou des positions fixes.

## Syntaxe de Base

```bash
cut OPTION... [FILE]...
```

- `OPTION...` spécifie les options de coupe, comme le type de délimiteur et les champs à extraire.
- `[FILE]...` indique les fichiers d'entrée. Si aucun fichier n'est spécifié, `cut` lit l'entrée standard.

## Options Principales

- `-b`, `--bytes=LISTE` : Sélectionne uniquement ces octets.
- `-c`, `--characters=LISTE` : Sélectionne uniquement ces caractères.
- `-d`, `--delimiter=DELIM` : Utilise `DELIM` au lieu de TAB comme délimiteur de champ.
- `-f`, `--fields=LISTE` : Sélectionne uniquement ces champs; aussi imprimé pour chaque ligne d'entrée.
- `-n` : Avec `-b`, ne sépare pas les caractères multioctets (obsolète).
- `--complement` : Complémente la sélection.
- `--output-delimiter=CHAINE` : Utilise `CHAINE` comme délimiteur de sortie au lieu du délimiteur d'entrée.
- `-s`, `--only-delimited` : N'affiche que les lignes contenant le délimiteur.

## LISTE dans les Options

La `LISTE` est une séquence d'entiers séparés par des virgules, des tirets pour indiquer des plages. Exemples :

- `1,3,7` : Sélectionne les 1er, 3e et 7e champs ou octets/caractères.
- `1-5` : Sélectionne du 1er au 5e champ ou octets/caractères.
- `2-` : Sélectionne du 2e champ ou octets/caractères jusqu'à la fin.

## Exemples d'Utilisation de `cut`

### Extraire des Colonnes d'un Fichier Delimité par des TAB

```bash
cut -f1,3 fichier.txt
```

Extrait les 1er et 3e champs de chaque ligne dans `fichier.txt`, en utilisant TAB comme délimiteur par défaut.

### Utiliser un Délimiteur Spécifique

```bash
cut -d',' -f2 fichier.csv
```

Extrait le 2e champ de chaque ligne dans un fichier CSV (délimité par des virgules).

### Extraire une Plage de Caractères

```bash
cut -c1-5 fichier.txt
```

Extrait les cinq premiers caractères de chaque ligne.

### Combiner `cut` avec d'autres Commandes

Utiliser `cut` avec `grep` pour extraire des champs spécifiques de lignes qui correspondent à un motif :

```bash
grep "motif" fichier.txt | cut -d':' -f1
```

Cela recherche "motif" dans `fichier.txt`, puis extrait le 1er champ (délimité par `:`) de chaque ligne correspondante.

### Extraire des Colonnes d'un Fichier avec un Délimiteur Spécifique et un Délimiteur de Sortie Personnalisé

```bash
cut -d',' -f2,5 --output-delimiter=' ' fichier.csv
```

Extrait les 2e et 5e champs de chaque ligne dans un fichier CSV et utilise l'espace comme délimiteur de sortie.

### Utiliser `cut` pour Extraire des Informations de `/etc/passwd`

```bash
cut -d':' -f1 /etc/passwd
```

Affiche la liste des noms d'utilisateur dans le système (le 1er champ dans `/etc/passwd`).

## Conseils

- L'utilisation de `cut` est limitée aux fichiers ou aux entrées où les données sont structurées de manière prévisible.
- Pour des structures de données plus complexes, envisagez d'utiliser `awk` ou `sed` qui offrent une flexibilité accrue.
- `cut` est souvent utilisé dans les pipelines shell pour traiter l'entrée/la sortie d'autres commandes.

`cut` est un outil simple mais puissant qui s'avère indispensable pour le traitement rapide et efficace de données textuelles dans des scripts shell ou pour des

---

<!-- File: df.md -->


- [Documentation de la fonction `df`](#documentation-de-la-fonction-df)
  - [Syntaxe:](#syntaxe)
  - [Options principales:](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Afficher l'espace disque avec des unités lisibles](#1-afficher-lespace-disque-avec-des-unités-lisibles)
  - [2. Lister tous les systèmes de fichiers, y compris ceux de taille zéro](#2-lister-tous-les-systèmes-de-fichiers-y-compris-ceux-de-taille-zéro)
  - [3. Afficher les types de systèmes de fichiers avec l'espace disque](#3-afficher-les-types-de-systèmes-de-fichiers-avec-lespace-disque)
  - [4. Afficher l'espace disque pour un type de système de fichiers spécifique](#4-afficher-lespace-disque-pour-un-type-de-système-de-fichiers-spécifique)
  - [5. Exclure un type de système de fichiers spécifique de l'affichage](#5-exclure-un-type-de-système-de-fichiers-spécifique-de-laffichage)
  - [6. Afficher un résumé total de l'espace disque utilisé et disponible](#6-afficher-un-résumé-total-de-lespace-disque-utilisé-et-disponible)
- [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
  - [1. Surveillance de l'espace disque sur un serveur](#1-surveillance-de-lespace-disque-sur-un-serveur)
  - [2. Identification des systèmes de fichiers à faible espace disque](#2-identification-des-systèmes-de-fichiers-à-faible-espace-disque)
  - [3. Planification de la maintenance du disque](#3-planification-de-la-maintenance-du-disque)
  - [4. Audit des types de systèmes de fichiers](#4-audit-des-types-de-systèmes-de-fichiers)
  - [5. Surveillance de l'espace disque pour un type spécifique de système de fichiers](#5-surveillance-de-lespace-disque-pour-un-type-spécifique-de-système-de-fichiers)
  - [6. Exclure les systèmes de fichiers temporaires ou virtuels de l'affichage](#6-exclure-les-systèmes-de-fichiers-temporaires-ou-virtuels-de-laffichage)
  - [7. Trouver les systèmes de fichiers avec moins de 20% d'espace libre](#7-trouver-les-systèmes-de-fichiers-avec-moins-de-20-despace-libre)
  - [8. Trier les systèmes de fichiers par espace utilisé](#8-trier-les-systèmes-de-fichiers-par-espace-utilisé)
  - [9. Afficher l'utilisation du disque pour les systèmes de fichiers non-temporaires](#9-afficher-lutilisation-du-disque-pour-les-systèmes-de-fichiers-non-temporaires)
  - [10. Surveillance de l'espace disque spécifique à un chemin](#10-surveillance-de-lespace-disque-spécifique-à-un-chemin)
  - [11. Extraction de l'espace disque disponible pour un rapport](#11-extraction-de-lespace-disque-disponible-pour-un-rapport)
  - [12. Vérification de l'espace disque avec alerte pour faible espace disponible](#12-vérification-de-lespace-disque-avec-alerte-pour-faible-espace-disponible)


La commande `df` (disk free) est utilisée dans les systèmes Unix et Linux pour afficher l'espace disque disponible sur tous les systèmes de fichiers montés. Elle fournit des informations cruciales sur l'utilisation du disque, aidant les administrateurs à gérer l'espace disque efficacement.

# Documentation de la fonction `df`

## Syntaxe:
```
df [OPTIONS]... [FILE]...
```

## Options principales:

- `-h, --human-readable`: Affiche les tailles en format lisible par l'homme (par exemple, 1K, 234M, 2G).
- `-a, --all`: Inclut dans le rapport tous les systèmes de fichiers, y compris ceux de taille zéro.
- `-T, --print-type`: Affiche le type de système de fichiers.
- `-t, TYPE`: Affiche les systèmes de fichiers de type TYPE.
- `-x, TYPE`: Exclut les systèmes de fichiers de type TYPE.
- `--total`: Ajoute une ligne affichant les totaux.

# Exemples d'utilisation

## 1. Afficher l'espace disque avec des unités lisibles
   ```bash
   df -h
   ```

## 2. Lister tous les systèmes de fichiers, y compris ceux de taille zéro
   ```bash
   df -a
   ```

## 3. Afficher les types de systèmes de fichiers avec l'espace disque
   ```bash
   df -T
   ```

## 4. Afficher l'espace disque pour un type de système de fichiers spécifique
   ```bash
   df -t ext4
   ```

## 5. Exclure un type de système de fichiers spécifique de l'affichage
   ```bash
   df -x tmpfs
   ```

## 6. Afficher un résumé total de l'espace disque utilisé et disponible
   ```bash
   df --total
   ```

# Cas d'utilisation de la fonction

## 1. Surveillance de l'espace disque sur un serveur
   Pour vérifier rapidement l'espace disque disponible et utilisé sur un serveur, en utilisant des unités faciles à lire.
   ```bash
   df -h
   ```

## 2. Identification des systèmes de fichiers à faible espace disque
   En combinant `df` avec d'autres commandes comme `grep`, on peut identifier les systèmes de fichiers qui sont presque pleins.
   ```bash
   df -h | grep '^[^ ]*  *[89][0-9]%'
   ```

## 3. Planification de la maintenance du disque
   En utilisant `df` pour surveiller l'espace disque disponible, les administrateurs peuvent planifier l'ajout d'espace disque supplémentaire ou la suppression de fichiers inutiles avant d'atteindre une utilisation critique.
   ```bash
   df -h --total
   ```

## 4. Audit des types de systèmes de fichiers
   Pour identifier rapidement les types de systèmes de fichiers utilisés sur le système, facilitant la gestion des supports de stockage et la planification des sauvegardes.
   ```bash
   df -T
   ```

## 5. Surveillance de l'espace disque pour un type spécifique de système de fichiers
   Utile pour les systèmes qui utilisent différents types de systèmes de fichiers pour différentes applications ou services.
   ```bash
   df -h -t ext4
   ```

## 6. Exclure les systèmes de fichiers temporaires ou virtuels de l'affichage
   Pour se concentrer sur l'espace disque des systèmes de fichiers physiques uniquement, en excluant les systèmes de fichiers comme `tmpfs`.
   ```bash
   df -h -x tmpfs -x devtmpfs
   ```
## 7. Trouver les systèmes de fichiers avec moins de 20% d'espace libre
   Ce cas d'utilisation permet d'identifier rapidement les systèmes de fichiers critiques qui pourraient nécessiter une intervention pour libérer de l'espace ou planifier une extension de capacité.
   ```bash
   df -h | awk '$5 > 80 {print $0}'
   ```
   Ici, `awk` est utilisé pour filtrer les lignes où le cinquième champ (utilisation en pourcentage) dépasse 80%, indiquant moins de 20% d'espace libre.

## 8. Trier les systèmes de fichiers par espace utilisé
   Utile pour obtenir une vue d'ensemble de l'utilisation de l'espace disque, triée de manière à mettre en évidence les plus gros consommateurs d'espace.
   ```bash
   df -h | grep -v 'Use%' | sort -k 5 -r
   ```
   Cette commande exclut la ligne d'en-tête (avec `grep -v 'Use%'`), puis trie les résultats en fonction du cinquième champ (pourcentage utilisé), en ordre décroissant.

## 9. Afficher l'utilisation du disque pour les systèmes de fichiers non-temporaires
   Pour concentrer l'attention sur les systèmes de fichiers physiques, excluant les systèmes de fichiers temporaires souvent moins critiques.
   ```bash
   df -h | grep -vE 'tmpfs|devtmpfs'
   ```
   `grep -vE` est utilisé pour exclure les lignes contenant `tmpfs` ou `devtmpfs`, filtrant la sortie pour montrer uniquement les systèmes de fichiers persistants.

## 10. Surveillance de l'espace disque spécifique à un chemin
    Si vous êtes intéressé par l'espace disque disponible pour un chemin spécifique, vous pouvez diriger ce chemin vers `df` pour obtenir les informations pertinentes.
    ```bash
    df -h /path/to/interest | tail -n +2
    ```
    `tail -n +2` est utilisé pour supprimer la ligne d'en-tête de la sortie de `df`, affichant uniquement les informations du système de fichiers concerné.

## 11. Extraction de l'espace disque disponible pour un rapport
    Créer un rapport simple montrant les points de montage et l'espace disponible peut être utile pour les audits ou les vérifications rapides.
    ```bash
    df -h | awk '{print $6, $4}' | tail -n +2
    ```
    Cela utilise `awk` pour extraire les sixième (point de montage) et quatrième (espace disponible) champs de chaque ligne, en excluant la ligne d'en-tête avec `tail`.

## 12. Vérification de l'espace disque avec alerte pour faible espace disponible
    Ce script pourrait être utilisé dans des scripts de maintenance pour générer des alertes lorsque l'espace disque disponible tombe en dessous d'un seuil critique.
    ```bash
    df -h | awk '$5 > 90 {print "Alerte espace disque faible pour:", $6}'
    ```
    Ici, `awk` cherche des systèmes de fichiers où l'utilisation dépasse 90% et imprime un message d'alerte spécifique pour ces points de montage.


---

<!-- File: dirname.md -->

---
title: dirname
tags:
  - ressource
  - linux
  - bash
  - scripts
  - programmation
  - programmes
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
  - man-linux-magique
date: 2024-07-12
---

# Documentation pour la commande `dirname` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la commande `dirname`](#fonctionnement-de-la-commande-dirname)
4. [Syntaxe de la commande `dirname`](#syntaxe-de-la-commande-dirname)
5. [Exemples d'utilisation](#exemples-dutilisation)
    - [Exemple 1](#exemple-1)
    - [Exemple 2](#exemple-2)
6. [Options de la commande `dirname`](#options-de-la-commande-dirname)
    - [Option `--zero`](#option---zero)
    - [Option `--help`](#option---help)
    - [Option `--version`](#option---version)
7. [Connexes](#Connexes)

## Introduction

La commande `dirname` sous Linux est utilisée pour extraire le nom du répertoire d'un chemin de fichier donné. Elle supprime la dernière composante du chemin et renvoie le chemin du répertoire contenant ce fichier.

## Installation

La commande `dirname` fait partie du paquet `coreutils` qui est généralement préinstallé sur la plupart des distributions Linux. Si pour une raison quelconque `dirname` n'est pas disponible, vous pouvez installer `coreutils` en utilisant le gestionnaire de paquets approprié pour votre distribution.

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install coreutils
```

### Sur Fedora

```bash
sudo dnf install coreutils
```

### Sur Arch Linux

```bash
sudo pacman -S coreutils
```

## Fonctionnement de la commande `dirname`

La commande `dirname` lit un chemin de fichier en entrée et renvoie le chemin du répertoire contenant ce fichier. Elle supprime la dernière composante (souvent un fichier) du chemin, laissant le chemin du répertoire parent.

## Syntaxe de la commande `dirname`

```bash
dirname [OPTION] CHEMIN
```

### Arguments

- `CHEMIN`: Un chemin de fichier dont vous souhaitez obtenir le répertoire parent.

## Exemples d'utilisation

### Exemple 1

Supposons que nous ayons le chemin suivant : `/home/user/documents/report.txt`.

Utilisation de la commande `dirname` :

```bash
dirname /home/user/documents/report.txt
```

**Sortie :**

```
/home/user/documents
```

**Explication :**

La commande `dirname` supprime la dernière composante (`report.txt`) et affiche le chemin du répertoire parent.

### Exemple 2

Supposons que nous ayons le chemin suivant : `/var/log/syslog`.

Utilisation de la commande `dirname` :

```bash
dirname /var/log/syslog
```

**Sortie :**

```
/var/log
```

**Explication :**

La commande `dirname` supprime la dernière composante (`syslog`) et affiche le chemin du répertoire parent.

## Options de la commande `dirname`

### Option `--zero`

Ajoute un caractère nul (`\0`) à la fin de chaque ligne de sortie.

```bash
dirname --zero /home/user/documents/report.txt
```

**Sortie :**

```
/home/user/documents\0
```

**Explication :** Cette option est utile pour traiter les noms de fichiers qui peuvent contenir des caractères spéciaux comme des espaces ou des nouvelles lignes, car le caractère nul est utilisé comme séparateur.

### Option `--help`

Affiche l'aide pour la commande `dirname`.

```bash
dirname --help
```

**Explication :** Cette option affiche les informations d'aide sur l'utilisation de la commande.

### Option `--version`

Affiche la version de la commande `dirname`.

```bash
dirname --version
```

**Explication :** Cette option affiche la version installée de la commande `dirname`.

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour utiliser efficacement la commande `dirname` sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man dirname`.

## Connexes
- [[Chemin-absolue-cannonique]]

---

<!-- File: dmesh.md -->

# Tutoriel et Documentation Complète sur `dmesg`

## Introduction

`dmesg` (display message) est une commande utilisée dans les systèmes d'exploitation basés sur Unix et Linux pour afficher le tampon de messages du noyau. Cette commande est cruciale pour le diagnostic et le dépannage du système, offrant des insights sur le matériel du système, les pilotes chargés, et d'autres messages de bas niveau générés au démarrage et pendant l'exécution du système.

## Options de dmesg

`dmesg` offre plusieurs options permettant de filtrer, de formater et de manipuler l'affichage des messages du tampon du noyau.

- `-c` : Efface le tampon de messages du noyau après l'affichage.
- `-D` : Désactive l'enregistrement du tampon de messages du noyau (lecture seule).
- `-E` : Réactive l'enregistrement du tampon de messages du noyau.
- `-F fichier` : Lit les messages du noyau à partir d'un fichier spécifié plutôt que du tampon du noyau.
- `-f facility` : Affiche uniquement les messages correspondant à la facility spécifiée.
- `-k` : Affiche uniquement les messages du noyau (kernel).
- `-L` : Affiche les messages avec préfixes de niveau de priorité.
- `-n niveau` : Définit le niveau de console du noyau à la valeur spécifiée.
- `-P` : Ne décode pas les curseurs d'échappement, les couleurs, et d'autres séquences de contrôle.
- `-r` : Affiche les messages avec des horodatages bruts (en secondes depuis le démarrage).
- `-S` : Découpe les longs messages en plusieurs lignes.
- `-T` : Affiche les messages avec des horodatages humainement lisibles (basés sur l'horloge du système).
- `-u` : Affiche uniquement les messages des utilisateurs (user).
- `-w` : Attend et affiche les nouveaux messages au fur et à mesure de leur réception.
- `-x` : Affiche les messages avec des préfixes explicites pour faciliter l'analyse.

## Exemples d'Utilisation de dmesg

### Afficher les Messages du Tampon du Noyau

```bash
dmesg
```

### Afficher les Messages avec Horodatages Humainement Lisibles

```bash
dmesg -T
```

### Suivre les Nouveaux Messages du Noyau

```bash
dmesg -w
```

### Afficher les Messages d'Erreur et Critiques

Pour filtrer et afficher uniquement les messages d'erreur (niveau 3) et critiques (niveau 2) :

```bash
dmesg --level=err,crit
```

### Effacer le Tampon de Messages du Noyau

```bash
sudo dmesg -c
```

Notez que cette opération nécessite des privilèges d'administration.

### Lire les Messages du Noyau à Partir d'un Fichier

Si vous avez redirigé les messages du noyau vers un fichier, vous pouvez les lire avec :

```bash
dmesg -F /chemin/vers/fichier.log
```

## Bonnes Pratiques

- **Diagnostic et Dépannage** : Utilisez `dmesg` pour diagnostiquer les problèmes de matériel et les erreurs de pilotes au démarrage ou lors de l'ajout de nouveau matériel.
- **Surveillance en Temps Réel** : `dmesg -w` peut être utilisé pour surveiller en temps réel les avertissements, erreurs, et autres messages critiques du système.
- **Documentation** : Lors du rapport de problèmes système à l'assistance technique ou sur les forums, incluez les sorties pertinentes de `dmesg` pour aider au diagnostic.
- **Sécurité** : Soyez conscient que `dmesg` peut afficher des informations sensibles. Faites attention lorsque vous partagez des logs publiquement.

## Conclusion

`dmesg` est un outil indispensable pour tout administrateur système ou utilisateur avancé de Linux, permettant un accès rapide et détaillé aux messages du noyau pour le diagnostic et le dépannage. Grâce à sa gamme d'options de filtrage et de formatage, vous pouvez rapidement isoler et analyser les problèmes spécifiques, facilitant ainsi la maintenance et la surveillance

---

<!-- File: du.md -->

- [Documentation de la fonction `du`](#documentation-de-la-fonction-du)
  - [Syntaxe](#syntaxe)
  - [Options principales](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Utilisation basique pour répertoire courant](#1-utilisation-basique-pour-répertoire-courant)
  - [2. Afficher l'utilisation de l'espace en format lisible](#2-afficher-lutilisation-de-lespace-en-format-lisible)
  - [3. Sommaire de l'espace utilisé pour un répertoire spécifique](#3-sommaire-de-lespace-utilisé-pour-un-répertoire-spécifique)
  - [4. Afficher l'espace utilisé avec un total cumulatif](#4-afficher-lespace-utilisé-avec-un-total-cumulatif)
  - [5. Limite la profondeur de l'analyse à 2 niveaux](#5-limite-la-profondeur-de-lanalyse-à-2-niveaux)
  - [6. Afficher l'espace utilisé par chaque fichier](#6-afficher-lespace-utilisé-par-chaque-fichier)
  - [7. Exclure les fichiers correspondant à un motif](#7-exclure-les-fichiers-correspondant-à-un-motif)
  - [8. Suivre les liens symboliques](#8-suivre-les-liens-symboliques)
  - [9. Ignorer les sous-répertoires](#9-ignorer-les-sous-répertoires)
  - [10. Analyser un seul système de fichiers](#10-analyser-un-seul-système-de-fichiers)
- [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
  - [1. Surveiller l'utilisation de l'espace par les logs](#1-surveiller-lutilisation-de-lespace-par-les-logs)
  - [2. Trouver les 5 dossiers les plus volumineux](#2-trouver-les-5-dossiers-les-plus-volumineux)
  - [3. Surveiller l'espace disque après nettoyage](#3-surveiller-lespace-disque-après-nettoyage)
  - [4. Estimation de l'espace avant la sauvegarde](#4-estimation-de-lespace-avant-la-sauvegarde)
  - [5. Comparer l'utilisation de l'espace avant et après une opération](#5-comparer-lutilisation-de-lespace-avant-et-après-une-opération)
  - [6. Exclure des fichiers spécifiques de l'analyse](#6-exclure-des-fichiers-spécifiques-de-lanalyse)
  - [7. Vérifier l'utilisation de l'espace par les utilisateurs](#7-vérifier-lutilisation-de-lespace-par-les-utilisateurs)
  - [8. Identifier rapidement l'espace utilisé par les applications](#8-identifier-rapidement-lespace-utilisé-par-les-applications)
  - [9. Nettoyer les fichiers temporaires inutilisés](#9-nettoyer-les-fichiers-temporaires-inutilisés)
  - [10. Analyser l'utilisation de l'espace par des projets spécifiques](#10-analyser-lutilisation-de-lespace-par-des-projets-spécifiques)
- [Cas d'utilisation avec des pipes](#cas-dutilisation-avec-des-pipes)
  - [1. Lister et trier les dossiers par taille](#1-lister-et-trier-les-dossiers-par-taille)
  - [2. Trouver les fichiers les plus volumineux dans un répertoire](#2-trouver-les-fichiers-les-plus-volumineux-dans-un-répertoire)
  - [3. Somme de l'utilisation du disque pour un type de fichier](#3-somme-de-lutilisation-du-disque-pour-un-type-de-fichier)
  - [4. Comparaison de l'espace utilisé par les dossiers](#4-comparaison-de-lespace-utilisé-par-les-dossiers)
  - [5. Surveillance de l'espace libéré par suppression de fichiers](#5-surveillance-de-lespace-libéré-par-suppression-de-fichiers)
  - [6. Affichage de l'utilisation du disque par des fichiers modifiés récemment](#6-affichage-de-lutilisation-du-disque-par-des-fichiers-modifiés-récemment)
  - [7. Lister les fichiers d'une taille spécifique](#7-lister-les-fichiers-dune-taille-spécifique)
  - [8. Estimer l'espace occupé par les fichiers non accédés récemment](#8-estimer-lespace-occupé-par-les-fichiers-non-accédés-récemment)
  - [9. Vérifier l'utilisation de l'espace après une copie de fichiers](#9-vérifier-lutilisation-de-lespace-après-une-copie-de-fichiers)
  - [10. Surveillance de l'espace disque pendant une archive](#10-surveillance-de-lespace-disque-pendant-une-archive)


La commande `du` (disk usage) est essentielle dans les environnements Unix et Linux, y compris Debian, pour surveiller et gérer l'espace disque. Elle analyse et affiche l'utilisation de l'espace disque des fichiers et répertoires, permettant aux utilisateurs et administrateurs de comprendre comment l'espace est distribué sur leurs systèmes.

# Documentation de la fonction `du`

## Syntaxe
```
du [OPTION]... [FILE]...
du [OPTION]... --files0-from=F
```

## Options principales

- `-a, --all`: Affiche l'espace utilisé par chaque fichier, pas seulement les répertoires.
- `-c, --total`: Affiche un total cumulatif pour tous les arguments en fin de sortie.
- `-h, --human-readable`: Affiche les tailles en format lisible par l'homme (ex. 1K, 234M, 2G).
- `--max-depth=N`: Affiche l'utilisation de l'espace jusqu'à N niveaux de profondeur de répertoire.
- `-s, --summarize`: Affiche seulement un total pour chaque argument (répertoire).
- `-x, --one-file-system`: Ignore les répertoires sur des systèmes de fichiers différents.
- `--exclude=PATTERN`: Exclut les fichiers qui correspondent au motif.
- `-L, --dereference`: Suit les liens symboliques.
- `-S, --separate-dirs`: N'inclut pas l'espace utilisé par les sous-répertoires.

# Exemples d'utilisation

## 1. Utilisation basique pour répertoire courant
   ```bash
   du
   ```
   
## 2. Afficher l'utilisation de l'espace en format lisible
   ```bash
   du -h
   ```

## 3. Sommaire de l'espace utilisé pour un répertoire spécifique
   ```bash
   du -sh /var/log
   ```

## 4. Afficher l'espace utilisé avec un total cumulatif
   ```bash
   du -ch /var/log
   ```

## 5. Limite la profondeur de l'analyse à 2 niveaux
   ```bash
   du -h --max-depth=2 /home/user
   ```

## 6. Afficher l'espace utilisé par chaque fichier
   ```bash
   du -ah /home/user
   ```

## 7. Exclure les fichiers correspondant à un motif
   ```bash
   du -h --exclude='*.tmp' /tmp
   ```

## 8. Suivre les liens symboliques
   ```bash
   du -Lh /path/to/directory
   ```

## 9. Ignorer les sous-répertoires
   ```bash
   du -S /home/user
   ```

## 10. Analyser un seul système de fichiers
    ```bash
    du -xh /
    ```

# Cas d'utilisation de la fonction

## 1. Surveiller l'utilisation de l'espace par les logs
   ```bash
   du -sh /var/log
   ```

## 2. Trouver les 5 dossiers les plus volumineux
   ```bash
   du -h / | sort -rh | head -5
   ```

## 3. Surveiller l'espace disque après nettoyage
   ```bash
   du -sh /var && sudo apt clean && du -sh /var
   ```

## 4. Estimation de l'espace avant la sauvegarde
   ```bash
   du -sh /home/user/Documents
   ```

## 5. Comparer l'utilisation de l'espace avant et après une opération
   ```bash
   du -sh /path && operation && du -sh /path
   ```

## 6. Exclure des fichiers spécifiques de l'analyse
   ```bash
   du -h --exclude='*.mp4' /home/user/Videos
   ```

## 7. Vérifier l'utilisation de l'espace par les utilisateurs
   ```bash
   du -sh /home/*
   ```

## 8. Identifier rapidement l'espace utilisé par les applications
   ```bash
   du -sh /opt/*
   ```

## 9. Nettoyer les fichiers temporaires inutilisés
   ```bash
   du -h /tmp | sort -rh | head -10
   ```

## 10. Analyser l'utilisation de l'espace par des projets spécifiques
    ```bash
    du -sh /var/www/html/*
    ```

# Cas d'utilisation avec des pipes

## 1. Lister et trier les dossiers par taille
   ```bash
   du -h --max-depth=1 /path/to/directory | sort -hr
   ```

## 2. Trouver les fichiers les plus volumineux dans un répertoire
   ```bash
   find /path/to/directory -type f -exec du -h {} + | sort -rh | head -10
   ```

## 3. Somme de l'utilisation du disque pour un type de fichier
   ```bash
   find /path/to/directory -type f -name '*.jpg' | xargs du -ch | tail -n 1
   ```

## 4. Comparaison de l'espace utilisé par les dossiers
   ```bash
   du -sh /path/to/directory/* | sort -rh
   ```

## 5. Surveillance de l'espace libéré par suppression de fichiers
   ```bash
   du -sh /path && rm -r /path/to/old/logs/* && du -sh /path
   ```

## 6. Affichage de l'utilisation du disque par des fichiers modifiés récemment
   ```bash
   find /path/to/directory -mtime -7 -exec du -h {} + | sort -rh
   ```

## 7. Lister les fichiers d'une taille spécifique
   ```bash
   find / -size +100M -exec du -h {} + | sort -rh
   ```

## 8. Estimer l'espace occupé par les fichiers non accédés récemment
   ```bash
   find /path/to/directory -atime +365 -exec du -h {} + | sort -rh
   ```

## 9. Vérifier l'utilisation de l'espace après une copie de fichiers
   ```bash
   du -sh /destination && cp /source/* /destination && du -sh /destination
   ```

## 10. Surveillance de l'espace disque pendant une archive
    ```bash
    du -sh /path/to/directory && tar -czf archive.tar.gz /path/to/directory && du -sh archive
.tar.gz
    ```

Ces exemples illustrent comment utiliser efficacement `du` dans des scénarios réels pour gérer l'espace disque, que ce soit pour la maintenance régulière, la surveillance de l'espace disque, ou pour des tâches spécifiques comme la préparation à des sauvegardes ou le nettoyage de fichiers.

---

<!-- File: realpath.md -->

---
title: realpath
tags:
  - ressource
  - linux
  - bash
  - programmation
  - scripts
  - programmes
status:
  - En cours
type de note:
  - ressource
date: 2024-07-12
---


# Documentation pour la commande `realpath` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la commande `realpath`](#fonctionnement-de-la-commande-realpath)
4. [Syntaxe de la commande `realpath`](#syntaxe-de-la-commande-realpath)
5. [Exemples d'utilisation](#exemples-dutilisation)
    - [Exemple 1](#exemple-1)
    - [Exemple 2](#exemple-2)
6. [Options de la commande `realpath`](#options-de-la-commande-realpath)
    - [Option `--canonicalize`](#option---canonicalize)
    - [Option `--relative-to`](#option---relative-to)
    - [Option `--relative-base`](#option---relative-base)
    - [Option `--help`](#option---help)
    - [Option `--version`](#option---version)
7. [Connexes](#Connexes)

## Introduction

La commande `realpath` sous Linux est utilisée pour afficher le chemin absolu canonique d'un fichier ou d'un répertoire. Cela signifie qu'elle résout tous les liens symboliques, les points (`.`) et les doubles points (`..`) dans le chemin, fournissant ainsi le chemin réel et absolu du fichier ou du répertoire.

## Installation

Pour installer la commande `realpath` sur votre système Linux, vous pouvez utiliser le gestionnaire de paquets approprié pour votre distribution. Voici les commandes pour quelques distributions courantes :

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install coreutils
```

### Sur Fedora

```bash
sudo dnf install coreutils
```

### Sur Arch Linux

```bash
sudo pacman -S coreutils
```

## Fonctionnement de la commande `realpath`

La commande `realpath` lit le chemin fourni en entrée et le convertit en un chemin absolu canonique. Elle résout tous les liens symboliques et les répertoires relatifs pour fournir un chemin complet et absolu.

## Syntaxe de la commande `realpath`

```bash
realpath [OPTION]... FICHIER...
```

### Arguments

- `FICHIER`: Un ou plusieurs fichiers ou répertoires dont vous souhaitez obtenir le chemin absolu.

## Exemples d'utilisation

### Exemple 1

Supposons que nous ayons la structure de répertoire suivante :

```
/home/user
├── documents
│   └── projet -> /mnt/data/projet
```

Utilisation de la commande `realpath` pour obtenir le chemin absolu du lien symbolique `projet` :

```bash
realpath /home/user/documents/projet
```

**Sortie :**

```
/mnt/data/projet
```

**Explication :**

La commande résout le lien symbolique `projet` et affiche le chemin absolu.

### Exemple 2

Supposons que nous ayons le chemin relatif suivant : `../user/documents`.

Utilisation de la commande `realpath` pour obtenir le chemin absolu :

```bash
realpath ../user/documents
```

**Sortie :**

```
/home/user/documents
```

**Explication :**

La commande convertit le chemin relatif en un chemin absolu.

## Options de la commande `realpath`

### Option `--canonicalize`

Convertit tous les composants de chemin en un chemin absolu canonique. C'est l'option par défaut.

```bash
realpath --canonicalize ../user/documents
```

**Explication :** Cette option est implicite dans la commande `realpath` et est utilisée pour garantir que le chemin de sortie est absolu et sans liens symboliques.

### Option `--relative-to`

Affiche le chemin relatif par rapport au répertoire spécifié.

```bash
realpath --relative-to=/home /home/user/documents
```

**Sortie :**

```
user/documents
```

**Explication :** Cette option affiche le chemin relatif à partir du répertoire spécifié.

### Option `--relative-base`

Combine les chemins relatifs pour obtenir un chemin absolu.

```bash
realpath --relative-base=/home /home/user/documents/../images
```

**Sortie :**

```
/home/user/images
```

**Explication :** Cette option simplifie le chemin en combinant les segments relatifs.

### Option `--help`

Affiche l'aide pour la commande `realpath`.

```bash
realpath --help
```

**Explication :** Cette option affiche les informations d'aide sur l'utilisation de la commande.

### Option `--version`

Affiche la version de la commande `realpath`.

```bash
realpath --version
```

**Explication :** Cette option affiche la version installée de la commande `realpath`.

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour utiliser efficacement la commande `realpath` sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man realpath`.
## Connexes
- [[Chemin-absolue-cannonique]]

---

<!-- File: rm.md -->

La commande `rm` (remove) est utilisée dans les systèmes d'exploitation Unix et Linux pour supprimer des fichiers et des répertoires. Elle est fondamentale pour la gestion des fichiers, permettant aux utilisateurs de nettoyer et de maintenir l'organisation de leurs systèmes de fichiers.

- [Documentation de la fonction `rm`](#documentation-de-la-fonction-rm)
  - [Syntaxe](#syntaxe)
  - [Options principales](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Supprimer un fichier simple](#1-supprimer-un-fichier-simple)
  - [2. Demander confirmation avant de supprimer chaque fichier](#2-demander-confirmation-avant-de-supprimer-chaque-fichier)
  - [3. Supprimer plusieurs fichiers en une seule commande](#3-supprimer-plusieurs-fichiers-en-une-seule-commande)
  - [4. Supprimer un répertoire et son contenu de manière récursive](#4-supprimer-un-répertoire-et-son-contenu-de-manière-récursive)
  - [5. Forcer la suppression d'un fichier sans demander de confirmation](#5-forcer-la-suppression-dun-fichier-sans-demander-de-confirmation)
  - [6. Supprimer de manière récursive en affichant les noms des fichiers supprimés](#6-supprimer-de-manière-récursive-en-affichant-les-noms-des-fichiers-supprimés)
  - [7. Supprimer un ensemble de fichiers avec un motif spécifique (avec globbing)](#7-supprimer-un-ensemble-de-fichiers-avec-un-motif-spécifique-avec-globbing)
  - [8. Supprimer de manière sécurisée un dossier avec contenu sans demander confirmation](#8-supprimer-de-manière-sécurisée-un-dossier-avec-contenu-sans-demander-confirmation)
  - [9. Supprimer des fichiers de manière interactive, avec confirmation pour chaque fichier](#9-supprimer-des-fichiers-de-manière-interactive-avec-confirmation-pour-chaque-fichier)
  - [10  Supprimer un fichier verrouillé ou protégé (avec sudo, si nécessaire)](#10--supprimer-un-fichier-verrouillé-ou-protégé-avec-sudo-si-nécessaire)
- [Cas d'utilisation sans pipes](#cas-dutilisation-sans-pipes)
  - [1. Nettoyage de fichiers temporaires](#1-nettoyage-de-fichiers-temporaires)
  - [2. Suppression de fichiers de logs anciens](#2-suppression-de-fichiers-de-logs-anciens)
  - [3. Effacement de fichiers de cache](#3-effacement-de-fichiers-de-cache)
  - [4. Supprimer des fichiers de configuration obsolètes](#4-supprimer-des-fichiers-de-configuration-obsolètes)
  - [5. Vider un dossier de téléchargements](#5-vider-un-dossier-de-téléchargements)
  - [6. Effacer une ancienne sauvegarde](#6-effacer-une-ancienne-sauvegarde)
  - [7. Supprimer des images inutilisées](#7-supprimer-des-images-inutilisées)
  - [8. Nettoyer un projet de fichiers de construction](#8-nettoyer-un-projet-de-fichiers-de-construction)
  - [9. Enlever un ensemble de dossiers vides](#9-enlever-un-ensemble-de-dossiers-vides)
  - [10.\*Supprimer des fichiers de script non exécutables](#10supprimer-des-fichiers-de-script-non-exécutables)
- [Cas d'utilisation avec des pipes](#cas-dutilisation-avec-des-pipes)
  - [1. Supprimer tous les fichiers `.log` modifiés il y a plus de 7 jours](#1-supprimer-tous-les-fichiers-log-modifiés-il-y-a-plus-de-7-jours)
  - [2. Trouver et supprimer tous les fichiers vides dans un répertoire](#2-trouver-et-supprimer-tous-les-fichiers-vides-dans-un-répertoire)
  - [3. Supprimer des fichiers spécifiques d'une liste contenue dans un fichier](#3-supprimer-des-fichiers-spécifiques-dune-liste-contenue-dans-un-fichier)
  - [4. Effacer des fichiers `.tmp` dans un répertoire sans entrer dans les sous-répertoires](#4-effacer-des-fichiers-tmp-dans-un-répertoire-sans-entrer-dans-les-sous-répertoires)
  - [5. Supprimer tous les fichiers exceptés certains motifs](#5-supprimer-tous-les-fichiers-exceptés-certains-motifs)
  - [6. Effacer des fichiers dont le nom contient des espaces](#6-effacer-des-fichiers-dont-le-nom-contient-des-espaces)
  - [7. Lister d'abord tous les fichiers à supprimer pour confirmation](#7-lister-dabord-tous-les-fichiers-à-supprimer-pour-confirmation)
  - [8. Supprimer des fichiers avec une extension spécifique dans un arbre de répertoires](#8-supprimer-des-fichiers-avec-une-extension-spécifique-dans-un-arbre-de-répertoires)
  - [9. Nettoyer un répertoire de fichiers de sauvegarde obsolètes](#9-nettoyer-un-répertoire-de-fichiers-de-sauvegarde-obsolètes)
  - [10.\*Effacer des fichiers JPEG et PNG dans un dossier](#10effacer-des-fichiers-jpeg-et-png-dans-un-dossier)


# Documentation de la fonction `rm`

## Syntaxe
```
rm [OPTION]... FILE...
```

## Options principales

- `-f, --force`: Ignore les fichiers inexistants et les arguments sans permission, ne demande pas de confirmation.
- `-i`: Demande confirmation avant de supprimer chaque fichier.
- `-r, -R, --recursive`: Supprime les répertoires et leur contenu de manière récursive.
- `--no-preserve-root`: Ne pas traiter '/' de manière spéciale (par défaut, `rm` ne permet pas la suppression récursive de '/').
- `--preserve-root`: Ne pas supprimer récursivement '/' (comportement par défaut).
- `-v, --verbose`: Affiche un message pour chaque fichier supprimé.

# Exemples d'utilisation

## 1. Supprimer un fichier simple
   ```bash
   rm fichier.txt
   ```

## 2. Demander confirmation avant de supprimer chaque fichier
   ```bash
   rm -i fichier.txt
   ```

## 3. Supprimer plusieurs fichiers en une seule commande
   ```bash
   rm fichier1.txt fichier2.txt fichier3.txt
   ```

## 4. Supprimer un répertoire et son contenu de manière récursive
   ```bash
   rm -r dossier/
   ```

## 5. Forcer la suppression d'un fichier sans demander de confirmation
   ```bash
   rm -f fichier.txt
   ```

## 6. Supprimer de manière récursive en affichant les noms des fichiers supprimés
   ```bash
   rm -rv dossier/
   ```

## 7. Supprimer un ensemble de fichiers avec un motif spécifique (avec globbing)
   ```bash
   rm *.txt
   ```

## 8. Supprimer de manière sécurisée un dossier avec contenu sans demander confirmation
   ```bash
   rm -rf dossier/
   ```

## 9. Supprimer des fichiers de manière interactive, avec confirmation pour chaque fichier
   ```bash
   rm -ri dossier/
   ```

## 10  Supprimer un fichier verrouillé ou protégé (avec sudo, si nécessaire)
    ```bash
    sudo rm -f fichier_protégé.txt
    ```

# Cas d'utilisation sans pipes

## 1. Nettoyage de fichiers temporaires
   ```bash
   rm /temp/*.tmp
   ```

## 2. Suppression de fichiers de logs anciens
   ```bash
   rm /var/log/old-logs-*.log
   ```

## 3. Effacement de fichiers de cache
   ```bash
   rm -rf /home/user/.cache/*
   ```

## 4. Supprimer des fichiers de configuration obsolètes
   ```bash
   rm ~/.old-config
   ```

## 5. Vider un dossier de téléchargements
   ```bash
   rm -r ~/Downloads/*
   ```

## 6. Effacer une ancienne sauvegarde
   ```bash
   rm -rf ~/backup/old-backup
   ```

## 7. Supprimer des images inutilisées
   ```bash
   rm ~/Pictures/unused-*.jpg
   ```

## 8. Nettoyer un projet de fichiers de construction
   ```bash
   rm -rf project/build/*
   ```

## 9. Enlever un ensemble de dossiers vides
   ```bash
   rm -r emptyFolder1 emptyFolder2 emptyFolder3
   ```

## 10.*Supprimer des fichiers de script non exécutables
    ```bash
    rm ~/scripts/*.sh
    ```

# Cas d'utilisation avec des pipes

Les cas d'utilisation de `rm` avec des pipes sont moins courants en raison de sa nature destructrice et du risque potentiel de suppression non intentionnelle de fichiers. Cependant, dans des cas contrôlés et avec précaution, on peut combiner `rm` avec d'autres commandes pour filtrer et traiter des ensembles de fichiers avant leur suppression.

## 1. Supprimer tous les fichiers `.log` modifiés il y a plus de 7 jours
   ```bash
   find /var/log -name "*.log" -mtime +7 | xargs rm
   ```

## 2. Trouver et supprimer tous les fichiers vides dans un répertoire
   ```bash
   find /path/to/directory -type f -empty | xargs rm
   ```

## 3. Supprimer des fichiers spécifiques d'une liste contenue dans un fichier
   ```bash
   cat list.txt | xargs rm
   ```

## 4. Effacer des fichiers `.tmp` dans un répertoire sans entrer dans les sous-répertoires
   ```bash
   find /path/to/directory -maxdepth 1 -name "*.tmp" | xargs rm
   ```

## 5. Supprimer tous les fichiers exceptés certains motifs
   ```bash
   ls | grep -v 'exclude_pattern' | xargs rm
   ```

## 6. Effacer des fichiers dont le nom contient des espaces
   ```bash
   find /path/to/directory -name "* *.txt" -print0 | xargs -0 rm
   ```

## 7. Lister d'abord tous les fichiers à supprimer pour confirmation
   ```bash
   find /path/to/cleanup -type f | tee /dev/tty | xargs -p rm
   ```

## 8. Supprimer des fichiers avec une extension spécifique dans un arbre de répertoires
   ```bash
   find /path/to/search -name "*.bak" -type f | xargs rm
   ```

## 9. Nettoyer un répertoire de fichiers de sauvegarde obsolètes
   ```bash
   find /backup -name "*.old" -print | xargs rm
   ```

## 10.*Effacer des fichiers JPEG et PNG dans un dossier
    ```bash
    find /path/to/images -type f \( -name "*.jpg" -o -name "*.png" \) | xargs rm
    ```

Ces exemples illustrent l'utilisation de `rm` pour supprimer des fichiers et des répertoires de manière efficace et contrôlée, tout en montrant comment des opérations complexes de suppression peuvent être réalisées en combinant `rm` avec d'autres commandes via des pipes. La prudence est fortement recommandée lors de l'utilisation de ces commandes, particulièrement

---

<!-- File: sort.md -->

- [Documentation de la commande `sort`](#documentation-de-la-commande-sort)
  - [Syntaxe](#syntaxe)
  - [Options Principales](#options-principales)
  - [Utilisation](#utilisation)
  - [Exemples d'Utilisation](#exemples-dutilisation)
    - [1. Trier un fichier textuel en ordre alphabétique](#1-trier-un-fichier-textuel-en-ordre-alphabétique)
    - [2. Trier un fichier en ignorant les casse](#2-trier-un-fichier-en-ignorant-les-casse)
    - [3. Trier un fichier en ordre numérique](#3-trier-un-fichier-en-ordre-numérique)
    - [4. Trier un fichier en ordre décroissant](#4-trier-un-fichier-en-ordre-décroissant)
    - [5. Trier un fichier en supprimant les doublons](#5-trier-un-fichier-en-supprimant-les-doublons)
    - [6. Trier par colonne spécifique](#6-trier-par-colonne-spécifique)
    - [7. Trier en tenant compte du mois](#7-trier-en-tenant-compte-du-mois)
    - [8. Trier et sauvegarder le résultat dans un fichier](#8-trier-et-sauvegarder-le-résultat-dans-un-fichier)
    - [9. Trier en tenant compte des versions](#9-trier-en-tenant-compte-des-versions)
    - [10. Combiner tri numérique et tri inverse](#10-combiner-tri-numérique-et-tri-inverse)
  - [Conclusion](#conclusion)


La commande `sort` est un utilitaire très puissant sous UNIX et Linux, utilisé pour trier les lignes de texte dans les fichiers. Voici une documentation détaillée sur son utilisation, ses paramètres et quelques exemples pour illustrer comment s'en servir efficacement.

# Documentation de la commande `sort`

## Syntaxe

```bash
sort [OPTION]... [FICHIER]...
```

## Options Principales

- `-b, --ignore-leading-blanks` : Ignore les espaces de début de ligne.
- `-d, --dictionary-order` : Trie en ne tenant compte que des blancs et des caractères alphanumériques.
- `-f, --ignore-case` : Ignore les différences de casse entre les majuscules et minuscules.
- `-g, --general-numeric-sort` : Compare selon la valeur numérique générale.
- `-i, --ignore-nonprinting` : Ignore les caractères non imprimables.
- `-M, --month-sort` : Trie par nom de mois.
- `-n, --numeric-sort` : Trie selon la valeur numérique des chaînes.
- `-o, --output=FICHIER` : Écrit le résultat dans FICHIER au lieu de la sortie standard.
- `-r, --reverse` : Trie en ordre décroissant.
- `-u, --unique` : Supprime les lignes en double.
- `-V, --version-sort` : Trie par version.
- `--help` : Affiche l'aide et quitte.
- `--version` : Affiche les informations de version et quitte.

## Utilisation

La commande `sort` lit le(s) fichier(s) spécifié(s) ou l'entrée standard si aucun fichier n'est donné, trie les lignes et écrit le résultat sur la sortie standard. Si plusieurs fichiers sont donnés, `sort` les combine comme s'ils étaient séquentiels avant de trier.

## Exemples d'Utilisation

### 1. Trier un fichier textuel en ordre alphabétique

```bash
sort fichier.txt
```

### 2. Trier un fichier en ignorant les casse

```bash
sort -f fichier.txt
```

### 3. Trier un fichier en ordre numérique

```bash
sort -n fichier.txt
```

### 4. Trier un fichier en ordre décroissant

```bash
sort -r fichier.txt
```

### 5. Trier un fichier en supprimant les doublons

```bash
sort -u fichier.txt
```

### 6. Trier par colonne spécifique

Supposons un fichier `donnees.txt` contenant :

```
b 2
a 10
c 1
```

Pour trier par la deuxième colonne numériquement :

```bash
sort -k2,2n donnees.txt
```

### 7. Trier en tenant compte du mois

Si un fichier contient les mois de l'année, vous pouvez les trier chronologiquement avec :

```bash
sort -M fichier.txt
```

### 8. Trier et sauvegarder le résultat dans un fichier

```bash
sort fichier.txt -o fichier_trie.txt
```

### 9. Trier en tenant compte des versions

Pour trier des chaînes qui représentent des versions logicielles :

```bash
sort -V fichier.txt
```

### 10. Combiner tri numérique et tri inverse

```bash
sort -nr fichier.txt
```

## Conclusion

La commande `sort` est extrêmement versatile et peut être adaptée à de nombreux besoins de tri différents grâce à ses nombreuses options. En utilisant les bonnes options, vous pouvez trier des données textuelles de manière très précise, que ce soit en ordre alphabétique, numérique, par mois, par version, ou même en éliminant les doublons. L'apprentissage de ses options et de la manière de les combiner peut grandement améliorer votre efficacité lors de la manipulation de fichiers textuels sous UNIX et Linux.

---

<!-- File: tar.md -->

Pour créer une documentation détaillée pour une fonction sous Linux (Debian 12), nous allons utiliser la commande `tar` comme exemple. `tar` est un utilitaire standard pour archiver et compresser des fichiers.

### `tar` sous Debian 12

#### Introduction

La commande `tar` est utilisée pour créer des archives (également appelées tarballs), extraire des fichiers d'archives, et manipuler des archives. Cette documentation fournit une vue d'ensemble sur l'installation, le fonctionnement, la syntaxe, les options et des exemples d'utilisation de `tar`.

### Installation

Sous Debian 12, `tar` est généralement pré-installé. Vous pouvez vérifier si `tar` est installé et obtenir sa version avec la commande :

```bash
tar --version
```

Si `tar` n'est pas installé, vous pouvez l'installer en utilisant `apt` :

```bash
sudo apt update
sudo apt install tar
```

### Fonctionnement de la Commande `tar`

La commande `tar` permet de créer des archives de fichiers, d'extraire des fichiers d'une archive, et d'afficher le contenu d'une archive. Elle prend en charge plusieurs formats de compression tels que gzip, bzip2 et xz.

### Syntaxe de la Commande `tar`

La syntaxe générale de `tar` est :

```bash
tar [OPTIONS] ARCHIVE_NAME FILES
```

- `OPTIONS` : Spécifie les actions à effectuer (création, extraction, etc.) et les options de compression.
- `ARCHIVE_NAME` : Le nom de l'archive à créer ou à manipuler.
- `FILES` : Les fichiers ou répertoires à inclure dans l'archive ou à extraire.

### Options de la Commande `tar`

#### Options de Base

- `-c` : Crée une nouvelle archive.
- `-x` : Extrait les fichiers d'une archive.
- `-t` : Liste le contenu d'une archive.
- `-v` : Affiche les actions en cours (mode verbeux).
- `-f` : Spécifie le nom de l'archive.
- `-z` : Compresse l'archive avec gzip.
- `-j` : Compresse l'archive avec bzip2.
- `-J` : Compresse l'archive avec xz.

#### Options Additionnelles

- `--exclude=PATTERN` : Exclut les fichiers correspondant au motif.
- `-C` : Change de répertoire avant d'effectuer l'action.

### Exemples Concrets

#### Exemple 1 : Créer une Archive

Pour créer une archive nommée `archive.tar` contenant les fichiers `file1` et `file2` :

```bash
tar -cvf archive.tar file1 file2
```

- `-c` : Crée une nouvelle archive.
- `-v` : Mode verbeux.
- `-f` : Spécifie le nom de l'archive.

#### Exemple 2 : Extraire une Archive

Pour extraire les fichiers de `archive.tar` :

```bash
tar -xvf archive.tar
```

- `-x` : Extrait les fichiers.
- `-v` : Mode verbeux.
- `-f` : Spécifie le nom de l'archive.

#### Exemple 3 : Créer une Archive Compressée

Pour créer une archive compressée avec gzip :

```bash
tar -cvzf archive.tar.gz file1 file2
```

- `-z` : Compresse l'archive avec gzip.

#### Exemple 4 : Exclure des Fichiers

Pour créer une archive en excluant les fichiers `.log` :

```bash
tar -cvf archive.tar --exclude='*.log' /path/to/directory
```

- `--exclude='*.log'` : Exclut les fichiers correspondant au motif.

#### Exemple 5 : Extraire dans un Répertoire Spécifique

Pour extraire les fichiers de `archive.tar` dans le répertoire `/tmp` :

```bash
tar -xvf archive.tar -C /tmp
```

- `-C /tmp` : Change de répertoire avant d'extraire les fichiers.

### Liste Complète des Options et Explications

1. `-c, --create` : Crée une nouvelle archive.
   - Exemple : `tar -cf archive.tar file1 file2`
2. `-x, --extract` : Extrait les fichiers d'une archive.
   - Exemple : `tar -xf archive.tar`
3. `-t, --list` : Liste le contenu d'une archive.
   - Exemple : `tar -tf archive.tar`
4. `-v, --verbose` : Affiche les actions en cours.
   - Exemple : `tar -cvf archive.tar file1 file2`
5. `-f, --file` : Spécifie le nom de l'archive.
   - Exemple : `tar -cf archive.tar file1 file2`
6. `-z, --gzip` : Compresse l'archive avec gzip.
   - Exemple : `tar -czf archive.tar.gz file1 file2`
7. `-j, --bzip2` : Compresse l'archive avec bzip2.
   - Exemple : `tar -cjf archive.tar.bz2 file1 file2`
8. `-J, --xz` : Compresse l'archive avec xz.
   - Exemple : `tar -cJf archive.tar.xz file1 file2`
9. `--exclude=PATTERN` : Exclut les fichiers correspondant au motif.
   - Exemple : `tar -cf archive.tar --exclude='*.log' /path/to/directory`
10. `-C, --directory=DIR` : Change de répertoire avant d'effectuer l'action.
    - Exemple : `tar -xf archive.tar -C /tmp`

### Conclusion

La commande `tar` est un outil puissant pour la gestion des archives sous Linux. En suivant cette documentation, vous devriez être capable de créer, extraire et manipuler des archives efficacement sur Debian 12. Pour plus de détails, consultez la page de manuel en utilisant `man tar`.

---

<!-- File: tr.md -->

# Tutoriel et Documentation Complète sur `tr`

## Introduction

`tr` est un utilitaire en ligne de commande Unix/Linux qui sert à traduire, presser, et/ou supprimer des caractères depuis l'entrée standard, écrivant le résultat vers la sortie standard. Il est souvent utilisé pour des opérations telles que la conversion de casse, la suppression de caractères indésirables, ou le remplacement de caractères.

## Syntaxe de Base

```bash
tr [OPTIONS] SET1 [SET2]
```

- `SET1` : Ensemble de caractères d'entrée à être remplacés ou supprimés.
- `SET2` : Ensemble de caractères de sortie qui remplaceront ceux de `SET1`.

## Options Principales

- `-c` ou `--complement` : Utilise le complément de `SET1`.
- `-d` ou `--delete` : Supprime les caractères présents dans `SET1`, aucun `SET2` requis.
- `-s` ou `--squeeze-repeats` : Remplace chaque séquence d'un caractère répété présent dans `SET1` par une seule occurrence de ce caractère.
- `-t` ou `--truncate-set1` : Tronque `SET1` pour correspondre à la longueur de `SET2`.

## Exemples d'Utilisation de `tr`

### Convertir de Minuscules en Majuscules

```bash
echo "exemple de texte" | tr 'a-z' 'A-Z'
```

### Supprimer les Caractères Numériques

```bash
echo "mot de passe123" | tr -d '0-9'
```

### Presser les Caractères Répétés

```bash
echo "Bonjourrrrr    monde" | tr -s 'r' ' '
```

Dans cet exemple, les `r` répétés sont pressés en une seule occurrence, et les espaces multiples sont aussi réduits à un seul espace.

### Supprimer les Retours à la Ligne

```bash
echo -e "ligne 1\nligne 2" | tr -d '\n'
```

### Remplacer les Espaces par des Tirets

```bash
echo "texte avec des espaces" | tr ' ' '-'
```

### Utiliser le Complément d'un Ensemble de Caractères

```bash
echo "abc123" | tr -cd 'a-zA-Z'
```

Supprime tous les caractères qui ne sont pas des lettres.

## Avancé

### Transformer les Sauts de Ligne en Espaces

```bash
tr '\n' ' ' < fichier.txt
```

Ceci est utile pour transformer un fichier multilignes en une seule ligne.

### Supprimer les Caractères Non-Imprimables

```bash
tr -cd '\11\12\15\40-\176' < fichier.txt
```

Cela garde les tabulations, les nouvelles lignes, les retours chariots, et les caractères imprimables ASCII, supprimant tout le reste.

### Créer un Histogramme des Caractères

```bash
echo "hello world" | fold -w1 | sort | uniq -c | sort -nr
```

Bien que cet exemple dépasse le cadre de `tr` seul, il montre comment combiner plusieurs commandes Unix pour créer un histogramme des caractères d'une chaîne. `fold` divise le texte en caractères, `sort` trie ces caractères, `uniq -c` compte les occurrences, et `sort -nr` trie les résultats par nombre d'occurrences.

## Conseils

- `tr` travaille sur des jeux de caractères et ne comprend pas les expressions régulières ou les mots.
- Lors du travail avec `tr`, pensez aux locales (langues et paramètres régionaux) qui peuvent affecter le comportement de certains ensembles de caractères.
- Utilisez des guillemets autour des ensembles de caractères pour éviter l'interprétation par le shell.

`tr` est un outil puissant et flexible pour le traitement de texte en ligne de commande, idéal pour des modifications simples mais répétitives de chaînes ou de flux de texte.

---

<!-- File: tree.md -->



- [Options de Base](#options-de-base)
- [Options d'Affichage et de Tri](#options-daffichage-et-de-tri)
- [Options de Filtrage](#options-de-filtrage)
- [Options de Format](#options-de-format)
- [Options Avancées](#options-avancées)
- [Exemples](#exemples)
  - [Pour afficher l'arborescence des dossiers et fichiers](#pour-afficher-larborescence-des-dossiers-et-fichiers)
  - [Pour afficher uniquement les dossiers](#pour-afficher-uniquement-les-dossiers)
  - [Pour limiter la profondeur de l'arborescence](#pour-limiter-la-profondeur-de-larborescence)
  - [Pour inclure la taille des fichiers](#pour-inclure-la-taille-des-fichiers)
  - [Pour ignorer un certain type de fichiers](#pour-ignorer-un-certain-type-de-fichiers)
  - [Pour sauvegarder la sortie de `tree` dans un fichier](#pour-sauvegarder-la-sortie-de-tree-dans-un-fichier)
  - [Afficher les Fichiers et Dossiers avec Permissions et Propriétaires](#afficher-les-fichiers-et-dossiers-avec-permissions-et-propriétaires)
  - [Filtrer l'Affichage par Type de Fichier](#filtrer-laffichage-par-type-de-fichier)
  - [Exclure des Fichiers ou Dossiers Spécifiques](#exclure-des-fichiers-ou-dossiers-spécifiques)
  - [Afficher un Résumé à la Fin](#afficher-un-résumé-à-la-fin)
  - [Colorer la Sortie](#colorer-la-sortie)
  - [Enregistrer la Sortie dans un Fichier tout en Affichant les Erreurs](#enregistrer-la-sortie-dans-un-fichier-tout-en-affichant-les-erreurs)
  - [Utiliser `tree` pour Générer un Arbre en HTML](#utiliser-tree-pour-générer-un-arbre-en-html)


```bash
sudo apt-get install tree
```

La commande `tree` est un outil puissant sous Linux et UNIX pour afficher le contenu des répertoires sous forme d'arborescence graphique. Voici les paramètres (options) les plus courants et leur signification :

## Options de Base

- **`-a`** : Affiche tous les fichiers, y compris les fichiers cachés (ceux commençant par un point).
- **`-d`** : Liste uniquement les répertoires.
- **`-l`** : Suit les liens symboliques comme s'ils étaient des répertoires.
- **`-f`** : Affiche le chemin complet de chaque fichier.
- **`-i`** : N'affiche pas l'indentation des lignes et les caractères de branchement, créant une sortie plus sobre.
- **`-q`** : Remplace les caractères non imprimables par des points d'interrogation.
- **`-N`** : N'échappe pas les caractères spéciaux (l'effet inverse de `-q`).

## Options d'Affichage et de Tri

- **`-r`** : Inverse l'ordre du tri, affichant les résultats en ordre décroissant.
- **`-t`** : Trie les fichiers par date de dernière modification, les plus récents d'abord.
- **`-X`** : Trie les fichiers par extension.
- **`-v`** : Trie les fichiers alphanumériquement, ce qui est utile pour trier les noms de fichiers avec des numéros.

## Options de Filtrage

- **`-P pattern`** : N'affiche que les fichiers correspondant au motif (pattern) spécifié.
- **`-I pattern`** : Exclut les fichiers correspondant au motif spécifié de l'affichage.
- **`--matchdirs`** : Inclut les noms de dossiers dans les recherches de motifs avec `-P` ou `-I`.

## Options de Format

- **`-C`** : Colore la sortie. Les couleurs indiquent différents types de fichiers (par exemple, dossier, lien symbolique).
- **`-h`** : Affiche la taille des fichiers en format lisible par l'homme (par exemple, en KB, MB).
- **`--charset charset`** : Utilise un jeu de caractères spécifique pour l'affichage.

## Options Avancées

- **`-s`** : Affiche la taille cumulée de chaque répertoire.
- **`--du`** : Affiche la taille du répertoire uniquement pour les répertoires listés, similaire à `du` sous Unix.
- **`-H`** : Génère une sortie en HTML.
- **`-o filename`** : Redirige la sortie de `tree` vers un fichier spécifié.
- **`-n`** : N'affiche pas les lignes d'indentation, rendant la sortie plus propre pour être lue par des machines ou pour le traitement de texte.
- **`-L level`** : Limite la récursion à un nombre spécifié de niveaux de sous-répertoires.

Pour afficher les fichiers et dossiers en utilisant un affichage de type "arbre" (`tree`), vous pouvez utiliser la commande `tree` si elle est disponible sur votre système Linux. La commande `tree` affiche de manière récursive le contenu d'un répertoire sous forme d'arborescence graphique.

Si `tree` n'est pas installé sur votre système, vous pouvez généralement l'installer via le gestionnaire de paquets de votre distribution Linux. Par exemple, sur les systèmes basés sur Debian (comme Ubuntu), vous pouvez l'installer avec :

## Exemples

### Pour afficher l'arborescence des dossiers et fichiers
- :

  ```bash
  tree /chemin/du/dossier
  ```

  Remplacez `/chemin/du/dossier` par le chemin du dossier que vous souhaitez explorer.

### Pour afficher uniquement les dossiers
- :

  ```bash
  tree -d /chemin/du/dossier
  ```

  L'option `-d` indique à `tree` de lister uniquement les répertoires.

### Pour limiter la profondeur de l'arborescence
- :

  ```bash
  tree -L N /chemin/du/dossier
  ```

  Remplacez `N` par le niveau de profondeur souhaité. Par exemple, `tree -L 2` affichera l'arborescence jusqu'à deux niveaux de profondeur.

### Pour inclure la taille des fichiers
- :

  ```bash
  tree -h /chemin/du/dossier
  ```

    L'option `-h` rend la taille des fichiers lisible par un humain (affichée en K, M, G, etc.).

### Pour ignorer un certain type de fichiers
- :

  ```bash
  tree -I 'pattern' /chemin/du/dossier
  ```

  Remplacez `'pattern'` par le motif des fichiers à ignorer. Par exemple, `tree -I '*.txt'` ignorera tous les fichiers `.txt`.

### Pour sauvegarder la sortie de `tree` dans un fichier
- :

  ```bash
  tree /chemin/du/dossier > sortie_tree.txt
  ```

### Afficher les Fichiers et Dossiers avec Permissions et Propriétaires

- **Afficher les permissions, les groupes et les propriétaires :**

  ```bash
  tree -pug /chemin/du/dossier
  ```
  
  - `-p` affiche les permissions (par exemple, `drwxr-xr-x`).
  - `-u` affiche le propriétaire du fichier.
  - `-g` affiche le groupe du fichier.

### Filtrer l'Affichage par Type de Fichier

- **Afficher uniquement un certain type de fichier :**

  ```bash
  tree -P '*.txt' /chemin/du/dossier
  ```
  
  Cet exemple liste tous les fichiers `.txt`. L'option `-P` permet de spécifier un motif pour les noms de fichier à inclure.

### Exclure des Fichiers ou Dossiers Spécifiques

- **Exclure des fichiers ou dossiers par nom :**

  ```bash
  tree -I 'node_modules|target|.git' /chemin/du/dossier
  ```
  
  Cela exclut les dossiers `node_modules`, `target`, et `.git` de l'affichage. Très utile pour ignorer les répertoires volumineux ou non pertinents.

### Afficher un Résumé à la Fin

- **Inclure un résumé à la fin de l'arborescence :**

  ```bash
  tree -a /chemin/du/dossier --du -h
  ```
  
  - `-a` inclut tous les fichiers (même les cachés).
  - `--du` affiche la taille des répertoires.
  - `-h` affiche la taille des fichiers et répertoires de manière lisible (en K, M, G, etc.).
  
  Cette commande fournit un aperçu du total de l'espace disque utilisé par chaque répertoire.

### Colorer la Sortie

- **Colorer la sortie de `tree` :**

  ```bash
  tree -C /chemin/du/dossier
  ```
  
  L'option `-C` active la coloration de la sortie, rendant l'affichage plus lisible, avec des couleurs différentes pour les dossiers, fichiers, liens symboliques, etc.

### Enregistrer la Sortie dans un Fichier tout en Affichant les Erreurs

- **Sauvegarder la sortie dans un fichier et afficher les erreurs :**

  ```bash
  tree /chemin/du/dossier > sortie_tree.txt 2> erreurs_tree.txt
  ```
  
  Cette commande redirige la sortie standard vers `sortie_tree.txt` et les erreurs vers `erreurs_tree.txt`, permettant une analyse plus facile des problèmes potentiels.

### Utiliser `tree` pour Générer un Arbre en HTML

- **Générer une vue en HTML de l'arborescence :**

  ```bash
  tree -H 'http://example.com/' -o output.html /chemin/du/dossier
  ```
  
  - `-H` spécifie l'URL de base pour les liens hypertextes.
  - `-o` spécifie le fichier de sortie.
  
  Cette commande crée un fichier HTML (`output.html`) représentant l'arborescence du dossier spécifié, avec des liens permettant une navigation facile.

Ces exemples montrent que `tree` peut être adapté à une grande variété de besoins, allant de l'analyse simple de structure de dossiers à des rapports détaillés et personnalisés.

---

<!-- File: journalctl.md -->

- [`journalctl`](#journalctl)
  - [Introduction](#introduction)
  - [Paramètres et Options Principales](#paramètres-et-options-principales)
  - [Exemples d'Utilisation de `journalctl`](#exemples-dutilisation-de-journalctl)
    - [Suivre les Nouvelles Entrées du Journal](#suivre-les-nouvelles-entrées-du-journal)
    - [Afficher les Messages d'une Unité Spécifique](#afficher-les-messages-dune-unité-spécifique)
    - [Afficher les Messages depuis un Temps Spécifique](#afficher-les-messages-depuis-un-temps-spécifique)
    - [Afficher les Messages du Noeud](#afficher-les-messages-du-noeud)
    - [Afficher les Messages avec une Priorité Spécifique](#afficher-les-messages-avec-une-priorité-spécifique)
    - [Afficher les Messages d'un Démarrage Antérieur](#afficher-les-messages-dun-démarrage-antérieur)
    - [Afficher les Entrées dans un Format JSON](#afficher-les-entrées-dans-un-format-json)
    - [Réduire l'Espace Disque Utilisé par les Journaux](#réduire-lespace-disque-utilisé-par-les-journaux)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `journalctl`

## Introduction

`journalctl` est un utilitaire dans les systèmes utilisant `systemd` pour interroger et afficher les messages du journal générés par `systemd`, le noyau, les services et les applications. Ce puissant outil facilite le filtrage et la révision des logs systèmes, aidant ainsi à diagnostiquer des problèmes et à surveiller l'activité du système.

## Paramètres et Options Principales

- `-h`, `--help` : Affiche l'aide et quitte.
- `--version` : Affiche la version du programme.
- `-f`, `--follow` : Suit les nouvelles entrées du journal (comme `tail -f`).
- `-r`, `--reverse` : Affiche les entrées en ordre inverse.
- `-n`, `--lines[=NOMBRE]` : Affiche les dernières lignes spécifiées (par défaut 10).
- `-o`, `--output=MODE` : Change le format de sortie (`short`, `verbose`, `json`, etc.).
- `--since=DATE`, `--until=DATE` : Affiche les entrées depuis/avant une date spécifique.
- `-u`, `--unit=NOM_UNITÉ` : Affiche les messages d'une unité spécifique.
- `-b`, `--boot[=ID]` : Affiche les messages d'un démarrage spécifique (le démarrage actuel par défaut).
- `-k`, `--dmesg` : Affiche les messages du noyau.
- `-p`, `--priority=NIVEAU` : Affiche les messages avec une priorité spécifique ou supérieure.
- `--catalog` : Ajoute des explications aux messages journalisés quand c'est possible.
- `-D`, `--directory=DOSSIER` : Utilise un journal stocké dans un autre dossier.
- `--vacuum-size=TAILLE`, `--vacuum-time=TEMPS`, `--vacuum-files=NOMBRE` : Réduit l'espace disque utilisé par les fichiers journaux.

## Exemples d'Utilisation de `journalctl`

### Suivre les Nouvelles Entrées du Journal

```bash
journalctl -f
```

### Afficher les Messages d'une Unité Spécifique

```bash
journalctl -u nom_du_service.service
```

### Afficher les Messages depuis un Temps Spécifique

```bash
journalctl --since "2023-01-01" --until "2023-01-02"
```

### Afficher les Messages du Noeud

```bash
journalctl -k
```

### Afficher les Messages avec une Priorité Spécifique

```bash
journalctl -p err -b
```

### Afficher les Messages d'un Démarrage Antérieur

Pour afficher les entrées du démarrage précédent :

```bash
journalctl -b -1
```

### Afficher les Entrées dans un Format JSON

```bash
journalctl -b -o json
```

### Réduire l'Espace Disque Utilisé par les Journaux

Pour ne conserver que les 500MB les plus récents de journaux :

```bash
journalctl --vacuum-size=500M
```

## Bonnes Pratiques

- **Utiliser `-f` pour le Dépannage en Temps Réel** : Lors du dépannage d'un service ou de la recherche d'un problème, `journalctl -f` peut être utilisé pour observer les nouveaux messages journalisés en temps réel.
- **Nettoyage Régulier des Journaux** : Utilisez les options `--vacuum-size`, `--vacuum-time`, et `--vacuum-files` pour gérer l'espace disque occupé par les fichiers journaux, en particulier sur les systèmes avec un espace disque limité.
- **Combiner les Filtres pour une Analyse Plus Précise** : Combine différents filtres (`-u`, `--since`, `--until`, `-p`) pour affiner votre recherche dans les logs et diagnostiquer efficacement les problèmes.
- **Exportation des Journaux pour Analyse** : Pour une analyse plus approfondie ou pour partager les logs avec un collègue ou un support technique, exportez les logs dans un fichier ou un format facilement lisible comme JSON.

## Conclusion

`journalctl` est un outil essentiel pour gérer et analyser les logs systèmes sur les distributions Linux utilisant `systemd`. Grâce à ses nombre

uses options de filtrage et de formatage, il permet d'accéder de manière efficace et flexible aux informations journalisées, facilitant ainsi le dépannage et la surveillance du système.

---

<!-- File: ps_aux.md -->

- [Documentation de la fonction `ps aux`](#documentation-de-la-fonction-ps-aux)
  - [La commande se décompose comme suit :](#la-commande-se-décompose-comme-suit-)
  - [Paramètres détaillés](#paramètres-détaillés)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. **Afficher tous les processus en cours**:](#1-afficher-tous-les-processus-en-cours)
  - [2. **Afficher les processus d'un utilisateur spécifique**:](#2-afficher-les-processus-dun-utilisateur-spécifique)
  - [3. **Trier les processus par utilisation de CPU**:](#3-trier-les-processus-par-utilisation-de-cpu)
  - [4. **Trier les processus par utilisation de mémoire**:](#4-trier-les-processus-par-utilisation-de-mémoire)
  - [5. **Afficher les informations d'un processus spécifique par PID**:](#5-afficher-les-informations-dun-processus-spécifique-par-pid)
  - [6. **Afficher les processus pour un utilisateur donné**:](#6-afficher-les-processus-pour-un-utilisateur-donné)
  - [7. **Trouver des processus d'un programme spécifique**:](#7-trouver-des-processus-dun-programme-spécifique)
  - [8. **Afficher les processus sans terminal de contrôle**:](#8-afficher-les-processus-sans-terminal-de-contrôle)
  - [9. **Afficher les processus en état de sommeil ininterruptible**:](#9-afficher-les-processus-en-état-de-sommeil-ininterruptible)
  - [10. **Lister les 10 premiers processus par utilisation de CPU**:](#10-lister-les-10-premiers-processus-par-utilisation-de-cpu)
- [Cas d'utilisation sans pipes](#cas-dutilisation-sans-pipes)
- [Cas d'utilisation avec des pipes](#cas-dutilisation-avec-des-pipes)
  - [1. **Trouver les processus consommant le plus de CPU**:](#1-trouver-les-processus-consommant-le-plus-de-cpu)
  - [2. **Trouver les processus consommant le plus de mémoire**:](#2-trouver-les-processus-consommant-le-plus-de-mémoire)
  - [3. **Compter le nombre de processus d'un utilisateur**:](#3-compter-le-nombre-de-processus-dun-utilisateur)
  - [4. **Tuer tous les processus d'un utilisateur** (avec prudence) :](#4-tuer-tous-les-processus-dun-utilisateur-avec-prudence-)
  - [5. **Trouver un processus par nom et voir son utilisation de la mémoire et du CPU**:](#5-trouver-un-processus-par-nom-et-voir-son-utilisation-de-la-mémoire-et-du-cpu)
  - [6. **Afficher les processus en état de sommeil ininterruptible (D)**:](#6-afficher-les-processus-en-état-de-sommeil-ininterruptible-d)
  - [7. **Lister les processus d'un groupe spécifique (par GID)**:](#7-lister-les-processus-dun-groupe-spécifique-par-gid)
  - [8. **Afficher les processus qui ont démarré après une certaine heure**:](#8-afficher-les-processus-qui-ont-démarré-après-une-certaine-heure)
  - [9. **Trouver les processus sans terminal de contrôle**:](#9-trouver-les-processus-sans-terminal-de-contrôle)
  - [10. **Affiner la recherche d'un processus spécifique et trier par utilisation CPU**:](#10-affiner-la-recherche-dun-processus-spécifique-et-trier-par-utilisation-cpu)
- [Conclusion](#conclusion)


La commande `ps aux` est une commande Unix/Linux très utilisée pour afficher des informations sur les processus en cours d'exécution sur un système. Elle est particulièrement utile pour les administrateurs système et les utilisateurs avancés pour surveiller et gérer les processus. La commande `ps` propose de nombreuses options pour filtrer et afficher les informations sur les processus selon les besoins de l'utilisateur.

## Documentation de la fonction `ps aux`

### La commande se décompose comme suit :

- **`ps`** : La commande de base pour afficher les processus.
- **`a`** : Affiche les processus de tous les utilisateurs.
- **`u`** : Affiche l'utilisateur/propriétaire de chaque processus ainsi que d'autres informations détaillées.
- **`x`** : Affiche aussi les processus sans terminal de contrôle (détachés ou de services).

### Paramètres détaillés

- **`a`** : Inclut les processus de tous les utilisateurs.
- **`u`** : Mode utilisateur-orienté, affiche des informations détaillées sur les processus.
- **`x`** : Inclut les processus sans terminal associé.

La sortie typique inclut les colonnes PID (ID de processus), USER (propriétaire du processus), %CPU (pourcentage d'utilisation du CPU), %MEM (pourcentage d'utilisation de la mémoire), VSZ (taille virtuelle), RSS (ensemble résident), TTY (terminal lié au processus, si applicable), STAT (état du processus), START (heure de démarrage du processus), TIME (temps CPU utilisé) et COMMAND (la commande exacte qui a lancé le processus).

## Exemples d'utilisation

### 1. **Afficher tous les processus en cours**:
   ```bash
   ps aux
   ```

### 2. **Afficher les processus d'un utilisateur spécifique**:
   ```bash
   ps aux | grep 'username'
   ```

### 3. **Trier les processus par utilisation de CPU**:
   ```bash
   ps aux --sort=-%cpu | head
   ```

### 4. **Trier les processus par utilisation de mémoire**:
   ```bash
   ps aux --sort=-%mem | head
   ```

### 5. **Afficher les informations d'un processus spécifique par PID**:
   ```bash
   ps aux | grep '[p]rocess_id'
   ```

### 6. **Afficher les processus pour un utilisateur donné**:
   ```bash
   ps aux --user username
   ```

### 7. **Trouver des processus d'un programme spécifique**:
   ```bash
   ps aux | grep '[a]pache2'
   ```

### 8. **Afficher les processus sans terminal de contrôle**:
   ```bash
   ps aux | grep '?'
   ```

### 9. **Afficher les processus en état de sommeil ininterruptible**:
   ```bash
   ps aux | grep 'D'
   ```

### 10. **Lister les 10 premiers processus par utilisation de CPU**:
    ```bash
    ps aux | sort -rk 3,3 | head -n 10
    ```

## Cas d'utilisation sans pipes

- La plupart des cas d'utilisation de base de `ps aux` sans pipes consistent simplement à utiliser la commande telle quelle pour afficher tous les processus en cours d'exécution sur le système :
   ```bash
   ps aux
   ```

Cependant, sans l'utilisation de pipes (`|`), les options de filtrage et de tri sont limitées aux capacités intégrées de la commande `ps`.

## Cas d'utilisation avec des pipes

### 1. **Trouver les processus consommant le plus de CPU**:
   ```bash
   ps aux | sort -rk 3,3 | head -10
   ```

### 2. **Trouver les processus consommant le plus de mémoire**:
   ```bash
   ps aux | sort -rk 4,4 | head -10
   ```

### 3. **Compter le nombre de processus d'un utilisateur**:
   ```bash
   ps aux | grep 'username' | wc -l
   ```

### 4. **Tuer tous les processus d'un utilisateur** (avec prudence) :
   ```bash
   ps aux | grep 'username' | awk '{print $2}' | xargs kill -9
   ```

### 5. **Trouver un processus par nom et voir son utilisation de la mémoire et du CPU**:
   ```bash
   ps aux | grep '[n]ginx'
   ```

### 6. **Afficher les processus en état de sommeil ininterruptible (D)**:
   ```bash
   ps aux | awk '$8=="D" { print $0 }'
   ```

### 7. **Lister les processus d'un groupe spécifique (par GID)**:
   ```bash
   ps aux | grep '^[^ ]* [^ ]* gid'
   ```

### 8. **Afficher les processus qui ont démarré après une certaine heure**:
   ```bash
   ps aux | awk '$9 > "HH:MM"'
   ```

### 9. **Trouver les processus sans terminal de contrôle**:
   ```bash
   ps aux | grep ' ? '
   ```

### 10. **Affiner la recherche d'un processus spécifique et trier par utilisation CPU**:
    ```bash
    ps aux | grep 'python' | sort -rk 3,3
    ```

## Conclusion
Ces exemples montrent comment `ps aux` peut être puissamment combiné avec d'autres commandes Unix/Linux via des pipes pour filtrer, trier, et manipuler l'affichage des processus en cours d'exécution, fournissant des outils flexibles pour la surveillance et la gestion des processus système.

---

<!-- File: cron.md -->

- [`cron`](#cron)
  - [Introduction](#introduction)
  - [Configuration de Cron Jobs](#configuration-de-cron-jobs)
    - [Commandes et Options](#commandes-et-options)
    - [Format d'une Entrée Cron](#format-dune-entrée-cron)
  - [Exemples d'Utilisation de Cron](#exemples-dutilisation-de-cron)
    - [Exécuter un Script Tous les Jours à Minuit](#exécuter-un-script-tous-les-jours-à-minuit)
    - [Exécuter une Tâche Toutes les Heures](#exécuter-une-tâche-toutes-les-heures)
    - [Exécuter une Tâche Tous les Jours à une Heure Spécifique](#exécuter-une-tâche-tous-les-jours-à-une-heure-spécifique)
    - [Exécuter une Tâche Tous les Lundi](#exécuter-une-tâche-tous-les-lundi)
    - [Exécuter une Tâche Tous les Premiers du Mois](#exécuter-une-tâche-tous-les-premiers-du-mois)
    - [Exécuter une Tâche Toutes les 15 Minutes](#exécuter-une-tâche-toutes-les-15-minutes)
    - [Exécuter une Tâche Toutes les 5 Minutes entre 14h et 14h59](#exécuter-une-tâche-toutes-les-5-minutes-entre-14h-et-14h59)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `cron`

## Introduction

`cron` est un daemon utilisé dans les systèmes d'exploitation de type Unix pour exécuter des commandes à des intervalles réguliers, spécifiés par l'utilisateur. Les tâches planifiées par `cron` sont appelées "cron jobs". `cron` est extrêmement utile pour automatiser des tâches de maintenance ou d'administration, comme les sauvegardes, les mises à jour de logiciels ou tout script personnalisé.

## Configuration de Cron Jobs

Les cron jobs sont configurés dans une table de planification, connue sous le nom de crontab. Pour modifier la crontab, vous utilisez la commande `crontab` suivie d'une option. Chaque utilisateur sur un système peut avoir sa propre crontab.

### Commandes et Options

- `crontab -e` : Édite la crontab de l'utilisateur courant dans l'éditeur de texte par défaut.
- `crontab -l` : Liste les cron jobs de l'utilisateur courant.
- `crontab -r` : Supprime la crontab de l'utilisateur courant.
- `crontab -u nom_utilisateur` : Spécifie l'utilisateur dont la crontab doit être manipulée (nécessite des privilèges d'administration).

### Format d'une Entrée Cron

Une entrée dans une crontab consiste en six champs séparés par des espaces, suivis par la commande à exécuter :

```
* * * * *  commande à exécuter
┬ ┬ ┬ ┬ ┬
│ │ │ │ │
│ │ │ │ │
│ │ │ │ └─── Jour de la semaine (0 - 7) (Dimanche =0 ou =7)
│ │ │ └───── Mois (1 - 12)
│ │ └─────── Jour du mois (1 - 31)
│ └────────── Heure (0 - 23)
└──────────── Minute (0 - 59)
```

## Exemples d'Utilisation de Cron

### Exécuter un Script Tous les Jours à Minuit

```cron
0 0 * * * /chemin/vers/le/script
```

### Exécuter une Tâche Toutes les Heures

```cron
0 * * * * commande
```

### Exécuter une Tâche Tous les Jours à une Heure Spécifique

```cron
0 14 * * * commande  # Exécute `commande` tous les jours à 14h00.
```

### Exécuter une Tâche Tous les Lundi

```cron
0 0 * * 1 commande  # Exécute `commande` tous les lundi à minuit.
```

### Exécuter une Tâche Tous les Premiers du Mois

```cron
0 0 1 * * commande
```

### Exécuter une Tâche Toutes les 15 Minutes

```cron
*/15 * * * * commande
```

### Exécuter une Tâche Toutes les 5 Minutes entre 14h et 14h59

```cron
*/5 14 * * * commande
```

## Bonnes Pratiques

- **Commenter vos Cron Jobs** : Commentez vos entrées dans la crontab pour rappeler leur fonction.
- **Tester vos Commandes** : Testez vos commandes dans le terminal avant de les ajouter à votre crontab pour vous assurer qu'elles fonctionnent comme prévu.
- **Utiliser des Chemins Complets** : Spécifiez toujours le chemin complet vers les fichiers et commandes dans vos cron jobs pour éviter les erreurs d'exécution.
- **Gérer la Sortie** : Redirigez la sortie standard et la sortie d'erreur de vos commandes pour éviter de recevoir des courriels avec la sortie de vos tâches cron (par exemple, en ajoutant `> /dev/null 2>&1` à la fin de vos commandes).

## Conclusion

`cron` est un outil essentiel pour la planification de tâches automatiques sur les systèmes Unix et Linux. En comprenant le format de la crontab et en suivant les meilleures pratiques, vous pouvez automatiser efficacement une grande variété de tâches de maintenance et d'administration système.

---

<!-- File: crontab.md -->

---
title: crontab
date: 2024-07-18
tags:
  - ressource
  - templates
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour `crontab` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de `crontab`](#fonctionnement-de-crontab)
3. [Syntaxe de `crontab`](#syntaxe-de-crontab)
4. [Options de `crontab`](#options-de-crontab)
    - [Option `-e` (edit)](#option--e-edit)
    - [Option `-l` (list)](#option--l-list)
    - [Option `-r` (remove)](#option--r-remove)
    - [Option `-u` (user)](#option--u-user)
5. [Structure d'une ligne `crontab`](#structure-dune-ligne-crontab)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Exécuter un script chaque jour à 2h du matin](#exemple-1--exécuter-un-script-chaque-jour-à-2h-du-matin)
    - [Exemple 2 : Exécuter une commande toutes les 5 minutes](#exemple-2--exécuter-une-commande-toutes-les-5-minutes)
    - [Exemple 3 : Exécuter un script chaque lundi à 7h](#exemple-3--exécuter-un-script-chaque-lundi-à-7h)
    - [Exemple 4 : Liste des tâches cron](#exemple-4--liste-des-tâches-cron)
    - [Exemple 5 : Supprimer toutes les tâches cron pour un utilisateur](#exemple-5--supprimer-toutes-les-tâches-cron-pour-un-utilisateur)
7. [Conclusion](#conclusion)

## Introduction

La commande `crontab` sous Linux est utilisée pour gérer les tâches planifiées (cron jobs). Un cron job est une tâche qui est exécutée à des intervalles de temps réguliers, comme l'exécution d'un script ou d'une commande à une heure spécifique chaque jour.

## Fonctionnement de `crontab`

`crontab` permet aux utilisateurs de créer, modifier, afficher, et supprimer leurs propres listes de tâches planifiées. Chaque utilisateur peut avoir son propre fichier `crontab` personnel.

## Syntaxe de `crontab`

```bash
crontab [options] [fichier]
```

### Arguments

- `[fichier]` : Le fichier contenant les tâches cron à installer. Si ce fichier n'est pas spécifié, `crontab` ouvre l'éditeur par défaut pour modifier le fichier crontab.

## Options de `crontab`

### Option `-e` (edit)

Ouvre le fichier `crontab` actuel dans l'éditeur par défaut pour le modifier.

```bash
crontab -e
```

### Option `-l` (list)

Affiche le contenu du fichier `crontab` actuel.

```bash
crontab -l
```

### Option `-r` (remove)

Supprime le fichier `crontab` actuel pour l'utilisateur.

```bash
crontab -r
```

### Option `-u` (user)

Spécifie l'utilisateur pour les commandes `crontab`. Doit être utilisé par le superutilisateur pour manipuler le `crontab` d'autres utilisateurs.

```bash
crontab -u utilisateur [option]
```

## Structure d'une ligne `crontab`

Chaque ligne d'un fichier `crontab` représente une tâche planifiée et a la structure suivante :

```
* * * * * commande à exécuter
- - - - -
| | | | |
| | | | +---- Jour de la semaine (0 - 7) (Dimanche = 0 ou 7)
| | | +------ Mois (1 - 12)
| | +-------- Jour du mois (1 - 31)
| +---------- Heure (0 - 23)
+------------ Minute (0 - 59)
```

## Exemples concrets

### Exemple 1 : Exécuter un script chaque jour à 2h du matin

Pour exécuter `/chemin/vers/script.sh` chaque jour à 2h du matin :

```bash
0 2 * * * /chemin/vers/script.sh
```

### Exemple 2 : Exécuter une commande toutes les 5 minutes

Pour exécuter `commande` toutes les 5 minutes :

```bash
*/5 * * * * commande
```

### Exemple 3 : Exécuter un script chaque lundi à 7h

Pour exécuter `/chemin/vers/script.sh` chaque lundi à 7h du matin :

```bash
0 7 * * 1 /chemin/vers/script.sh
```

### Exemple 4 : Liste des tâches cron

Pour afficher les tâches cron actuelles de l'utilisateur :

```bash
crontab -l
```

### Exemple 5 : Supprimer toutes les tâches cron pour un utilisateur

Pour supprimer toutes les tâches cron pour l'utilisateur courant :

```bash
crontab -r
```

Pour supprimer toutes les tâches cron pour un utilisateur spécifique (doit être exécuté par le superutilisateur) :

```bash
sudo crontab -u utilisateur -r
```

## Conclusion

La commande `crontab` est un outil puissant pour planifier des tâches récurrentes sous Linux. Elle permet d'automatiser l'exécution de scripts et de commandes à des intervalles de temps définis, ce qui est essentiel pour la maintenance du système, les sauvegardes, et d'autres tâches administratives. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man crontab` ou la documentation officielle de votre distribution Linux.

---

<!-- File: dejadup.md -->

- [Documentation sur Déjà Dup sous Debian et dérivés](#documentation-sur-déjà-dup-sous-debian-et-dérivés)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Configuration initiale](#configuration-initiale)
  - [Utilisation](#utilisation)
    - [Effectuer une sauvegarde manuelle](#effectuer-une-sauvegarde-manuelle)
    - [Restaurer des fichiers](#restaurer-des-fichiers)
    - [Paramètres avancés](#paramètres-avancés)
  - [Bonnes pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# Documentation sur Déjà Dup sous Debian et dérivés

## Introduction

Déjà Dup est une interface graphique simple pour l'outil de sauvegarde `duplicity`. Elle est conçue pour rendre la sauvegarde de fichiers personnels facile pour les utilisateurs de Linux. Déjà Dup prend en charge la sauvegarde cryptée, la programmation de sauvegardes régulières, et la sauvegarde vers divers emplacements, y compris les services cloud locaux et distants.

## Installation

Sur Debian et ses dérivés, Déjà Dup peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install deja-dup
```

## Configuration initiale

Après l'installation, vous pouvez lancer Déjà Dup depuis le menu des applications ou en tapant `deja-dup` dans un terminal.

La première fois que vous lancez Déjà Dup, il est recommandé de configurer vos préférences de sauvegarde :

1. **Sélectionnez les dossiers à sauvegarder** : Par défaut, Déjà Dup sauvegardera votre dossier personnel, mais vous pouvez ajuster cette sélection en ajoutant ou en excluant des dossiers.

2. **Choisissez l'emplacement de sauvegarde** : Déjà Dup peut sauvegarder vos fichiers sur un disque local, un serveur réseau, ou des services cloud tels que Google Drive. Sélectionnez l'emplacement qui vous convient le mieux.

3. **Planification** : Activez la planification pour que Déjà Dup exécute automatiquement des sauvegardes à intervalles réguliers (quotidien, hebdomadaire, etc.).

## Utilisation

### Effectuer une sauvegarde manuelle

- Cliquez sur "Sauvegarder maintenant" pour démarrer une sauvegarde manuellement. Déjà Dup demandera la confirmation avant de commencer.

### Restaurer des fichiers

- Pour restaurer des fichiers, cliquez sur "Restaurer" dans la fenêtre principale de Déjà Dup. Vous pouvez choisir de restaurer à partir d'une date spécifique, puis naviguer dans la sauvegarde et sélectionner les fichiers ou dossiers à restaurer.

### Paramètres avancés

- **Cryptage** : Activez le cryptage pour sécuriser vos sauvegardes. Déjà Dup vous demandera de créer un mot de passe. Gardez ce mot de passe en lieu sûr ; vous en aurez besoin pour accéder à vos sauvegardes.
  
- **Exclusions** : Utilisez les paramètres d'exclusion pour omettre des fichiers volumineux, des dossiers système, ou des données temporaires qui n'ont pas besoin d'être sauvegardées.

## Bonnes pratiques

- **Testez la restauration** : Après avoir configuré vos sauvegardes, effectuez un test de restauration d'un petit nombre de fichiers pour vous assurer que tout fonctionne comme prévu.

- **Stockage sécurisé des mots de passe** : Si vous activez le cryptage, assurez-vous que le mot de passe de votre sauvegarde est stocké dans un endroit sécurisé et accessible.

- **Vérifiez régulièrement** : Vérifiez périodiquement que vos sauvegardes sont effectuées comme prévu, surtout si vous comptez sur des sauvegardes automatiques.

## Conclusion

Déjà Dup offre une solution de sauvegarde simple et fiable pour les utilisateurs de Debian et de ses dérivés. Sa facilité d'utilisation, couplée à la puissance de `duplicity` pour le backend, en fait un excellent choix pour les utilisateurs souhaitant sécuriser leurs données sans se plonger dans les complexités techniques. Avec une configuration appropriée et un entretien régulier, Déjà Dup peut aider à protéger vos données importantes contre la perte ou les dommages.

---

<!-- File: Fail2ban.md -->

---
title: Fail2ban
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour 
 sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de Fail2ban](#fonctionnement-de-fail2ban)
4. [Configuration de Fail2ban](#configuration-de-fail2ban)
5. [Options de configuration de Fail2ban](#options-de-configuration-de-fail2ban)
    - [Option `bantime`](#option-bantime)
    - [Option `findtime`](#option-findtime)
    - [Option `maxretry`](#option-maxretry)
    - [Option `ignoreip`](#option-ignoreip)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Configurer un jail pour SSH](#exemple-1--configurer-un-jail-pour-ssh)
    - [Exemple 2 : Configurer un jail pour Apache](#exemple-2--configurer-un-jail-pour-apache)
    - [Exemple 3 : Débannir une adresse IP](#exemple-3--débannir-une-adresse-ip)

## Introduction

Fail2ban est un logiciel de sécurité qui protège les serveurs contre les attaques par force brute. Il surveille les fichiers journaux (logs) de divers services et bannit temporairement les adresses IP qui montrent des comportements malveillants, tels que des tentatives de connexion échouées répétées.

## Installation

Fail2ban est disponible dans les dépôts de la plupart des distributions Linux. Voici comment l'installer sur différentes distributions :

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install fail2ban
```

### Sur Fedora

```bash
sudo dnf install fail2ban
```

### Sur Arch Linux

```bash
sudo pacman -S fail2ban
```

### Vérification de l'installation

Pour vérifier que Fail2ban est correctement installé, vous pouvez utiliser la commande suivante :

```bash
fail2ban-client --version
```

## Fonctionnement de Fail2ban

Fail2ban fonctionne en surveillant les fichiers journaux des services configurés (comme SSH, Apache, etc.). Lorsqu'il détecte un comportement suspect, comme plusieurs tentatives de connexion échouées, il bannit l'adresse IP de l'attaquant en modifiant les règles du pare-feu pour bloquer cette adresse IP pendant une période définie.

## Configuration de Fail2ban

La configuration de Fail2ban est généralement située dans le répertoire `/etc/fail2ban`. Le fichier principal de configuration est `jail.conf`, mais il est recommandé de ne pas modifier ce fichier directement. À la place, créez un fichier `jail.local` pour vos configurations personnalisées.

### Exemple de configuration de base dans `/etc/fail2ban/jail.local`

```ini
[DEFAULT]
bantime  = 600
findtime  = 600
maxretry = 3

[sshd]
enabled = true
port    = 22
logpath = /var/log/auth.log
backend = systemd
```

## Options de configuration de Fail2ban

### Option `bantime`

Définit la durée (en secondes) pendant laquelle une adresse IP est bannie.

```ini
bantime = 600
```

**Explication :** Cette option définit le temps de bannissement à 600 secondes (10 minutes).

### Option `findtime`

Définit la période (en secondes) pendant laquelle les échecs de connexion doivent se produire pour déclencher un bannissement.

```ini
findtime = 600
```

**Explication :** Si `maxretry` tentatives échouées se produisent dans cette période, l'adresse IP sera bannie.

### Option `maxretry`

Définit le nombre de tentatives échouées avant de bannir une adresse IP.

```ini
maxretry = 3
```

**Explication :** Cette option définit le nombre maximal de tentatives échouées à 3.

### Option `ignoreip`

Définit les adresses IP qui ne devraient jamais être bannies.

```ini
ignoreip = 127.0.0.1/8 ::1
```

**Explication :** Les adresses IP locales ne seront pas bannies.

## Exemples concrets

### Exemple 1 : Configurer un jail pour SSH

Ajoutez ou modifiez la configuration dans `/etc/fail2ban/jail.local` pour protéger le service SSH.

```ini
[sshd]
enabled = true
port    = 22
logpath = /var/log/auth.log
backend = systemd
```

**Explication :** Ce jail surveille le fichier journal `/var/log/auth.log` pour les tentatives de connexion SSH échouées et bannit les adresses IP malveillantes.

### Exemple 2 : Configurer un jail pour Apache

Ajoutez la configuration suivante pour protéger un serveur web Apache contre les attaques.

```ini
[apache-auth]
enabled = true
port    = http,https
logpath = /var/log/apache2/*error.log
maxretry = 3
```

**Explication :** Ce jail surveille les fichiers journal d'erreurs d'Apache pour les tentatives de connexion échouées et bannit les adresses IP après 3 échecs.

### Exemple 3 : Débannir une adresse IP

Pour débannir une adresse IP manuellement, utilisez la commande suivante :

```bash
sudo fail2ban-client set sshd unbanip <IP_ADDRESS>
```

**Explication :** Remplacez `<IP_ADDRESS>` par l'adresse IP que vous souhaitez débannir.

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour installer, configurer et utiliser Fail2ban sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man fail2ban` ou la documentation officielle de Fail2ban.

---

<!-- File: fail2ban.md -->

# Documentation sur Fail2Ban sous Debian et dérivés

## Introduction

Fail2Ban est un outil de prévention d'intrusion qui protège les serveurs contre les attaques par force brute et d'autres types d'attaques automatisées en surveillant les journaux (logs) et en bannissant les adresses IP qui montrent des signes d'activités malveillantes. Fail2Ban est configurable et peut être utilisé avec plusieurs services courants tels que SSH, Apache, Nginx, et les serveurs de messagerie.

## Installation

Sur Debian et ses dérivés, Fail2Ban peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install fail2ban
```

## Configuration

Fail2Ban se configure via des fichiers situés dans le répertoire `/etc/fail2ban/`. Les configurations spécifiques à un service sont gérées dans les fichiers de "jail" (prison).

### Configuration de base

1. **Jail.local** :
   Pour personnaliser la configuration, il est recommandé de créer un fichier `jail.local` qui écrasera les paramètres par défaut du fichier `jail.conf`.

   ```bash
   sudo cp /etc/fail2ban/jail.{conf,local}
   sudo nano /etc/fail2ban/jail.local
   ```

   Voici quelques paramètres communs à configurer :

   - `ignoreip` : Liste des adresses IP à ignorer.
   - `bantime` : Durée pendant laquelle une adresse IP est bannie.
   - `findtime` : Période pendant laquelle Fail2Ban compte les échecs avant de bannir une adresse IP.
   - `maxretry` : Nombre maximal de tentatives échouées avant bannissement.

2. **Configurer les jails pour des services spécifiques** :
   Dans `jail.local`, activez et configurez les jails pour les services que vous souhaitez protéger. Par exemple, pour SSH :

   ```ini
   [sshd]
   enabled = true
   port    = ssh
   filter  = sshd
   logpath = /var/log/auth.log
   maxretry = 5
   ```

## Filtres et Actions

- **Filtres** (`/etc/fail2ban/filter.d/`) : Définissent les motifs (patterns) de log à rechercher, permettant d'identifier les tentatives d'accès non autorisées.
- **Actions** (`/etc/fail2ban/action.d/`) : Définissent ce que Fail2Ban fait lorsqu'il détecte une correspondance avec un filtre. Les actions peuvent inclure l'envoi d'emails, le bannissement d'adresses IP via iptables ou firewalld, etc.

## Commandes Utiles

- **Démarrer Fail2Ban** :
  ```bash
  sudo systemctl start fail2ban
  ```
  
- **Activer le démarrage automatique** :
  ```bash
  sudo systemctl enable fail2ban
  ```
  
- **Vérifier le statut de Fail2Ban** :
  ```bash
  sudo fail2ban-client status
  ```
  
- **Voir les jails activées** :
  ```bash
  sudo fail2ban-client status
  ```
  
- **Voir les détails d'une jail spécifique** (par exemple, sshd) :
  ```bash
  sudo fail2ban-client status sshd
  ```

- **Débannir une adresse IP** :
  ```bash
  sudo fail2ban-client set <JAIL> unbanip <IP_ADDRESS>
  ```

## Sécurité supplémentaire

- Assurez-vous que votre configuration Fail2Ban est adaptée aux services que vous exécutez sur votre serveur.
- Surveillez régulièrement les logs de Fail2Ban pour détecter toute activité suspecte.
- Considérez l'utilisation de ports non standard pour des services comme SSH pour réduire les scans automatiques.

## Conclusion

Fail2Ban est un outil essentiel pour améliorer la sécurité de votre serveur en bannissant les adresses IP qui tentent de compromettre vos services. Une configuration et une surveillance appropriées de Fail2Ban permettent de se protéger efficacement contre de nombreuses attaques automatisées. Adapter la configuration de Fail2Ban à vos besoins spécifiques et surveiller son activité peut significativement augmenter la robustesse de votre serveur face aux attaques.

---

<!-- File: gparted.md -->

- [Documentation sur GParted sous Debian et dérivés](#documentation-sur-gparted-sous-debian-et-dérivés)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Lancement de GParted](#lancement-de-gparted)
  - [Utilisation de base](#utilisation-de-base)
    - [Sélection du disque](#sélection-du-disque)
    - [Création d'une nouvelle partition](#création-dune-nouvelle-partition)
    - [Redimensionnement d'une partition](#redimensionnement-dune-partition)
    - [Formatage d'une partition](#formatage-dune-partition)
    - [Application des changements](#application-des-changements)
  - [Conseils et avertissements](#conseils-et-avertissements)
  - [Conclusion](#conclusion)


# Documentation sur GParted sous Debian et dérivés

## Introduction

GParted (GNOME Partition Editor) est un éditeur de partitions graphique puissant et gratuit qui permet de créer, réorganiser et supprimer des partitions de disque sans perdre de données. GParted supporte un large éventail de systèmes de fichiers et permet de gérer les partitions de manière intuitive grâce à son interface graphique. C'est un outil indispensable pour la gestion des partitions sur les systèmes Linux.

## Installation

Sur Debian et ses dérivés, GParted peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install gparted
```

## Lancement de GParted

Après installation, GParted peut être lancé de deux manières :

- **Via l'interface graphique** : Cherchez GParted dans le menu des applications et lancez-le.
- **Via le terminal** : Tapez `sudo gparted` dans un terminal.

## Utilisation de base

### Sélection du disque

À l'ouverture, GParted affiche les partitions du premier disque détecté. Pour changer de disque :
- Sélectionnez le disque souhaité dans le menu déroulant en haut à droite de la fenêtre.

### Création d'une nouvelle partition

1. **Supprimer une partition existante** (optionnel) : Sélectionnez la partition à supprimer, faites un clic droit et choisissez "Supprimer".
2. **Créer une nouvelle partition** :
   - Sélectionnez l'espace non alloué (résultant de la suppression ou déjà existant), faites un clic droit et choisissez "Nouveau".
   - Configurez la taille de la partition, le système de fichiers (comme ext4, NTFS, FAT32, etc.) et le label si nécessaire.
   - Cliquez sur "Ajouter".

### Redimensionnement d'une partition

1. Sélectionnez la partition à redimensionner.
2. Faites un clic droit et choisissez "Redimensionner/Déplacer".
3. Ajustez la taille de la partition en utilisant les glisseurs ou en entrant les valeurs spécifiques.
4. Cliquez sur "Redimensionner/Déplacer".

### Formatage d'une partition

1. Sélectionnez la partition à formater.
2. Faites un clic droit et choisissez "Formater en" et sélectionnez le système de fichiers souhaité.
3. Confirmez en cliquant sur "Appliquer".

### Application des changements

Toutes les opérations dans GParted sont **virtuelles** jusqu'à ce que vous cliquiez sur le bouton "Appliquer" dans la barre d'outils. Ceci permet de planifier plusieurs opérations qui seront exécutées en séquence.

## Conseils et avertissements

- **Sauvegarde des données** : Toujours sauvegarder les données importantes avant de modifier les partitions. Même si GParted est conçu pour prévenir la perte de données, des erreurs peuvent survenir.
- **Alimentation stable** : Assurez-vous que votre ordinateur est branché à une source d'alimentation fiable ou utilisez un onduleur. Une coupure de courant pendant une opération de partitionnement peut entraîner une perte de données.
- **Défragmentation** (pour NTFS ou FAT32) : Défragmentez les partitions Windows avant de les redimensionner pour minimiser le risque de perte de données.
- **Gestion des espaces non alloués** : GParted ne peut étendre une partition que dans un espace non alloué adjacent. Planifiez en conséquence.

## Conclusion

GParted est un outil de gestion de partitions complet et convivial pour les systèmes basés sur Linux comme Debian. Il offre une interface graphique pour effectuer des tâches de partitionnement complexes de manière plus intuitive que les outils en ligne de commande. Toutefois, la prudence est de mise lors de la manipulation des partitions, et il est fortement recommandé de sauvegarder les données importantes avant de procéder à des modifications.

---

<!-- File: nmon.md -->

# Tutoriel et Documentation Complète sur `nmon`

## Introduction

`nmon` (Nigel's Monitor) est un outil de performance système pour Linux, conçu pour aider dans l'analyse et la surveillance des performances. Il affiche en temps réel des informations sur l'utilisation du système, y compris le CPU, la mémoire, le disque, la réseau, et d'autres statistiques vitales.

## Installation

`nmon` peut être installé via les gestionnaires de paquets de différentes distributions Linux :

- Sur **Debian/Ubuntu** :

  ```bash
  sudo apt-get install nmon
  ```

- Sur **Fedora** :

  ```bash
  sudo dnf install nmon
  ```

- Sur **CentOS/RHEL** :

  Vous devrez peut-être activer le dépôt EPEL avant d'installer :

  ```bash
  sudo yum install epel-release
  sudo yum install nmon
  ```

## Options de Lancement

`nmon` n'a pas de longue liste d'options de ligne de commande, mais il offre des raccourcis clavier interactifs pour contrôler les données affichées :

- `-f` : Lance `nmon` en mode capture dans un fichier. Utile pour l'analyse post-mortem.
- `-t` : Inclut les statistiques des disques.
- `-d disks` : Définit le nombre de disques à afficher.
- `-s seconds` : Définit l'intervalle de temps entre les captures.
- `-c count` : Définit le nombre de captures à réaliser.
- `-F filename` : Spécifie le nom du fichier de sortie en mode capture.
- `-T` : Inclut les statistiques de la carte réseau.
- `-r` : Permet de spécifier un titre pour la capture de données.
- `-h` : Affiche l'aide.

## Utilisation Interactive

Lorsque lancé sans options, `nmon` démarre en mode interactif. Vous pouvez appuyer sur diverses touches pour afficher ou masquer différentes sections :

- `c` : CPU
- `m` : Mémoire
- `d` : Disque
- `k` : Kernel
- `n` : Réseau
- `V` : Machines virtuelles
- `q` : Quitter `nmon`

## Exemples d'Utilisation de `nmon`

### Lancer `nmon` en Mode Interactif

Il suffit de taper `nmon` et d'utiliser les touches interactives pour naviguer entre les différentes statistiques.

### Capturer les Données dans un Fichier

Pour capturer les données toutes les 2 secondes pendant 120 secondes et les sauvegarder dans un fichier :

```bash
nmon -f -s 2 -c 60 -F nmon_output.nmon
```

### Analyser les Performances des Disques et du Réseau

Pour surveiller spécifiquement les performances des disques et du réseau :

```bash
nmon -d 5 -T
```

## Bonnes Pratiques

- **Surveillance en Temps Réel** : Utilisez `nmon` en mode interactif pour une surveillance en temps réel et pour diagnostiquer rapidement les problèmes de performance.
- **Analyse Historique** : Utilisez le mode capture de `nmon` pour collecter des données sur une période prolongée. Cela peut être particulièrement utile pour l'analyse des tendances ou pour diagnostiquer des problèmes intermittents.
- **Personnalisation** : N'hésitez pas à combiner les différentes options de `nmon` pour affiner les données capturées selon vos besoins spécifiques d'analyse de performance.

## Conclusion

`nmon` est un outil puissant et flexible pour la surveillance et l'analyse des performances système sous Linux. Grâce à sa capacité à fournir des informations en temps réel sur une grande variété de paramètres système, ainsi qu'à sa facilité d'utilisation en mode capture, `nmon` est précieux pour les administrateurs système et les professionnels IT cherchant à optimiser les performances et à résoudre les problèmes de leur infrastructure Linux.

---

<!-- File: adduser.md -->

# Tutoriel et Documentation Complète sur `adduser`

## Introduction

La commande `adduser` est un utilitaire en ligne de commande sous Linux qui facilite l'ajout d'un utilisateur au système. Il est plus convivial que `useradd`, car il configure automatiquement certains paramètres par défaut tels que le répertoire personnel et les informations de groupe.

## Options Principales de `adduser`

- `--disabled-login` : Crée un utilisateur sans possibilité de se connecter.
- `--disabled-password` : Crée un utilisateur sans mot de passe.
- `--gecos GECOS` : Définit les informations GECOS pour le nouvel utilisateur, qui peuvent inclure le nom complet, une chambre, un numéro de téléphone, un autre numéro de téléphone, et d'autres informations.
- `--home RÉPERTOIRE` : Spécifie le répertoire personnel de l'utilisateur à créer.
- `--ingroup GROUPE` : Ajoute l'utilisateur à un groupe existant.
- `--no-create-home` : Ne crée pas de répertoire personnel pour l'utilisateur.
- `--shell INTERPRÉTEUR` : Spécifie l'interpréteur de commandes pour l'utilisateur.

## Exemples d'Utilisation

### Ajouter un Nouvel Utilisateur

Pour ajouter un nouvel utilisateur avec un répertoire personnel :

```bash
sudo adduser nouvelutilisateur
```

Cela crée un nouvel utilisateur appelé `nouvelutilisateur` et configure un répertoire personnel pour lui sous `/home/nouvelutilisateur`.

### Ajouter un Utilisateur Sans Mot de Passe

Pour créer un utilisateur sans mot de passe :

```bash
sudo adduser --disabled-password nouvelutilisateur
```

### Définir le Shell de l'Utilisateur

Pour spécifier le shell de l'utilisateur lors de sa création :

```bash
sudo adduser nouvelutilisateur --shell /bin/zsh
```

### Ajouter un Utilisateur à un Groupe Spécifique

Pour ajouter un utilisateur et le mettre dans un groupe spécifique dès sa création :

```bash
sudo adduser nouvelutilisateur --ingroup groupeexistant
```

### Utilisation de l'Option GECOS

Pour définir les informations GECOS lors de la création d'un utilisateur :

```bash
sudo adduser nouvelutilisateur --gecos "Nom Complet,Chambre,Téléphone,Téléphone2,Autre"
```

## Ajouter un Utilisateur Système

`adduser` peut aussi créer des utilisateurs système, qui sont utiles pour exécuter des services ou des applications :

```bash
sudo adduser --system nouvelutilisateursysteme
```

### Créer un Utilisateur Sans Répertoire Personnel

Dans certains cas, vous voudrez peut-être créer un utilisateur sans répertoire personnel :

```bash
sudo adduser --no-create-home nouvelutilisateur
```

## Conseils

- **Sécurité** : Pour les utilisateurs normaux, configurez toujours un mot de passe solide. Pour les comptes système ou ceux sans possibilité de se connecter, l'utilisation des options `--disabled-login` ou `--disabled-password` peut être appropriée.
- **Utilisation de `adduser` vs `useradd`** : Bien que `useradd` soit plus basique et offre un contrôle plus granulaire, `adduser` est généralement préféré pour sa simplicité et sa facilité d'utilisation, surtout pour les administrateurs système moins expérimentés.
- **Gestion des Groupes** : Pensez à la gestion des groupes lors de la création de nouveaux utilisateurs. L'ajout d'utilisateurs à des groupes spécifiques dès le début peut simplifier la gestion des permissions d'accès.

## Conclusion

`adduser` est un outil essentiel pour la gestion des utilisateurs sur les systèmes Linux. Il offre une méthode simple et directe pour ajouter des utilisateurs, configurer leur environnement et définir leurs permissions d'accès. En utilisant les options disponibles, vous pouvez facilement personnaliser le processus de création d'utilisateur pour répondre à divers besoins et exigences de sécurité.

---

<!-- File: deluser.md -->

# Tutoriel et Documentation Complète sur `deluser`

## Introduction

`deluser` est une commande disponible sur les systèmes d'exploitation basés sur Debian et Ubuntu qui permet de supprimer un utilisateur et/ou son groupe associé du système. Cet outil simplifie le processus de gestion des utilisateurs en automatisant la suppression sécurisée des répertoires personnels et des entrées de messagerie.

## Syntaxe

La syntaxe de base de `deluser` est :

```bash
deluser [options] UTILISATEUR
```

Ou pour supprimer un groupe :

```bash
deluser --group GROUPE
```

## Options Principales

- `--remove-home` : Supprime le répertoire personnel de l'utilisateur ainsi que sa boîte aux lettres.
- `--remove-all-files` : Supprime tous les fichiers appartenant à l'utilisateur sur le système.
- `--backup` : Crée une sauvegarde des fichiers de l'utilisateur avant la suppression.
- `--backup-to CHEMIN` : Spécifie le répertoire où sauvegarder les fichiers de l'utilisateur.
- `--group` : Indique que le nom spécifié est celui d'un groupe à supprimer.
- `--system` : Indique que l'utilisateur ou le groupe est un utilisateur ou un groupe système.
- `--quiet` : Mode silencieux, réduit la sortie de la commande.

## Exemples d'Utilisation

### Supprimer un Utilisateur Simple

Pour supprimer un utilisateur sans supprimer son répertoire personnel ni ses fichiers :

```bash
deluser jdoe
```

### Supprimer un Utilisateur et son Répertoire Personnel

Pour supprimer un utilisateur et son répertoire personnel :

```bash
deluser --remove-home jdoe
```

### Supprimer un Utilisateur et Tous ses Fichiers

Pour supprimer un utilisateur et tous les fichiers lui appartenant sur le système :

```bash
deluser --remove-all-files jdoe
```

### Supprimer un Utilisateur avec Sauvegarde

Pour supprimer un utilisateur et sauvegarder ses fichiers :

```bash
deluser --backup --backup-to /chemin/de/sauvegarde jdoe
```

### Supprimer un Groupe

Pour supprimer un groupe :

```bash
deluser --group leGroupe
```

## Conseils d'Utilisation

- Toujours vérifier les fichiers et les répertoires appartenant à l'utilisateur avant de procéder à une suppression avec `--remove-all-files`, pour éviter de supprimer des données importantes par erreur.
- La sauvegarde avec `--backup` est une mesure de sécurité utile avant de supprimer des utilisateurs, surtout si leurs données pourraient être nécessaires ultérieurement.
- Utiliser `--quiet` pour automatiser des scripts sans générer une sortie excessive.

## Conclusion

`deluser` est un outil essentiel pour la gestion des utilisateurs sur les systèmes Debian et Ubuntu, offrant une flexibilité et des options de sécurité pour supprimer des utilisateurs et leurs données. Il est recommandé de faire preuve de prudence lors de son utilisation, en particulier avec les options qui suppriment les données utilisateur, pour éviter toute perte accidentelle d'informations importantes.

---

<!-- File: gpasswd.md -->

# Tutoriel et Documentation Complète sur `gpasswd`

## Introduction

`gpasswd` est un outil de gestion des groupes sous les systèmes d'exploitation Linux/Unix. Il permet aux administrateurs de modifier les listes de membres des groupes, ainsi que les mots de passe des groupes. C'est un complément au traditionnel `passwd` pour les utilisateurs, offrant une gestion fine des groupes.

## Syntaxe

La syntaxe générale de `gpasswd` est :

```bash
gpasswd [options] GROUPE
```

- `options` : Modificateurs de commande qui ajustent le comportement de `gpasswd`.
- `GROUPE` : Le nom du groupe sur lequel appliquer les modifications.

## Options Principales

- `-a UTILISATEUR` : Ajoute un utilisateur au groupe spécifié.
- `-d UTILISATEUR` : Supprime un utilisateur du groupe.
- `-R` : Restreint l'usage du groupe aux membres du groupe.
- `-r` : Supprime le mot de passe du groupe, le rendant accessible sans mot de passe.
- `-A UTILISATEUR1,UTILISATEUR2,...` : Définit les utilisateurs spécifiés comme administrateurs du groupe.
- `-M UTILISATEUR1,UTILISATEUR2,...` : Établit une liste d'utilisateurs comme les seuls membres du groupe, en remplaçant tous les membres actuels.

## Exemples d'Utilisation

### Ajouter un Utilisateur à un Groupe

Pour ajouter un utilisateur `jdoe` au groupe `developers` :

```bash
gpasswd -a jdoe developers
```

### Supprimer un Utilisateur d'un Groupe

Pour supprimer `jdoe` du groupe `developers` :

```bash
gpasswd -d jdoe developers
```

### Définir des Administrateurs de Groupe

Pour définir `jdoe` et `asmith` comme administrateurs du groupe `developers` :

```bash
gpasswd -A jdoe,asmith developers
```

Les administrateurs de groupe peuvent ajouter ou supprimer des membres du groupe.

### Remplacer Tous les Membres d'un Groupe

Pour remplacer tous les membres du groupe `developers` par `jdoe` et `asmith` :

```bash
gpasswd -M jdoe,asmith developers
```

### Supprimer le Mot de Passe d'un Groupe

Pour rendre le groupe `secretgroup` accessible sans mot de passe :

```bash
gpasswd -r secretgroup
```

### Restreindre l'Accès au Groupe

Pour rendre le groupe `restrictedgroup` accessible uniquement à ses membres :

```bash
gpasswd -R restrictedgroup
```

## Conseils d'Utilisation

- Les modifications apportées à l'appartenance au groupe peuvent nécessiter une nouvelle connexion de l'utilisateur concerné pour prendre effet.
- Utilisez `gpasswd` avec précaution lors de la modification des groupes système ou des groupes avec des accès spéciaux pour éviter des problèmes de sécurité.
- Vérifiez toujours l'appartenance actuelle d'un groupe avant d'utiliser l'option `-M`, car elle remplacera tous les membres existants.

## Conclusion

`gpasswd` est un outil puissant pour la gestion des groupes sous Linux/Unix, offrant des fonctionnalités avancées pour l'administration des membres et des mots de passe des groupes. En utilisant `gpasswd`, les administrateurs système peuvent facilement gérer l'accès aux ressources partagées et sécuriser les groupes de travail.

---

<!-- File: groupadd.md -->

- [`groupadd`](#groupadd)
  - [Introduction](#introduction)
  - [Syntaxe de Base](#syntaxe-de-base)
  - [Options Principales](#options-principales)
    - [`-f`, `--force`](#-f---force)
    - [`-g`, `--gid GID`](#-g---gid-gid)
    - [`-o`, `--non-unique`](#-o---non-unique)
    - [`-r`, `--system`](#-r---system)
    - [`-K`, `--key KEY=VALUE`](#-k---key-keyvalue)
    - [`-p`, `--password MOT_DE_PASSE`](#-p---password-mot_de_passe)
  - [Création d'un Nouveau Groupe](#création-dun-nouveau-groupe)
    - [Exemple Simple](#exemple-simple)
    - [Utilisation Pratique](#utilisation-pratique)
      - [Créer un groupe standard](#créer-un-groupe-standard)
      - [Créer un groupe système avec un GID spécifique](#créer-un-groupe-système-avec-un-gid-spécifique)
    - [Exemple avec un GID Spécifique](#exemple-avec-un-gid-spécifique)
    - [Créer un groupe avec un GID non unique](#créer-un-groupe-avec-un-gid-non-unique)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Gestion des Groupes](#gestion-des-groupes)
    - [Conseils](#conseils)
  - [Conclusion](#conclusion)


# `groupadd`

## Introduction

La commande `groupadd` est utilisée sur les systèmes d'exploitation basés sur Linux pour créer de nouveaux groupes d'utilisateurs. C'est un outil essentiel pour la gestion des permissions et l'accès aux ressources partagées dans un environnement multi-utilisateurs.

## Syntaxe de Base

```bash
sudo groupadd [options] nom_du_groupe
```

L'utilisation de `sudo` est requise pour obtenir les privilèges nécessaires à la création de groupes.

## Options Principales

Voici les options les plus couramment utilisées avec `groupadd` :

### `-f`, `--force`

Cette option force la commande à exécuter sans renvoyer d'erreur si le groupe spécifié existe déjà. Cependant, cela ne modifie pas les propriétés d'un groupe existant.

```bash
sudo groupadd -f nom_du_groupe
```

### `-g`, `--gid GID`

Permet de spécifier l'identifiant numérique du groupe (GID). Par défaut, `groupadd` choisit automatiquement le prochain GID disponible.

```bash
sudo groupadd -g 1234 nom_du_groupe
```

### `-o`, `--non-unique`

Autorise la création d'un groupe avec un GID déjà utilisé par un autre groupe, en combinaison avec l'option `-g`.

```bash
sudo groupadd -o -g 1234 nom_du_groupe
```

### `-r`, `--system`

Crée un groupe système. Les groupes système utilisent souvent des GID inférieurs à une valeur prédéfinie et sont destinés aux besoins du système plutôt qu'à ceux des utilisateurs.

```bash
sudo groupadd -r nom_du_groupe
```

### `-K`, `--key KEY=VALUE`

Change la valeur d'une option de configuration spécifique. Cette option permet d'ajuster les paramètres par défaut de `groupadd`, tels que le GID minimum et maximum.

```bash
sudo groupadd -K GID_MIN=10000 nom_du_groupe
```

### `-p`, `--password MOT_DE_PASSE`

Définit le mot de passe du nouveau groupe. Cependant, cette option est rarement utilisée car les mots de passe de groupe ne sont pas une pratique courante de gestion de la sécurité sous Linux.


## Création d'un Nouveau Groupe

### Exemple Simple

Créer un groupe standard :

```bash
sudo groupadd mesutilisateurs
```

### Utilisation Pratique

#### Créer un groupe standard

```bash
sudo groupadd groupe1
```

#### Créer un groupe système avec un GID spécifique

```bash
sudo groupadd -r -g 999 groupe_système
```

### Exemple avec un GID Spécifique

Créer un groupe avec un GID spécifique :

```bash
sudo groupadd -g 10000 groupeprojets
```

### Créer un groupe avec un GID non unique

Supposons que vous avez besoin d'un groupe `groupe2` avec le même GID que `groupe1` pour des besoins de compatibilité :

1. Trouvez le GID de `groupe1` :
   
   ```bash
   getent group groupe1
   ```

2. Utilisez le GID trouvé avec `groupadd` pour `groupe2` :

   ```bash
   sudo groupadd -o -g [GID trouvé] groupe2
   ```


## Bonnes Pratiques

- **Nommer clairement les groupes** : Choisissez des noms de groupes qui reflètent clairement leur but ou les utilisateurs qu'ils contiennent.
- **Utiliser des GID système pour les services** : Pour les groupes associés à des services ou des tâches système, utilisez l'option `-r` pour créer des groupes système.
- **Éviter les GID non uniques** : Sauf besoin spécifique, évitez de créer des groupes avec des GID non uniques pour prévenir les confusions dans la gestion des permissions.

## Gestion des Groupes

Après la création d'un groupe, vous pouvez y ajouter des utilisateurs avec `usermod` ou `gpasswd`, et gérer les permissions de fichiers et répertoires en fonction de l'appartenance au groupe.

- **Ajouter un utilisateur à un groupe** :

  ```bash
  sudo usermod -aG nom_du_groupe nom_utilisateur
  ```

- **Lister les membres d'un groupe** :

  Pour voir qui appartient à un groupe, consultez le fichier `/etc/group` ou utilisez `getent group nom_du_groupe`.

### Conseils

- **Préférez des GIDs uniques** : Bien que `groupadd` permette des GIDs non uniques avec `-o`, il est généralement préférable d'éviter les conflits en utilisant des GIDs uniques pour chaque groupe.
- **Gestion des groupes système** : Utilisez `-r` pour les groupes destinés aux services système afin de les distinguer des groupes d'utilisateurs.
- **Planification des GIDs** : Pour les environnements avec de nombreuses exigences de groupe, planifiez à l'avance l'attribution des GIDs pour maintenir l'organisation et éviter les conflits.

La commande `groupadd` est un outil puissant pour la gestion des groupes sur Linux, offrant aux administrateurs système la flexibilité nécessaire pour maintenir la sécurité et l'organisation des accès utilisateurs.

## Conclusion

La commande `groupadd` est un outil fondamental pour structurer l'accès aux ressources partagées sur un système Linux. En séparant les utilisateurs en groupes, vous pouvez simplifier la gestion des permissions et améliorer la sécurité de votre système. Utilisez `groupadd` judicieusement pour maintenir votre système organisé et fonctionnel.

---

<!-- File: groupdel.md -->

- [`groupdel`](#groupdel)
  - [Introduction](#introduction)
  - [Syntaxe de Base](#syntaxe-de-base)
  - [Suppression d'un Groupe](#suppression-dun-groupe)
  - [Points Importants](#points-importants)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Considérations Spéciales](#considérations-spéciales)
  - [Conclusion](#conclusion)


# `groupdel`

## Introduction

La commande `groupdel` est utilisée sur les systèmes d'exploitation Linux pour supprimer des groupes d'utilisateurs. Cet outil simplifie la gestion des groupes en permettant aux administrateurs système de retirer des groupes qui ne sont plus nécessaires, aidant ainsi à maintenir un environnement système propre et organisé.

## Syntaxe de Base

La syntaxe pour utiliser `groupdel` est :

```bash
sudo groupdel nom_du_groupe
```

L'utilisation de `sudo` est nécessaire pour obtenir les privilèges requis pour supprimer des groupes.

## Suppression d'un Groupe

Pour supprimer un groupe, il suffit d'utiliser la commande `groupdel` suivie du nom du groupe à supprimer. Par exemple, pour supprimer un groupe appelé `mesutilisateurs`, exécutez :

```bash
sudo groupdel mesutilisateurs
```

## Points Importants

- **Groupes Système** : Faites attention lorsque vous supprimez des groupes système. La suppression de groupes essentiels peut affecter le fonctionnement de votre système.
- **Vérification** : Avant de supprimer un groupe, assurez-vous qu'aucun fichier ou processus n'est associé à ce groupe. Vous pouvez utiliser la commande `find` pour rechercher des fichiers appartenant au groupe :

  ```bash
  find / -group nom_du_groupe
  ```

- **Membres du Groupe** : `groupdel` ne supprimera pas le groupe s'il contient encore des membres. Assurez-vous que tous les utilisateurs ont été retirés du groupe avant de tenter de le supprimer.

## Bonnes Pratiques

- **Audit régulier** : Faites des audits réguliers des groupes sur votre système pour identifier et supprimer les groupes qui ne sont plus utilisés ou nécessaires.
- **Documentation** : Tenez à jour une documentation des groupes sur votre système, incluant leur but et les membres, pour faciliter la maintenance et l'audit.
- **Backup** : Avant de procéder à des modifications critiques telles que la suppression de groupes, assurez-vous d'avoir des sauvegardes récentes de votre système.

## Considérations Spéciales

La suppression de groupes utilisés par des services ou des applications peut entraîner des dysfonctionnements. Vérifiez toujours les dépendances et l'impact potentiel avant de supprimer un groupe.

## Conclusion

La commande `groupdel` est un outil puissant pour les administrateurs système, permettant une gestion efficace des groupes d'utilisateurs sur un système Linux. Sa simplicité d'utilisation facilite la maintenance des groupes et aide à assurer un environnement système sécurisé et organisé. Comme pour toute modification du système, une prudence et une vérification sont conseillées pour éviter des impacts involontaires sur le fonctionnement du système.

---

<!-- File: id.md -->

# `id` sous Linux

## Introduction

La commande `id` sous Linux est un outil indispensable pour les administrateurs système et les utilisateurs avancés. Elle fournit des informations précieuses sur les identifiants d'utilisateurs et de groupes, y compris les UID (User ID), GID (Group ID), et les groupes auxquels un utilisateur appartient.

## Utilisation de Base de `id`

### Syntaxe

```bash
id [options] [nom_utilisateur]
```

- Si aucun `nom_utilisateur` n'est spécifié, `id` affiche les informations pour l'utilisateur courant.

### Exemples

1. **Afficher les Informations de l'Utilisateur Courant** :
   ```bash
   id
   ```
   Cela affichera l'UID, le GID, et les groupes pour l'utilisateur actuellement connecté.

2. **Afficher les Informations d'un Autre Utilisateur** :
   ```bash
   id nom_utilisateur
   ```
   Remplacez `nom_utilisateur` par le nom de l'utilisateur dont vous souhaitez voir les informations.

## Options Communes

### `-u`, `--user`

Affiche uniquement l'UID de l'utilisateur.

```bash
id -u [nom_utilisateur]
```

### `-g`, `--group`

Affiche uniquement le GID primaire de l'utilisateur.

```bash
id -g [nom_utilisateur]
```

### `-G`, `--groups`

Affiche tous les GID des groupes auxquels l'utilisateur appartient.

```bash
id -G [nom_utilisateur]
```

### `-n`, `--name`

Utilisé avec `-u`, `-g`, ou `-G` pour afficher les noms au lieu des numéros ID.

```bash
id -un
```

Affiche le nom de l'utilisateur correspondant à l'UID.

## Scénarios d'Utilisation

### 1. Scripting et Automatisation

La commande `id` est souvent utilisée dans des scripts pour déterminer si un script est exécuté avec les privilèges root ou pour obtenir dynamiquement l'ID ou les groupes d'un utilisateur. Cela peut être crucial pour des scripts qui nécessitent des modifications de fichiers ou des opérations qui dépendent de l'appartenance à certains groupes.

### 2. Diagnostic et Dépannage

`id` peut aider à diagnostiquer des problèmes liés aux permissions. Par exemple, si un utilisateur ne peut pas accéder à un fichier ou un répertoire, vérifier si l'utilisateur et le groupe ont les permissions appropriées à l'aide de `id` peut être un premier pas utile.

### 3. Gestion des Utilisateurs et des Groupes

Les administrateurs système utilisent `id` pour vérifier les résultats des commandes de gestion des utilisateurs (`useradd`, `usermod`) et des groupes (`groupadd`, `groupmod`), s'assurant ainsi que les modifications ont été appliquées correctement.

## Conclusion

La commande `id` est un outil compact mais puissant qui fournit des informations essentielles sur les utilisateurs et les groupes dans un système Linux. Sa simplicité d'utilisation, combinée à la richesse des informations fournies, en fait un outil incontournable pour toute personne travaillant de près ou de loin avec la gestion des utilisateurs et des permissions sous Linux.

---

<!-- File: su.md -->

# `su`

## Introduction

La commande `su` (substitute user) est un outil de ligne de commande sous Unix et Linux utilisé pour changer l'identité de l'utilisateur au sein d'une session de terminal. C'est un moyen efficace pour les administrateurs système de basculer entre différents comptes d'utilisateurs sans se déconnecter et se reconnecter.

## Syntaxe

La syntaxe générale de `su` est :

```bash
su [options] [nom_utilisateur [-c 'commande']]
```

## Options Principales

- `-`, `-l`, `--login` : Lance un shell de connexion pour l'utilisateur, ce qui signifie que l'environnement sera celui de l'utilisateur cible, comme si vous vous étiez connecté directement à cet utilisateur.
  
- `-c`, `--command commande` : Exécute une commande spécifiée comme l'utilisateur cible, puis retourne au shell original.

- `-m`, `-p`, `--preserve-environment` : Préserve l'environnement du shell actuel lors du passage à l'utilisateur cible.

- `-s`, `--shell SHELL` : Exécute le shell spécifié au lieu de celui par défaut de l'utilisateur cible.

- `-h`, `--help` : Affiche l'aide et quitte.

- `--version` : Affiche les informations de version et quitte.

## Comment Utiliser `su`

### Basculer vers un autre utilisateur

Pour changer d'utilisateur dans votre terminal, tapez simplement `su` suivi du nom de l'utilisateur vers lequel vous souhaitez basculer :

```bash
su nom_utilisateur
```

### Exécuter une commande en tant qu'autre utilisateur

Pour exécuter une commande unique en tant qu'un autre utilisateur et revenir immédiatement à votre shell d'origine :

```bash
su nom_utilisateur -c 'commande'
```

### Utiliser un shell de connexion

Pour charger l'environnement complet, y compris le répertoire personnel et les variables d'environnement de l'utilisateur cible :

```bash
su - nom_utilisateur
```

Ou :

```bash
su -l nom_utilisateur
```

### Préserver l'environnement

Si vous souhaitez garder votre environnement actuel et passer à un autre utilisateur :

```bash
su -m nom_utilisateur
```

### Changer de shell

Pour spécifier un shell différent lors du changement d'utilisateur :

```bash
su nom_utilisateur -s /bin/sh
```

## Exemples d'Utilisation de `su`

1. **Basculer vers l'utilisateur root** :

   ```bash
   su
   ```

2. **Exécuter une commande spécifique en tant qu'utilisateur root** :

   ```bash
   su -c 'apt update'
   ```

3. **Basculer vers l'utilisateur root et utiliser bash comme shell** :

   ```bash
   su -s /bin/bash
   ```

4. **Exécuter un script shell en tant qu'un autre utilisateur** :

   ```bash
   su nom_utilisateur -c '/chemin/vers/script.sh'
   ```

5. **Ouvrir un shell interactif pour un autre utilisateur sans charger son environnement** :

   ```bash
   su nom_utilisateur
   ```

6. **Ouvrir un shell interactif pour un autre utilisateur en chargeant son environnement complet** :

   ```bash
   su - nom_utilisateur
   ```

## Conclusion

La commande `su` est un outil puissant pour la gestion des sessions utilisateur sur des systèmes Unix et Linux. Elle offre une grande flexibilité pour les administrateurs système et les utilisateurs avancés, leur permettant de basculer entre les comptes, d'exécuter des commandes en tant que différents utilisateurs, et de gérer les environnements de travail de manière sécurisée et efficace. En maîtrisant `su`, vous pouvez facilement naviguer entre les différents utilisateurs de votre système, améliorant ainsi votre productivité et votre gestion du système.

---

<!-- File: useradd.md -->



- [`useradd`](#useradd)
  - [Syntaxe](#syntaxe)
  - [Options principales](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Création d'un utilisateur standard sans options spécifiqu](#1-création-dun-utilisateur-standard-sans-options-spécifiqu)
  - [2. Création d'un utilisateur avec un répertoire personnel spécifique](#2-création-dun-utilisateur-avec-un-répertoire-personnel-spécifique)
  - [3. Création d'un utilisateur et création de son répertoire personnel si celui-ci n'existe pas](#3-création-dun-utilisateur-et-création-de-son-répertoire-personnel-si-celui-ci-nexiste-pas)
  - [4. Création d'un utilisateur avec un shell spécifique](#4-création-dun-utilisateur-avec-un-shell-spécifique)
  - [5. Création d'un utilisateur avec un GID spécifique](#5-création-dun-utilisateur-avec-un-gid-spécifique)
  - [6. Ajout d'un utilisateur à des groupes supplémentaires](#6-ajout-dun-utilisateur-à-des-groupes-supplémentaires)
  - [7. Création d'un utilisateur avec un UID spécifique](#7-création-dun-utilisateur-avec-un-uid-spécifique)
  - [8. Définition d'une date d'expiration pour le compte](#8-définition-dune-date-dexpiration-pour-le-compte)
  - [9. Définition du nombre de jours d'inactivité après expiration du mot de passe](#9-définition-du-nombre-de-jours-dinactivité-après-expiration-du-mot-de-passe)
  - [10. Création d'un utilisateur avec un mot de passe initial (à utiliser avec prudence)](#10-création-dun-utilisateur-avec-un-mot-de-passe-initial-à-utiliser-avec-prudence)
- [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
  - [1. **Création d'un nouvel employé dans le système**:](#1-création-dun-nouvel-employé-dans-le-système)
  - [2. **Ajout d'un utilisateur pour un service spécifique sans répertoire personnel**:](#2-ajout-dun-utilisateur-pour-un-service-spécifique-sans-répertoire-personnel)
  - [3. **Configuration d'un compte utilisateur temporaire**:](#3-configuration-dun-compte-utilisateur-temporaire)
  - [4. **Création d'un utilisateur pour des tests avec un UID et GID spécifiques**:](#4-création-dun-utilisateur-pour-des-tests-avec-un-uid-et-gid-spécifiques)
- [Cas d'utilisation supplémentaires pour `useradd`](#cas-dutilisation-supplémentaires-pour-useradd)
  - [1. **Création d'un compte pour un nouvel employé avec configuration complète**:](#1-création-dun-compte-pour-un-nouvel-employé-avec-configuration-complète)
  - [2. **Ajout d'un utilisateur système pour une application**:](#2-ajout-dun-utilisateur-système-pour-une-application)
  - [3. **Configuration d'un compte utilisateur avec expiration**:](#3-configuration-dun-compte-utilisateur-avec-expiration)
  - [4. **Création d'un compte avec un UID spécifique**:](#4-création-dun-compte-avec-un-uid-spécifique)
  - [5. **Ajout d'un compte sans répertoire personnel**:](#5-ajout-dun-compte-sans-répertoire-personnel)
  - [6. **Configuration d'un compte avec un shell spécifique**:](#6-configuration-dun-compte-avec-un-shell-spécifique)
  - [7. **Création d'un compte avec un mot de passe prédéfini**:](#7-création-dun-compte-avec-un-mot-de-passe-prédéfini)
  - [8. **Création d'un compte pour un utilisateur avec des groupes supplémentaires**:](#8-création-dun-compte-pour-un-utilisateur-avec-des-groupes-supplémentaires)
  - [9. **Création d'un compte qui empêche l'utilisateur de se connecter au serveur et répertoire home**:](#9-création-dun-compte-qui-empêche-lutilisateur-de-se-connecter-au-serveur-et-répertoire-home)



La commande `useradd` est une commande de base dans les systèmes Unix et Linux, utilisée pour créer un nouvel utilisateur sur le système. Elle permet de configurer les paramètres initiaux d'un compte utilisateur, tels que le répertoire personnel, le shell de connexion, et le groupe d'utilisateurs.

# `useradd`

## Syntaxe
```
useradd [options] USERNAME
```

## Options principales

- `-d, --home HOME_DIR`: Spécifie le répertoire personnel de l'utilisateur à créer. Si cette option n'est pas utilisée, un répertoire par défaut sera créé selon la configuration du système (souvent `/home/USERNAME`).
- `-m, --create-home`: Crée le répertoire personnel de l'utilisateur s'il n'existe pas déjà.
- `-s, --shell SHELL`: Définit le shell de l'utilisateur. Si cette option n'est pas spécifiée, le shell par défaut défini dans `/etc/default/useradd` ou `/etc/login.defs` sera utilisé.
- `-g, --gid GROUP`: Spécifie le groupe initial de l'utilisateur. Ce peut être soit un nom de groupe soit un numéro d'identifiant de groupe (GID).
- `-G, --groups GROUPS`: Liste de groupes supplémentaires auxquels l'utilisateur sera ajouté. Les groupes sont séparés par des virgules sans espaces.
- `-u, --uid UID`: Définit l'identifiant de l'utilisateur (UID). Si cette option n'est pas utilisée, un UID unique est automatiquement attribué.
- `-e, --expiredate EXPIRE_DATE`: Définit la date d'expiration du compte. Le format doit être AAAA-MM-JJ.
- `-f, --inactive INACTIVE`: Nombre de jours après l'expiration du mot de passe pendant lesquels le compte sera considéré comme inactif et sera désactivé.
- `-p, --password PASSWORD`: Utilisez cette option avec prudence, car exécuter cette commande avec une option visible dans l'historique du shell peut être un risque de sécurité. Il est recommandé de configurer le mot de passe après la création du compte à l'aide de la commande `passwd`.

# Exemples d'utilisation

## 1. Création d'un utilisateur standard sans options spécifiqu
   ```bash
   useradd username
   ```
   
## 2. Création d'un utilisateur avec un répertoire personnel spécifique
   ```bash
   useradd -d /opt/username username
   ```
   
## 3. Création d'un utilisateur et création de son répertoire personnel si celui-ci n'existe pas
   ```bash
   useradd -m username
   ```
   
## 4. Création d'un utilisateur avec un shell spécifique
   ```bash
   useradd -s /bin/zsh username
   ```
   
## 5. Création d'un utilisateur avec un GID spécifique
   ```bash
   useradd -g users username
   ```
   
## 6. Ajout d'un utilisateur à des groupes supplémentaires
   ```bash
   useradd -G wheel,sudo username
   ```
   
## 7. Création d'un utilisateur avec un UID spécifique
   ```bash
   useradd -u 1001 username
   ```
   
## 8. Définition d'une date d'expiration pour le compte
   ```bash
   useradd -e 2024-12-31 username
   ```
   
## 9. Définition du nombre de jours d'inactivité après expiration du mot de passe
   ```bash
   useradd -f 30 username
   ```
   
## 10. Création d'un utilisateur avec un mot de passe initial (à utiliser avec prudence)
    ```bash
    useradd -p $(openssl passwd -crypt 'password') username
    ```

# Cas d'utilisation de la fonction

## 1. **Création d'un nouvel employé dans le système**:
   ```bash
   useradd -m -s /bin/bash -g staff -G sudo,developers newemployee
   ```
   
## 2. **Ajout d'un utilisateur pour un service spécifique sans répertoire personnel**:
   ```bash
   useradd -r -s /usr/sbin/nologin serviceuser
   ```
   
## 3. **Configuration d'un compte utilisateur temporaire**:
   ```bash
   useradd -m -e 2024-06-30 -s /bin/bash tempuser
   ```
   
## 4. **Création d'un utilisateur pour des tests avec un UID et GID spécifiques**:
   ```bash
   useradd -u 2001 -g testgroup testuser
   ```

Voici des cas d'utilisation supplémentaires pour `useradd`, illustrant comment cette commande peut être employée pour répondre à différents besoins lors de la création de comptes utilisateurs sur des systèmes Unix et Linux.

# Cas d'utilisation supplémentaires pour `useradd`

## 1. **Création d'un compte pour un nouvel employé avec configuration complète**:
   Lors de l'ajout d'un nouvel employé au système, il peut être nécessaire de configurer son compte avec un répertoire personnel, un shell spécifique, et de l'ajouter à des groupes pertinents.
   ```bash
   useradd -m -s /bin/bash -g staff -G developers,marketing newemployee
   ```
   Cela crée un compte pour `newemployee`, avec un répertoire personnel, le shell Bash, et l'ajoute aux groupes `staff`, `developers`, et `marketing`.

## 2. **Ajout d'un utilisateur système pour une application**:
   Les applications peuvent nécessiter des comptes système spécifiques sans accès shell pour des questions de sécurité.
   ```bash
   useradd -r -s /usr/sbin/nologin -d /opt/appdir appuser
   ```
   Ceci crée un compte système `appuser` sans accès shell et avec `/opt/appdir` comme répertoire personnel.

## 3. **Configuration d'un compte utilisateur avec expiration**:
   Pour un stagiaire ou un collaborateur temporaire, il peut être pratique de définir une date d'expiration pour le compte dès sa création.
   ```bash
   useradd -m -e 2024-12-31 tempuser
   ```
   Cela crée un compte pour `tempuser` qui expirera automatiquement à la fin de l'année 2024.

## 4. **Création d'un compte avec un UID spécifique**:
   Dans certains cas, il peut être nécessaire d'attribuer un UID spécifique à un utilisateur pour des besoins de compatibilité ou de sécurité.
   ```bash
   useradd -u 1050 specificuser
   ```
   Ceci crée un compte `specificuser` avec l'UID 1050.

## 5. **Ajout d'un compte sans répertoire personnel**:
   Certains comptes, en particulier ceux destinés à l'exécution de tâches spécifiques, n'ont pas besoin de répertoire personnel.
   ```bash
   useradd -M noroomuser
   ```
   Cela crée un compte `noroomuser` sans répertoire personnel.

## 6. **Configuration d'un compte avec un shell spécifique**:
   Pour les utilisateurs qui préfèrent ou nécessitent un shell différent de celui par défaut du système.
   ```bash
   useradd -m -s /usr/bin/zsh zshuser
   ```
   Cela crée un compte `zshuser` avec Zsh comme shell de connexion.

## 7. **Création d'un compte avec un mot de passe prédéfini**:
   Pour automatiser la création de comptes, il peut être utile de définir un mot de passe dès la création. Cependant, cette pratique n'est pas recommandée pour des raisons de sécurité; il est préférable de définir le mot de passe après la création du compte.
   ```bash
   useradd -m -p $(openssl passwd -crypt 'password') predefuser
   ```
   Note : Cette méthode expose le mot de passe dans l'historique des commandes. Il est préférable d'utiliser `passwd` après la création du compte pour définir ou changer le mot de passe.

## 8. **Création d'un compte pour un utilisateur avec des groupes supplémentaires**:
   Pour les utilisateurs qui doivent appartenir à plusieurs groupes dès la création de leur compte.
   ```bash
   useradd -m -G wheel,developers multiuser
   ```
   Cela crée un compte `multiuser` et l'ajoute aux groupes `wheel` et `developers`.

## 9. **Création d'un compte qui empêche l'utilisateur de se connecter au serveur et répertoire home**:
   Pour cela, utilisez la commande `useradd` avec l'option `-r` (qui crée un compte système) et l'option `-s /usr/sbin/nologin` (qui empêche l'utilisateur de se connecter au serveur). Vous pouvez aussi utiliser l'option `-M` pour ne pas créer de répertoire home, si ce n'est pas nécessaire.

      ```bash
      sudo useradd -r -s /usr/sbin/nologin -M nom_utilisateur
      ```

Chacun de ces cas d'utilisation montre comment `useradd` peut être utilisé de manière flexible pour répondre aux exigences variées de gestion des comptes utilisateurs, de la création de comptes basiques à des configurations plus complexes et spécifiques.

---

<!-- File: usermod.md -->


- [Documentation de la fonction `usermod`](#documentation-de-la-fonction-usermod)
  - [Syntaxe](#syntaxe)
  - [Options principales](#options-principales)
  - [Options de `usermod`](#options-de-usermod)
    - [`-c` , `--comment COMMENT`](#-c----comment-comment)
    - [`-d` , `--home RÉPERTOIRE`](#-d----home-répertoire)
    - [`-e` , `--expiredate DATE`](#-e----expiredate-date)
    - [`-f` , `--inactive JOURS`](#-f----inactive-jours)
    - [`-g` , `--gid GROUPE`](#-g----gid-groupe)
    - [`-G` , `--groups GROUPES`](#-g----groups-groupes)
    - [`-l` , `--login NOUVEAU_NOM`](#-l----login-nouveau_nom)
    - [`-L` , `--lock`](#-l----lock)
    - [`-m` , `--move-home`](#-m----move-home)
    - [`-p` , `--password MOT_DE_PASSE`](#-p----password-mot_de_passe)
    - [`-s` , `--shell INTERPRÉTEUR`](#-s----shell-interpréteur)
    - [`-U` , `--unlock`](#-u----unlock)
    - [`-u` , `--uid UID`](#-u----uid-uid)
    - [`-o`, `--non-unique`](#-o---non-unique)
    - [`-Z`, `--selinux-user` SELinux\_USER](#-z---selinux-user-selinux_user)
  - [Exemples d'utilisation](#exemples-dutilisation)
    - [1. Changer le répertoire personnel de l'utilisateur et déplacer le contenu](#1-changer-le-répertoire-personnel-de-lutilisateur-et-déplacer-le-contenu)
    - [2. Changer le shell de connexion de l'utilisateur](#2-changer-le-shell-de-connexion-de-lutilisateur)
    - [3. Changer le groupe primaire de l'utilisateur](#3-changer-le-groupe-primaire-de-lutilisateur)
    - [4. Ajouter l'utilisateur à des groupes supplémentaires sans retirer les groupes existants](#4-ajouter-lutilisateur-à-des-groupes-supplémentaires-sans-retirer-les-groupes-existants)
    - [5. Changer l'UID de l'utilisateur](#5-changer-luid-de-lutilisateur)
    - [6. Verrouiller le compte d'un utilisateur](#6-verrouiller-le-compte-dun-utilisateur)
    - [7. Déverrouiller le compte d'un utilisateur](#7-déverrouiller-le-compte-dun-utilisateur)
    - [8. Définir une date d'expiration pour le compte utilisateur](#8-définir-une-date-dexpiration-pour-le-compte-utilisateur)
    - [9. Modifier le nombre de jours d'inactivité après expiration du mot de passe](#9-modifier-le-nombre-de-jours-dinactivité-après-expiration-du-mot-de-passe)
    - [10. Retirer l'utilisateur de tous les groupes sauf le groupe primaire](#10-retirer-lutilisateur-de-tous-les-groupes-sauf-le-groupe-primaire)
  - [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
    - [1. Mise à jour du shell par défaut pour un utilisateur](#1-mise-à-jour-du-shell-par-défaut-pour-un-utilisateur)
    - [2. Changement de groupe primaire lors de la réorganisation des équipes](#2-changement-de-groupe-primaire-lors-de-la-réorganisation-des-équipes)
    - [3. Sécurisation d'un compte après le départ d'un employé](#3-sécurisation-dun-compte-après-le-départ-dun-employé)
    - [4. Correction de l'UID d'un utilisateur après une mauvaise création](#4-correction-de-luid-dun-utilisateur-après-une-mauvaise-création)
    - [5. Ajout d'un utilisateur à des groupes supplémentaires pour accorder des permissions spécifiques](#5-ajout-dun-utilisateur-à-des-groupes-supplémentaires-pour-accorder-des-permissions-spécifiques)
    - [6. Migration d'un utilisateur vers un nouveau répertoire personnel](#6-migration-dun-utilisateur-vers-un-nouveau-répertoire-personnel)
    - [7. Modification du nom de connexion d'un utilisateur](#7-modification-du-nom-de-connexion-dun-utilisateur)
    - [8. Activation d'un compte expiré](#8-activation-dun-compte-expiré)
    - [9. Mise à jour des groupes d'un utilisateur après une promotion](#9-mise-à-jour-des-groupes-dun-utilisateur-après-une-promotion)
    - [10. Restauration des paramètres par défaut d'un utilisateur](#10-restauration-des-paramètres-par-défaut-dun-utilisateur)
    - [11. Verrouillage d'un compte pour maintenance](#11-verrouillage-dun-compte-pour-maintenance)
    - [12. Changement des propriétés d'un compte système](#12-changement-des-propriétés-dun-compte-système)
  - [Conseils d'Utilisation](#conseils-dutilisation)


# Documentation de la fonction `usermod`
La commande `usermod` est utilisée pour modifier les paramètres d'un compte utilisateur existant sur les systèmes Unix et Linux. Elle offre une grande variété d'options pour ajuster les détails d'un compte utilisateur après sa création.

## Syntaxe
```
usermod [options] LOGIN
```

## Options principales

- `-d, --home HOME_DIR`: Change le répertoire personnel de l'utilisateur. L'option `-m` peut être utilisée conjointement pour déplacer le contenu vers le nouveau répertoire.
- `-m, --move-home`: Déplace le contenu du répertoire personnel de l'utilisateur vers le nouveau répertoire spécifié par `-d`.
- `-s, --shell SHELL`: Change le shell de connexion de l'utilisateur.
- `-g, --gid GROUP`: Change le groupe primaire de l'utilisateur. Ce peut être le nom ou le GID du groupe.
- `-G, --groups GROUPS`: Change la liste des groupes auxquels l'utilisateur appartient. Les groupes sont séparés par des virgules, sans espaces intercalaires. Si cette option est utilisée avec `-a`, l'utilisateur est ajouté aux groupes supplémentaires sans être retiré des autres.
- `-a, --append`: Utilisé avec `-G` pour ajouter l'utilisateur aux groupes supplémentaires sans le retirer des groupes existants.
- `-u, --uid UID`: Change l'UID de l'utilisateur. Attention, cela peut affecter la propriété des fichiers.
- `-L, --lock`: Verrouille le compte de l'utilisateur en désactivant son mot de passe.
- `-U, --unlock`: Déverrouille le compte de l'utilisateur.
- `-e, --expiredate EXPIRE_DATE`: Change la date d'expiration du compte. Le format doit être AAAA-MM-JJ.
- `-f, --inactive INACTIVE`: Change le nombre de jours après l'expiration du mot de passe pendant lesquels le compte est considéré comme inactif et sera désactivé.

## Options de `usermod`

### `-c` , `--comment COMMENT`
- Modifie le champ de commentaire de l'utilisateur, souvent utilisé pour stocker des informations supplémentaires telles que le nom complet de l'utilisateur.
  
  ```bash
  sudo usermod -c "John Doe" nom_utilisateur
  ```

### `-d` , `--home RÉPERTOIRE`
- Change le répertoire personnel de l'utilisateur. Utilisez `-m` avec cette option pour déplacer le contenu de l'ancien répertoire vers le nouveau.
  
  ```bash
  sudo usermod -d /nouveau/chemin nom_utilisateur
  ```

### `-e` , `--expiredate DATE`
- Définit ou modifie la date d'expiration du compte. La DATE doit être au format `AAAA-MM-JJ`.
  
  ```bash
  sudo usermod -e 2025-12-31 nom_utilisateur
  ```

### `-f` , `--inactive JOURS`
- Fixe le nombre de jours après l'expiration du mot de passe durant lesquels le compte est considéré comme inactif et sera désactivé. Un nombre négatif désactive cette fonctionnalité.
  
  ```bash
  sudo usermod -f 30 nom_utilisateur
  ```

### `-g` , `--gid GROUPE`
- Change le groupe principal de l'utilisateur. Le GROUPE peut être spécifié par son nom ou son numéro GID.
  
  ```bash
  sudo usermod -g nouveau_groupe nom_utilisateur
  ```

### `-G` , `--groups GROUPES`
- Affecte l'utilisateur aux groupes supplémentaires. Utilisez `-a` pour ajouter l'utilisateur aux groupes sans le retirer des autres.
  
  ```bash
  sudo usermod -aG groupe1,groupe2 nom_utilisateur
  ```

### `-l` , `--login NOUVEAU_NOM`
- Change le nom de connexion (username) de l'utilisateur.
  
  ```bash
  sudo usermod -l nouveau_nom nom_utilisateur
  ```

### `-L` , `--lock`
- Verrouille le compte utilisateur en désactivant son mot de passe.
  
  ```bash
  sudo usermod -L nom_utilisateur
  ```

### `-m` , `--move-home`
- Utilisé avec `-d` pour déplacer le contenu du répertoire personnel vers le nouveau répertoire.
  
  ```bash
  sudo usermod -m -d /nouveau/chemin nom_utilisateur
  ```

### `-p` , `--password MOT_DE_PASSE`
- Change le mot de passe de l'utilisateur. Il est recommandé d'utiliser `passwd` pour changer le mot de passe au lieu de cette option.
  
  ```bash
  sudo passwd nom_utilisateur
  ```

### `-s` , `--shell INTERPRÉTEUR`
- Change le shell de connexion de l'utilisateur.
  
  ```bash
  sudo usermod -s /bin/zsh nom_utilisateur
  ```

### `-U` , `--unlock`
- Déverrouille le compte utilisateur en réactivant son mot de passe.
  
  ```bash
  sudo usermod -U nom_utilisateur
  ```

### `-u` , `--uid UID`
- Change l'identifiant numérique de l'utilisateur (UID). Utilisé pour des raisons de compatibilité ou d'administration.
  
  ```bash
  sudo usermod -u 1001 nom_utilisateur
  ```
### `-o`, `--non-unique`
- Permet de spécifier un UID (`--uid`) non unique en combinaison avec l'option `-u`. Cela permet d'avoir plusieurs utilisateurs avec le même UID, ce qui est généralement déconseillé pour des raisons de sécurité et de clarté.

  ```bash
  sudo usermod -o -u 1001 nom_utilisateur
  ```

### `-Z`, `--selinux-user` SELinux_USER
- Change le contexte utilisateur SELinux de l'utilisateur. Cette option est spécifique aux systèmes qui utilisent SELinux.

  ```bash
  sudo usermod -Z nouveau_contexte_selinux nom_utilisateur
  ```

- **Gestion SELinux** : Pour les systèmes avec SELinux activé, la gestion correcte des contextes utilisateur SELinux est cruciale pour maintenir l'accès aux ressources et la sécurité du système. L'option `-Z` est essentielle dans ces environnements.

## Exemples d'utilisation

### 1. Changer le répertoire personnel de l'utilisateur et déplacer le contenu
   ```bash
   usermod -d /new/home/dir -m username
   ```
   
### 2. Changer le shell de connexion de l'utilisateur
   ```bash
   usermod -s /bin/zsh username
   ```
   
### 3. Changer le groupe primaire de l'utilisateur
   ```bash
   usermod -g newgroup username
   ```
   
### 4. Ajouter l'utilisateur à des groupes supplémentaires sans retirer les groupes existants
   ```bash
   usermod -aG sudo,staff username
   ```
   
### 5. Changer l'UID de l'utilisateur
   ```bash
   usermod -u 1002 username
   ```
   
### 6. Verrouiller le compte d'un utilisateur
   ```bash
   usermod -L username
   ```
   
### 7. Déverrouiller le compte d'un utilisateur
   ```bash
   usermod -U username
   ```
   
### 8. Définir une date d'expiration pour le compte utilisateur
   ```bash
   usermod -e 2024-12-31 username
   ```
   
### 9. Modifier le nombre de jours d'inactivité après expiration du mot de passe
   ```bash
   usermod -f 30 username
   ```
   
### 10. Retirer l'utilisateur de tous les groupes sauf le groupe primaire
    ```bash
    usermod -G "" username
    ```

## Cas d'utilisation de la fonction

### 1. Mise à jour du shell par défaut pour un utilisateur
   ```bash
   usermod -s /bin/fish username
   ```

### 2. Changement de groupe primaire lors de la réorganisation des équipes
   ```bash
   usermod -g newteamgroup username
   ```

### 3. Sécurisation d'un compte après le départ d'un employé
   ```bash
   usermod -L -e 2024-01-01 username
   ```

### 4. Correction de l'UID d'un utilisateur après une mauvaise création
   ```bash
   usermod -u 1101 username
   ```

### 5. Ajout d'un utilisateur à des groupes supplémentaires pour accorder des permissions spécifiques
   ```bash
   usermod -aG docker,netadmin username
   ```

### 6. Migration d'un utilisateur vers un nouveau répertoire personnel
   Parfois, il peut être nécessaire de déplacer le répertoire personnel d'un utilisateur, par exemple, lors d'une restructuration du système de fichiers ou lors du passage à un nouveau serveur de fichiers.
   ```bash
   usermod -d /newpath/home/username -m username
   ```
   Cela changera le répertoire personnel de l'utilisateur `username` vers `/newpath/home/username` et déplacera également tous les fichiers existants vers le nouveau chemin.

### 7. Modification du nom de connexion d'un utilisateur
   Si un utilisateur a besoin de changer son nom de connexion (ce qui n'est pas directement une fonctionnalité de `usermod`, mais est souvent associé à des opérations de gestion des utilisateurs), il faudrait utiliser `usermod` pour ajuster les paramètres associés, comme le répertoire personnel, après avoir changé le nom d'utilisateur avec `usermod` ou d'autres commandes.
   ```bash
   usermod -l newusername oldusername
   usermod -d /home/newusername -m newusername
   ```
   Notez que `-l` pour changer le nom de l'utilisateur n'est pas une option standard sur tous les systèmes; cette opération peut nécessiter des étapes spécifiques au système.

### 8. Activation d'un compte expiré
   Si un compte utilisateur a été automatiquement désactivé en raison de l'expiration de son mot de passe, vous pouvez le réactiver et définir une nouvelle date d'expiration pour permettre à l'utilisateur de changer son mot de passe.
   ```bash
   usermod -U -e 2025-01-01 username
   ```
   Ceci déverrouille le compte `username` et définit une nouvelle date d'expiration pour encourager l'utilisateur à mettre à jour son mot de passe.

### 9. Mise à jour des groupes d'un utilisateur après une promotion
   Lorsqu'un utilisateur reçoit une promotion ou change de rôle, il peut avoir besoin d'accès à de nouveaux groupes pour ses nouvelles responsabilités.
   ```bash
   usermod -aG admin,projectlead username
   ```
   Cela ajoute l'utilisateur `username` aux groupes `admin` et `projectlead` sans supprimer ses appartenance aux groupes existants.

### 10. Restauration des paramètres par défaut d'un utilisateur
    Si un utilisateur a expérimenté avec différents shells ou répertoires et souhaite revenir à la configuration par défaut du système.
    ```bash
    usermod -s /bin/bash -d /home/username -m username
    ```
    Cela réinitialise le shell de `username` à `/bin/bash` et son répertoire personnel à `/home/username`, déplaçant tout contenu existant si nécessaire.

### 11. Verrouillage d'un compte pour maintenance
    Il peut être nécessaire de verrouiller temporairement un compte utilisateur pendant une maintenance système ou lors de la vérification de problèmes de sécurité.
    ```bash
    usermod -L username
    ```
    Ceci verrouille le compte `username`, empêchant toute connexion jusqu'à ce que le compte soit déverrouillé.

### 12. Changement des propriétés d'un compte système
    Parfois, les comptes système nécessitent des ajustements, comme le changement de groupe primaire ou la désactivation du shell de connexion pour des raisons de sécurité.
    ```bash
    usermod -g nogroup -s /usr/sbin/nologin daemonuser
    ```
    Cela change le groupe primaire de `daemonuser` en `nogroup` et désactive le shell de connexion, renforçant ainsi la sécurité du compte système.

Ces cas d'utilisation démontrent la polyvalence de la commande `usermod` dans la gestion quotidienne des comptes utilisateurs, permettant aux administrateurs système de maintenir des configurations d'utilisateur optimales et sécurisées au fil du temps.

## Conseils d'Utilisation

- Toujours exécuter `usermod` en tant que superutilisateur (root), généralement en précédant la commande de `sudo`.
- Modifier le nom d'utilisateur ou le répertoire personnel peut affecter les processus en cours. Assurez-vous que l'utilisateur n'est pas connecté et qu'aucun de ses processus n'est en cours d'exécution avant d'appliquer ces modifications.
- Lors du changement de groupe principal ou de groupes supplémentaires, vérifiez les permissions des fichiers et répertoires associés pour s'assurer qu'ils correspondent aux nouvelles affiliations de groupe.
- Soyez prudent avec l'option `-u`, car changer l'UID d'un utilisateur peut avoir des implications sur la propriété des fichiers et répertoires. Vous devrez peut-être réaffecter la propriété de certains fichiers man

uellement après un changement d'UID.

La commande `usermod` est un outil puissant pour gérer les comptes utilisateurs sous Linux, offrant une large gamme d'options pour personnaliser l'accès et les propriétés des utilisateurs.

---

<!-- File: utilisateurs.md -->

# la Gestion des Utilisateurs sous Linux

## Introduction

La gestion des utilisateurs est une fonction clé de l'administration système sous Linux. Elle permet de contrôler l'accès aux ressources du système, de sécuriser les données et de personnaliser l'expérience utilisateur. Cela inclut la création, la modification et la suppression de comptes d'utilisateurs, ainsi que la gestion de leurs informations et permissions.

## Gestion des Utilisateurs

### Création d'un Utilisateur

- **`useradd`** : Crée un nouveau compte utilisateur.

  ```bash
  sudo useradd [options] nom_utilisateur
  ```

  Options communes :
  - `-m` : Crée le répertoire personnel de l'utilisateur.
  - `-s` : Spécifie le shell par défaut.
  - `-G` : Ajoute l'utilisateur à des groupes supplémentaires.

- **Définir le mot de passe** : Après la création d'un compte, définissez un mot de passe.

  ```bash
  sudo passwd nom_utilisateur
  ```

### Modification d'un Utilisateur

- **`usermod`** : Modifie les options d'un compte utilisateur existant.

  ```bash
  sudo usermod [options] nom_utilisateur
  ```

  Options communes :
  - `-l` : Change le nom d'utilisateur.
  - `-d` et `-m` : Change le répertoire personnel de l'utilisateur et le déplace.
  - `-s` : Change le shell par défaut de l'utilisateur.
  - `-G` : Change les groupes auxquels l'utilisateur appartient.

### Suppression d'un Utilisateur

- **`userdel`** : Supprime un compte utilisateur.

  ```bash
  sudo userdel [options] nom_utilisateur
  ```

  Options communes :
  - `-r` : Supprime également le répertoire personnel de l'utilisateur et son courrier.

### Gestion des Informations Utilisateur

- **`id`** : Affiche les identifiants utilisateur et groupe pour un utilisateur donné.

  ```bash
  id nom_utilisateur
  ```

- **`whoami`** : Affiche le nom d'utilisateur du compte courant.

  ```bash
  whoami
  ```

- **`su`** : Change l'utilisateur dans le shell actuel.

  ```bash
  su - nom_utilisateur
  ```

## Groupes d'Utilisateurs

Les groupes permettent de gérer les permissions pour un ensemble d'utilisateurs.

- **`groupadd`** : Crée un nouveau groupe.

  ```bash
  sudo groupadd nom_du_groupe
  ```

- **`groupdel`** : Supprime un groupe.

  ```bash
  sudo groupdel nom_du_groupe
  ```

- **`usermod`** : Ajoute un utilisateur à des groupes supplémentaires.

  ```bash
  sudo usermod -a -G groupe1,groupe2 nom_utilisateur
  ```

## Bonnes Pratiques

- **Sécurité des mots de passe** : Assurez-vous que tous les comptes utilisateurs ont des mots de passe forts et uniques.
- **Principe du moindre privilège** : N'accordez des privilèges administratifs qu'aux utilisateurs qui en ont besoin pour leurs tâches.
- **Révision régulière** : Examinez régulièrement les comptes utilisateurs et les permissions pour vous assurer qu'ils sont toujours appropriés.

## Conclusion

La gestion efficace des utilisateurs et des groupes est essentielle pour maintenir la sécurité et l'efficacité d'un système Linux. En comprenant et en utilisant les outils disponibles pour la gestion des utilisateurs, les administrateurs système peuvent s'assurer que chaque utilisateur dispose de l'accès et des ressources nécessaires pour ses tâches, tout en maintenant un environnement système sécurisé et organisé.

---

<!-- File: virtualbux_dossierPartager.md -->

# dossier partager avec virtualbox

1. **Installer les Additions Invité de VirtualBox dans la VM** :
   - Démarrez votre VM.
   - Une fois la VM démarrée, cliquez sur "Périphériques" dans la barre de menu de la fenêtre de la VM.
   - Sélectionnez "Insérer l'image CD des Additions Invité...". Cela monte le CD virtuel des Additions Invité dans votre VM.
   - Dans la VM, exécutez le programme d'installation des Additions Invité. La procédure varie selon le système d'exploitation de la VM. Sur un système Windows, cela devrait se lancer automatiquement. Sur Linux, vous devrez peut-être ouvrir un terminal, naviguer jusqu'au CD monté, et exécuter un script d'installation (par exemple, `sudo ./VBoxLinuxAdditions.run` pour un système Linux).

    Si vous êtes en mode console :
    
    1. **Insérer l'image CD des Additions Invité** :
        - Assurez-vous que l'image CD des Additions Invité est insérée virtuellement dans votre VM comme expliqué précédemment.

    2. **Ouvrir un terminal dans la VM** :
        - Si vous êtes déjà en mode console, vous êtes prêt à passer à l'étape suivante.

    3. **Créer un point de montage pour le CD** (si nécessaire) :

        - Vous pouvez créer un dossier pour monter le CD s'il n'existe pas déjà. Par exemple, vous pouvez créer un dossier appelé `/mnt/cdrom` en exécutant :
            ```bash
            sudo mkdir /mnt/cdrom
            ```

    4. **Monter le CD** :
        - Vous devez monter le CD vers le point de montage que vous avez créé. Vous pouvez le faire avec la commande suivante :
            ```bash
            sudo mount /dev/cdrom /mnt/cdrom
            ```
        - Si `/dev/cdrom` ne fonctionne pas, cela peut être dû à une différence dans le nom du périphérique. Essayez `/dev/sr0` ou vérifiez vos périphériques disponibles avec `ls /dev` pour identifier votre lecteur de CD virtuel.

    5. **Accéder au contenu du CD et installer les Additions Invité** :
        - Changez de répertoire pour accéder au contenu du CD :
            ```bash
            cd /mnt/cdrom
            ```
        - Assurez-vous que le script d'installation est exécutable :
            ```bash
            sudo chmod +x VBoxLinuxAdditions.run
            ```
        - Exécutez le script d'installation des Additions Invité :
            ```bash
            sudo ./VBoxLinuxAdditions.run
            ```


2. **Configurer le partage de dossier** :
   - Avec la VM éteinte (pas en pause ou en sauvegarde d'état), ouvrez les "Paramètres" de la VM dans le gestionnaire VirtualBox.
   - Allez dans l'onglet "Dossiers partagés".
   - Cliquez sur l'icône avec le signe plus sur le côté droit pour ajouter un nouveau dossier partagé.
   - Dans la fenêtre qui s'ouvre, cliquez sur "Dossier Chemin" et choisissez le dossier de votre système hôte que vous souhaitez partager avec la VM.
   - Entrez un "Nom" pour le dossier partagé; ce sera le nom sous lequel le dossier apparaîtra dans votre VM.
   - Vous avez également l'option de cocher "Montage Automatique" et "Rendre Permanent" si vous souhaitez que le dossier soit automatiquement monté et disponible à chaque démarrage de la VM.
   - Validez en cliquant sur "OK".

3. **Accéder au dossier partagé depuis la VM** :
   - Démarrez votre VM.
   - Si vous avez choisi l'option "Montage Automatique", le dossier partagé devrait apparaître automatiquement quelque part dans le système de fichiers de la VM, souvent sous `/media/sf_<NomDuDossierPartagé>` pour les VMs Linux.
   - Si le dossier n'est pas monté automatiquement, vous devrez peut-être le monter manuellement. Sur Linux, vous pouvez le faire avec une commande comme `sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) <NomDuDossierPartagé> <PointDeMontage>`, où `<NomDuDossierPartagé>` est le nom que vous avez donné au dossier partagé et `<PointDeMontage>` est le répertoire où vous souhaitez accéder au dossier partagé.



---

<!-- File: multipass-avantages.md -->

---
title: multipass-avantages
date: 2024-07-12
tags:
  - ressource
  - programmes
  - linux
  - virtualisations
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[multipass-vs-virtualbox]]"
---
Les avantages de Multipass sont nombreux, particulièrement pour les développeurs et les utilisateurs cherchant une solution rapide et efficace pour la gestion des machines virtuelles (VM). Voici les principaux avantages de Multipass :

### 1. **Simplicité et Rapidité d'Installation**

Multipass est conçu pour être facile à installer et à utiliser. En quelques commandes, vous pouvez lancer des VM, ce qui réduit considérablement le temps de configuration par rapport à d'autres outils de virtualisation.

### 2. **Images Prédéfinies**
Multipass propose une variété d'images prêtes à l'emploi, ce qui permet de lancer rapidement des environnements de développement spécifiques sans avoir à configurer chaque détail.

### 3. **Personnalisation des Images**
Il permet également l'utilisation d'images personnalisées, offrant une grande flexibilité pour adapter les VM à des besoins spécifiques.

### 4. **Configuration par Fichiers YAML**
L'utilisation de fichiers de configuration YAML simplifie et automatise la gestion des configurations complexes, facilitant ainsi les déploiements reproductibles et cohérents.

### 5. **Intégration avec Docker**
Multipass s'intègre parfaitement avec Docker, ce qui permet de lancer des containers Docker dans les VM créées par Multipass, offrant une solution puissante pour les développeurs travaillant avec des containers.

### 6. **Optimisation pour Linux**
Multipass est particulièrement bien optimisé pour les systèmes Linux, utilisant les capacités de virtualisation intégrées du système hôte pour une performance optimale.

### 7. **Support Multi-Système d'Exploitation**
Bien que particulièrement optimisé pour Linux, Multipass fonctionne également sous macOS et Windows, offrant une certaine flexibilité en termes de plateforme d'hébergement.

### 8. **Consommation de Ressources**
En général, Multipass tend à utiliser les ressources de manière plus efficace grâce à son intégration avec le système hôte, ce qui peut conduire à une meilleure performance globale des VM.

### 9. **Adapté aux Workflows de Développement Agile**
Grâce à sa simplicité et à sa rapidité, Multipass est particulièrement adapté aux environnements de développement agile où les développeurs ont besoin de créer et de détruire rapidement des environnements de test.

### 10. **Maintenance et Mise à Jour Faciles**
La maintenance et la mise à jour de Multipass sont simplifiées grâce à des outils intégrés et à une communauté active de développeurs qui fournissent régulièrement des mises à jour et des améliorations.

En résumé, Multipass offre une solution simple, rapide et flexible pour la gestion des VM, avec une attention particulière à l'intégration des outils de développement modernes et à l'efficacité des ressources.

---

<!-- File: multipass-installation-deb.md -->

---
title: multipass-installation-deb
date: 2024-07-12
tags:
  - ressource
  - programmes
  - linux
  - virtualisations
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[multipass-installation-snap]]"
---
# Comment installer Multipass via paquet `.deb` :

1. **Télécharger le paquet Multipass** : Rendez-vous sur la [page des téléchargements de Multipass](https://multipass.run/download) et téléchargez le paquet `.deb` pour Linux.

    Ou utilisez la commande `wget` pour télécharger directement le fichier :

    ```bash
    wget https://github.com/canonical/multipass/releases/download/v<version>/multipass_<version>+<build>_amd64.deb
    ```

    Remplacez `<version>` et `<build>` par les valeurs appropriées de la dernière version disponible. Par exemple, pour la version 1.9.1, la commande serait :

    ```bash
    wget https://github.com/canonical/multipass/releases/download/v1.9.1/multipass_1.9.1+mac2.dmg_amd64.deb
    ```

2. **Installer le paquet avec dpkg** :

    ```bash
    sudo dpkg -i multipass_<version>+<build>_amd64.deb
    ```

3. **Installer les dépendances manquantes** : Si l'installation échoue à cause des dépendances manquantes, utilisez la commande suivante pour les installer :

    ```bash
    sudo apt-get install -f
    ```

4. **Vérifier l'installation** : Après l'installation, vous pouvez vérifier que Multipass fonctionne en exécutant la commande suivante :

    ```bash
    multipass version
    ```

Si vous avez besoin de l'URL exacte pour la dernière version ou d'une aide supplémentaire pour l'installation, n'hésitez pas à demander !

---

<!-- File: multipass-installation-snap.md -->

---
title: multipass-installation-snap
date: 2024-07-12
tags:
  - ressource
  - programmes
  - linux
  - virtualisations
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[multipass-installation-deb]]"
---

# Comment installer Multipass via Snap

### Prérequis

1. Avoir `snapd` installé sur votre système. Si ce n'est pas le cas, installez-le en utilisant les commandes suivantes selon votre distribution.

### Installation de Snapd

#### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install snapd
```

#### Sur Fedora

```bash
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
```

#### Sur Arch Linux

```bash
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
```

### Installation de Multipass

Une fois `snapd` installé, vous pouvez installer Multipass en utilisant la commande `snap` :

```bash
sudo snap install multipass --classic
```

#### Option `--classic`

L'option `--classic` lors de l'installation d'un snap permet d'installer le logiciel en mode classique. Cela signifie que le logiciel aura accès au système de fichiers complet et qu'il ne sera pas confiné dans un environnement restreint comme c'est le cas pour les snaps standards. Cette option est nécessaire pour certains logiciels qui nécessitent un accès étendu au système.

**Explication :** L'option `--classic` est utilisée ici car Multipass peut nécessiter un accès plus large au système pour gérer les machines virtuelles et leurs fichiers.
### Vérification de l'installation

Pour vérifier que Multipass est correctement installé, utilisez la commande suivante :

```bash
multipass --version
```


---

<!-- File: multipass-vs-virtualbox.md -->

---
title: multipass-vs-virtualbox
date: 2024-07-12
tags:
  - ressource
  - virtualisations
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[multipass-avantages]]"
---

## Multipass VS VirtualBox

### Installation et Configuration
**Multipass** se distingue par sa simplicité d'installation et de configuration. Il permet de déployer rapidement des VM avec des commandes simples et offre une intégration fluide avec des images prédéfinies ou personnalisées. La configuration avancée via des fichiers YAML rend la gestion de VM automatisée et flexible.

**VirtualBox**, bien que complet, peut être plus complexe à configurer initialement. Il offre une interface graphique détaillée pour la gestion des VM, mais la configuration des réseaux et des périphériques peut nécessiter des étapes supplémentaires.

### Performance et Ressources
**Multipass** utilise les capacités de virtualisation intégrées du système hôte, ce qui peut conduire à une utilisation plus efficace des ressources et à une performance accrue, surtout sur les systèmes Linux. Il est optimisé pour fonctionner de manière transparente avec des outils de développement comme Docker.

**VirtualBox** est un hyperviseur complet offrant une gamme étendue de fonctionnalités et de paramètres personnalisables. Cependant, cette richesse fonctionnelle peut parfois se traduire par une utilisation plus intensive des ressources système.

### Cas d'utilisation
**Multipass** est idéal pour les développeurs qui recherchent une solution rapide et efficace pour tester des environnements de développement ou déployer des applications légères. Sa simplicité et son intégration avec les environnements de développement le rendent parfait pour les workflows agiles.

**VirtualBox** convient mieux aux utilisateurs qui ont besoin de fonctionnalités avancées de virtualisation et de personnalisation, comme la gestion détaillée des snapshots, les configurations réseau complexes, ou la compatibilité avec une large gamme de systèmes d'exploitation invités.

### Conclusion
En résumé, **Multipass** est la solution de choix pour ceux qui privilégient la simplicité, la rapidité et l'efficacité dans la gestion des VM, tandis que **VirtualBox** offre une robustesse et une flexibilité inégalées pour des besoins de virtualisation plus complexes.

## Fonctionnalités

| Fonctionnalités                      | Multipass | VirtualBox |
| ------------------------------------ | --------- | ---------- |
| Installation et configuration simple | Oui       | Non        |
| Images prédéfinies disponibles       | Oui       | Oui        |
| Utilisation d'images personnalisées  | Oui       | Oui        |
| Configuration via fichiers YAML      | Oui       | Non        |
| Interface graphique                  | Non       | Oui        |
| Gestion détaillée des snapshots      | Non       | Oui        |
| Configurations réseau complexes      | Non       | Oui        |
| Intégration avec Docker              | Oui       | Non        |
| Optimisation pour Linux              | Oui       | Non        |
| Support multi-système d'exploitation | Oui       | Oui        |

1. **Installation et Configuration Simple**
   - **Multipass** : Installation rapide avec des commandes simples. Il est conçu pour être immédiatement opérationnel, ce qui facilite le déploiement de VM.
   - **VirtualBox** : L'installation peut être plus complexe, nécessitant des étapes supplémentaires pour configurer l'environnement et les VM.

2. **Images Prédéfinies Disponibles**
   - **Multipass** : Fournit un large éventail d'images prêtes à l'emploi, facilitant la mise en place rapide d'environnements de développement.
   - **VirtualBox** : Offre également des images prédéfinies, mais leur intégration et gestion peuvent être plus laborieuses.

3. **Utilisation d'Images Personnalisées**
   - **Multipass** : Permet de charger et d'utiliser des images VM personnalisées, offrant une grande flexibilité pour répondre à des besoins spécifiques.
   - **VirtualBox** : Supporte aussi les images personnalisées, offrant une flexibilité similaire dans la gestion des VM.

4. **Configuration via Fichiers YAML**
   - **Multipass** : Permet la configuration des VM via des fichiers YAML, facilitant l'automatisation et la reproductibilité des environnements de développement.
   - **VirtualBox** : Ne supporte pas les fichiers YAML pour la configuration, ce qui peut rendre les configurations automatisées plus complexes.

5. **Interface Graphique**
   - **Multipass** : Ne dispose pas d'une interface graphique dédiée, se concentrant sur une utilisation en ligne de commande pour une gestion rapide et efficace des VM.
   - **VirtualBox** : Offre une interface graphique complète, permettant une gestion détaillée des VM via des fenêtres et des menus intuitifs.

6. **Gestion Détaillée des Snapshots**
   - **Multipass** : Ne propose pas de gestion avancée des snapshots, se concentrant sur des opérations de VM plus simples et directes.
   - **VirtualBox** : Offre une gestion détaillée des snapshots, permettant de sauvegarder et de restaurer des états de VM spécifiques, utile pour les tests et le développement.

7. **Configurations Réseau Complexes**
   - **Multipass** : Dispose de fonctionnalités réseau basiques, suffisantes pour la plupart des scénarios de développement standard.
   - **VirtualBox** : Permet des configurations réseau avancées, telles que les réseaux internes, pontés, et les réseaux hôtes uniquement, offrant une grande flexibilité pour des scénarios complexes.

8. **Intégration avec Docker**
   - **Multipass** : S'intègre parfaitement avec Docker, permettant de lancer et de gérer des conteneurs Docker au sein des VM créées par Multipass.
   - **VirtualBox** : Ne propose pas d'intégration directe avec Docker, nécessitant des configurations supplémentaires pour une utilisation conjointe.

9. **Optimisation pour Linux**
   - **Multipass** : Conçu pour une performance optimale sur les systèmes Linux, exploitant les capacités de virtualisation natives du noyau Linux.
   - **VirtualBox** : Bien qu'il fonctionne sur Linux, il n'est pas spécialement optimisé pour ce système d'exploitation, ce qui peut affecter la performance.

10. **Support Multi-Système d'Exploitation**
    - **Multipass** : Compatible avec Linux, macOS, et Windows, offrant une flexibilité d'utilisation sur différentes plateformes.
    - **VirtualBox** : Supporte également plusieurs systèmes d'exploitation hôtes, y compris Linux, macOS, et Windows, offrant une compatibilité étendue.

Ces fonctionnalités illustrent les points forts et les limitations respectives de Multipass et VirtualBox, aidant ainsi à choisir l'outil le plus adapté en fonction des besoins spécifiques des utilisateurs.
Multipass et VirtualBox sont deux outils populaires pour la gestion de machines virtuelles (VM), mais ils diffèrent sur plusieurs points clés. 




---

<!-- File: lynx.md -->

- [`Lynx`](#lynx)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Paramètres et Options Principales](#paramètres-et-options-principales)
  - [Exemples d'Utilisation de Lynx](#exemples-dutilisation-de-lynx)
    - [Naviguer sur un Site Web](#naviguer-sur-un-site-web)
    - [Afficher le Contenu d'une Page Web](#afficher-le-contenu-dune-page-web)
    - [Lister les Liens d'une Page Web](#lister-les-liens-dune-page-web)
    - [Utiliser un Fichier de Configuration Spécifique](#utiliser-un-fichier-de-configuration-spécifique)
    - [Accepter Tous les Cookies](#accepter-tous-les-cookies)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `Lynx`

## Introduction

Lynx est un navigateur Web en mode texte pour les systèmes Unix et Linux. Conçu pour être léger et rapide, Lynx rend le contenu Web accessible via le terminal, ce qui est particulièrement utile pour les systèmes sans interface graphique ou pour les utilisateurs qui préfèrent le terminal.

## Installation

Pour installer Lynx sur différentes distributions Linux :

- **Debian/Ubuntu** :
  ```bash
  sudo apt-get install lynx
  ```
- **Fedora** :
  ```bash
  sudo dnf install lynx
  ```
- **Arch Linux** :
  ```bash
  sudo pacman -S lynx
  ```

## Paramètres et Options Principales

Lynx offre un large éventail d'options pour personnaliser son comportement et sa configuration. Voici quelques-unes des options les plus utilisées :

- `-dump` : Affiche le contenu textuel d'une page Web sur stdout, ce qui est utile pour les scripts.
- `-listonly` : Affiche uniquement la liste des liens sur une page donnée.
- `-anonymous` : Active les restrictions pour l'anonymat.
- `-accept_all_cookies` : Accepte tous les cookies sans demander.
- `-cfg=FILE` : Spécifie un fichier de configuration alternatif.
- `-force_html` : Force Lynx à traiter le contenu entrant comme HTML.
- `-help` ou `-h` : Affiche l'aide et les options de commande.
- `-version` ou `-v` : Affiche la version de Lynx.
- `-localhost` : Restreint l'accès à l'hôte local uniquement.

## Exemples d'Utilisation de Lynx

### Naviguer sur un Site Web

Pour ouvrir un site Web, tapez simplement `lynx` suivi de l'URL :

```bash
lynx https://example.com
```

### Afficher le Contenu d'une Page Web

Pour afficher le contenu textuel d'une page Web :

```bash
lynx -dump https://example.com > example.txt
```

Cette commande sauvegarde le contenu textuel de `https://example.com` dans `example.txt`.

### Lister les Liens d'une Page Web

Pour obtenir une liste des liens disponibles sur une page Web :

```bash
lynx -listonly -dump https://example.com
```

### Utiliser un Fichier de Configuration Spécifique

Si vous avez un fichier de configuration personnalisé pour Lynx :

```bash
lynx -cfg=/chemin/vers/mon_config.cfg https://example.com
```

### Accepter Tous les Cookies

Pour naviguer sans recevoir de prompt pour les cookies :

```bash
lynx -accept_all_cookies https://example.com
```

## Bonnes Pratiques

- **Personnalisation** : Personnalisez Lynx pour améliorer votre expérience de navigation. Modifiez le fichier de configuration (`lynx.cfg`) pour ajuster les paramètres tels que le comportement des cookies, le proxy, et les couleurs.
- **Sécurité** : Soyez prudent lorsque vous acceptez tous les cookies ou lorsque vous naviguez en mode anonyme. Assurez-vous de comprendre les implications de ces actions.
- **Utilisation de Scripts** : Utilisez les options `-dump` et `-listonly` pour extraire des informations des pages Web dans des scripts shell ou d'autres automatisations.
- **Aide et Documentation** : Consultez l'aide intégrée (`lynx -help`) pour une liste complète des options et consultez la documentation officielle pour des conseils d'utilisation avancée.

## Conclusion

Lynx est un navigateur Web en mode texte puissant et flexible, offrant une expérience de navigation rapide et efficace directement depuis le terminal. Que vous soyez un utilisateur expérimenté du terminal cherchant à naviguer sur le Web ou que vous ayez besoin d'automatiser la récupération d'informations depuis des sites Web, Lynx est un outil précieux qui s'intègre parfaitement à l'environnement Unix/Linux.

---

<!-- File: AllowTcpForwarding.md -->

---
title: AllowTcpForwarding
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour "
" sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la fonction `AllowTcpForwarding`](#fonctionnement-de-la-fonction-allowtcpforwarding)
4. [Syntaxe de la fonction `AllowTcpForwarding`](#syntaxe-de-la-fonction-allowtcpforwarding)
5. [Options de la fonction `AllowTcpForwarding`](#options-de-la-fonction-allowtcpforwarding)
    - [Option `yes`](#option-yes)
    - [Option `no`](#option-no)
    - [Option `local`](#option-local)
    - [Option `remote`](#option-remote)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Activer le transfert TCP](#exemple-1--activer-le-transfert-tcp)
    - [Exemple 2 : Désactiver le transfert TCP](#exemple-2--désactiver-le-transfert-tcp)
    - [Exemple 3 : Activer uniquement le transfert TCP local](#exemple-3--activer-uniquement-le-transfert-tcp-local)
    - [Exemple 4 : Activer uniquement le transfert TCP distant](#exemple-4--activer-uniquement-le-transfert-tcp-distant)

## Introduction

L'option `AllowTcpForwarding` dans la configuration du serveur SSH (`sshd_config`) contrôle si le transfert TCP est autorisé. Le transfert TCP permet de créer des tunnels sécurisés pour rediriger le trafic à travers une connexion SSH. Cela peut être utilisé pour des applications comme les VPN, le contournement de pare-feu, ou l'accès à des services distants de manière sécurisée.

## Installation

`AllowTcpForwarding` fait partie de la configuration du serveur OpenSSH, qui doit être installé sur votre système. Voici comment installer OpenSSH sur différentes distributions Linux.

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install openssh-server
```

### Sur Fedora

```bash
sudo dnf install openssh-server
```

### Sur Arch Linux

```bash
sudo pacman -S openssh
```

### Vérification de l'installation

Pour vérifier que le serveur SSH est installé et en cours d'exécution, utilisez la commande suivante :

```bash
sudo systemctl status sshd
```

## Fonctionnement de la fonction `AllowTcpForwarding`

L'option `AllowTcpForwarding` contrôle si les connexions TCP peuvent être redirigées via SSH. Cette fonctionnalité est souvent utilisée pour sécuriser des connexions à des services ou des applications distantes.

## Syntaxe de la fonction `AllowTcpForwarding`

L'option `AllowTcpForwarding` est définie dans le fichier de configuration du serveur SSH (`/etc/ssh/sshd_config`).

```text
AllowTcpForwarding option
```

### Options possibles

- `yes` : Active le transfert TCP (par défaut).
- `no` : Désactive le transfert TCP.
- `local` : Autorise uniquement le transfert TCP local.
- `remote` : Autorise uniquement le transfert TCP distant.

## Options de la fonction `AllowTcpForwarding`

### Option `yes`

Autorise le transfert TCP à la fois local et distant.

```text
AllowTcpForwarding yes
```

**Explication :** Permet à SSH de rediriger les connexions TCP à la fois localement et vers des hôtes distants. C'est l'option par défaut.

### Option `no`

Désactive complètement le transfert TCP.

```text
AllowTcpForwarding no
```

**Explication :** Empêche toute redirection de connexions TCP via SSH. Utilisé pour augmenter la sécurité en désactivant cette fonctionnalité.

### Option `local`

Autorise uniquement le transfert TCP local.

```text
AllowTcpForwarding local
```

**Explication :** Permet uniquement la redirection de connexions TCP vers des ports locaux sur le client SSH.

### Option `remote`

Autorise uniquement le transfert TCP distant.

```text
AllowTcpForwarding remote
```

**Explication :** Permet uniquement la redirection de connexions TCP vers des ports distants sur le serveur SSH.

## Exemples concrets

### Exemple 1 : Activer le transfert TCP

Pour activer le transfert TCP (local et distant), ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding yes
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Exemple 2 : Désactiver le transfert TCP

Pour désactiver complètement le transfert TCP, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding no
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Exemple 3 : Activer uniquement le transfert TCP local

Pour activer uniquement le transfert TCP local, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding local
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Exemple 4 : Activer uniquement le transfert TCP distant

Pour activer uniquement le transfert TCP distant, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
AllowTcpForwarding remote
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

## Conclusion

Cette documentation complète vous fournit toutes les informations nécessaires pour comprendre et utiliser l'option `AllowTcpForwarding` dans la configuration SSH sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man sshd_config` ou la documentation officielle de SSH.

---

<!-- File: Fail2ban - log.md -->

---
title: Fail2ban - log
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour "
: Log et Journal" sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la fonction de log et journal de Fail2ban](#fonctionnement-de-la-fonction-de-log-et-journal-de-fail2ban)
4. [Configuration des logs et journaux de Fail2ban](#configuration-des-logs-et-journaux-de-fail2ban)
5. [Options de configuration des logs de Fail2ban](#options-de-configuration-des-logs-de-fail2ban)
    - [Option `logtarget`](#option-logtarget)
    - [Option `loglevel`](#option-loglevel)
    - [Option `syslogsocket`](#option-syslogsocket)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Configurer le niveau de log](#exemple-1--configurer-le-niveau-de-log)
    - [Exemple 2 : Changer la destination des logs](#exemple-2--changer-la-destination-des-logs)
    - [Exemple 3 : Utiliser Fail2ban avec rsyslog](#exemple-3--utiliser-fail2ban-avec-rsyslog)

## Introduction

Fail2ban est un outil de sécurité qui surveille les fichiers journaux des services pour détecter les tentatives de connexion échouées et autres comportements suspects, puis bannit les adresses IP malveillantes. La gestion des logs et journaux est cruciale pour le suivi et l'analyse des actions de Fail2ban.

## Installation

Fail2ban est disponible dans les dépôts de la plupart des distributions Linux. Voici comment l'installer sur différentes distributions :

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install fail2ban
```

### Sur Fedora

```bash
sudo dnf install fail2ban
```

### Sur Arch Linux

```bash
sudo pacman -S fail2ban
```

### Vérification de l'installation

Pour vérifier que Fail2ban est correctement installé, utilisez la commande suivante :

```bash
fail2ban-client --version
```

## Fonctionnement de la fonction de log et journal de Fail2ban

Fail2ban utilise les logs pour surveiller les activités suspectes et enregistrer ses propres actions. Les logs contiennent des informations sur les tentatives de connexion échouées, les adresses IP bannies, et d'autres événements liés à la sécurité.

## Configuration des logs et journaux de Fail2ban

Les options de configuration des logs de Fail2ban se trouvent dans le fichier de configuration principal `/etc/fail2ban/fail2ban.conf` et dans le fichier de configuration des actions `/etc/fail2ban/jail.conf` ou `/etc/fail2ban/jail.local`.

### Exemple de configuration de base dans `/etc/fail2ban/fail2ban.conf`

```ini
[Definition]
loglevel = INFO
logtarget = /var/log/fail2ban.log
syslogsocket = auto
```

## Options de configuration des logs de Fail2ban

### Option `logtarget`

Définit la destination des logs de Fail2ban.

```ini
logtarget = /var/log/fail2ban.log
```

**Explication :** Cette option peut être définie sur un fichier (`/var/log/fail2ban.log`), `SYSLOG`, `STDOUT`, ou `STDERR`.

### Option `loglevel`

Définit le niveau de détail des logs.

```ini
loglevel = INFO
```

**Explication :** Les niveaux disponibles sont `CRITICAL`, `ERROR`, `WARNING`, `NOTICE`, `INFO`, et `DEBUG`.

### Option `syslogsocket`

Définit le socket syslog à utiliser.

```ini
syslogsocket = auto
```

**Explication :** Cette option peut être définie sur `auto`, `udp`, ou `tcp`.

## Exemples concrets

### Exemple 1 : Configurer le niveau de log

Pour configurer le niveau de log à `DEBUG` pour obtenir des informations détaillées sur les actions de Fail2ban, modifiez le fichier `/etc/fail2ban/fail2ban.conf` :

```ini
[Definition]
loglevel = DEBUG
```

Redémarrez Fail2ban pour appliquer les modifications :

```bash
sudo systemctl restart fail2ban
```

### Exemple 2 : Changer la destination des logs

Pour changer la destination des logs vers syslog, modifiez le fichier `/etc/fail2ban/fail2ban.conf` :

```ini
[Definition]
logtarget = SYSLOG
```

Redémarrez Fail2ban pour appliquer les modifications :

```bash
sudo systemctl restart fail2ban
```

### Exemple 3 : Utiliser Fail2ban avec rsyslog

Pour envoyer les logs de Fail2ban à un serveur rsyslog distant, configurez rsyslog pour accepter les messages UDP ou TCP, puis modifiez le fichier `/etc/fail2ban/fail2ban.conf` :

```ini
[Definition]
logtarget = SYSLOG
syslogsocket = udp
```

Ensuite, configurez `/etc/rsyslog.conf` ou `/etc/rsyslog.d/` pour envoyer les logs à un serveur distant :

```text
*.* @remote-syslog-server:514
```

Redémarrez rsyslog et Fail2ban pour appliquer les modifications :

```bash
sudo systemctl restart rsyslog
sudo systemctl restart fail2ban
```

---

Cette documentation complète et bien structurée vous fournit toutes les informations nécessaires pour installer, configurer et utiliser les fonctionnalités de log et journal de Fail2ban sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man fail2ban` ou la documentation officielle de Fail2ban.

---

<!-- File: hostname.md -->

# Tutoriel et Documentation Complète sur `hostname`

## Introduction

La commande `hostname` est utilisée pour afficher ou modifier le nom d'hôte du système d'exploitation sur les systèmes Unix et Linux. Le nom d'hôte est un identifiant unique assigné à un dispositif dans un réseau qui permet aux utilisateurs et aux programmes de l'identifier de manière distinctive.

## Syntaxe de Base

```bash
hostname [OPTION]
```

## Options Principales

- **Sans option** : Afficher le nom d'hôte actuel.
- `-a`, `--alias` : Affiche les alias du nom d'hôte du réseau.
- `-d`, `--domain` : Affiche le nom de domaine DNS du système.
- `-f`, `--fqdn`, `--long` : Affiche le nom d'hôte qualifié complet (FQDN).
- `-i`, `--ip-address` : Affiche les adresses IP du nom d'hôte.
- `-I`, `--all-ip-addresses` : Affiche toutes les adresses IP de la machine.
- `-s`, `--short` : Affiche le nom d'hôte court, sans le domaine.
- `-y`, `--yp`, `--nis` : Affiche le nom d'hôte NIS/YP du système.

## Modifier le Nom d'Hôte

Pour modifier le nom d'hôte temporairement (jusqu'au prochain redémarrage) :

```bash
hostname nouveau_nom_dhôte
```

**Note** : Pour modifier le nom d'hôte de manière permanente, vous devrez modifier les fichiers `/etc/hostname` et possiblement `/etc/hosts` et ensuite redémarrer le système ou utiliser `hostnamectl`.

## Exemples d'Utilisation

### Afficher le Nom d'Hôte Actuel

```bash
hostname
```

### Afficher le FQDN (Nom d'Hôte Qualifié Complet)

```bash
hostname -f
```

### Afficher Toutes les Adresses IP de la Machine

```bash
hostname -I
```

### Modifier Temporairement le Nom d'Hôte

```bash
sudo hostname nouveau_nom_dhôte
```

## Utilisation de `hostnamectl`

Sur les systèmes utilisant `systemd`, `hostnamectl` est l'outil préféré pour gérer le nom d'hôte. Voici quelques exemples d'utilisation :

### Afficher le Nom d'Hôte Actuel

```bash
hostnamectl
```

### Modifier le Nom d'Hôte Permanent

```bash
sudo hostnamectl set-hostname nouveau_nom_dhôte
```

### Afficher le Nom d'Hôte et d'Autres Informations Système

```bash
hostnamectl status
```

## Conseils d'Utilisation

- La modification du nom d'hôte peut affecter des applications réseau et des services, assurez-vous donc de mettre à jour tous les fichiers de configuration nécessaires.
- Utilisez `hostnamectl` sur les systèmes modernes basés sur `systemd` pour une gestion cohérente du nom d'hôte.
- Après avoir modifié le nom d'hôte, il peut être nécessaire de redémarrer certains services réseau pour que le changement soit reconnu.

## Conclusion

La commande `hostname` est un outil essentiel pour gérer l'identité réseau de votre machine Linux/Unix. Que ce soit pour la consultation ou la modification du nom d'hôte, `hostname` et `hostnamectl` offrent une interface simple pour effectuer ces tâches, contribuant ainsi à une gestion efficace de votre système dans un réseau.

---

<!-- File: hostnamectl.md -->

# Tutoriel et Documentation Complète sur `hostnamectl`

## Introduction

`hostnamectl` est une commande utilisée dans les systèmes Linux qui utilisent `systemd`, un système d'initialisation et un gestionnaire de systèmes et services. Elle permet de consulter et de changer le nom d'hôte et d'autres paramètres liés à l'identité du système de manière simple et cohérente.

## Syntaxe de Base

La syntaxe de base pour utiliser `hostnamectl` est :

```bash
hostnamectl [OPTIONS...] {COMMAND}
```

## Commandes Principales

- `status` : Affiche le nom d'hôte actuel et d'autres informations liées au système.
- `set-hostname NAME` : Modifie le nom d'hôte du système.
- `set-icon-name NAME` : Modifie le nom de l'icône pour le système.
- `set-chassis TYPE` : Définit le type de châssis du système (par exemple, `server`, `desktop`, `laptop`, etc.).
- `set-deployment ENVIRONMENT` : Modifie l'environnement de déploiement du système.
- `set-location LOCATION` : Définit l'emplacement géographique du système.

## Options

- `--no-ask-password` : Ne pas demander de mot de passe lors de l'exécution des commandes.
- `--static` : Affiche ou modifie le nom d'hôte statique.
- `--transient` : Affiche ou modifie le nom d'hôte transient.
- `--pretty` : Affiche ou modifie le nom d'hôte "pretty" (un nom d'hôte plus descriptif et convivial, qui peut inclure des caractères spéciaux et des majuscules).

## Exemples d'Utilisation

### Afficher l'État Actuel

Pour voir l'état actuel et le nom d'hôte du système :

```bash
hostnamectl status
```

### Changer le Nom d'Hôte

Pour changer le nom d'hôte du système en "nouveau-nom":

```bash
sudo hostnamectl set-hostname "nouveau-nom"
```

### Définir le Type de Châssis

Pour définir le type de châssis du système à "laptop" :

```bash
sudo hostnamectl set-chassis laptop
```

### Définir le Nom d'Hôte "Pretty"

Pour définir un nom d'hôte "pretty":

```bash
sudo hostnamectl set-hostname "Mon Bel Ordinateur" --pretty
```

### Afficher ou Modifier d'Autres Identifiants Système

Modifier l'emplacement géographique du système :

```bash
sudo hostnamectl set-location "Paris, France"
```

Modifier l'environnement de déploiement :

```bash
sudo hostnamectl set-deployment "production"
```

Modifier le nom de l'icône :

```bash
sudo hostnamectl set-icon-name "computer-laptop"
```

## Conseils d'Utilisation

- Utiliser `hostnamectl` pour modifier le nom d'hôte garantit que le nom est correctement mis à jour à travers tous les composants du système qui en dépendent.
- Le nom d'hôte "pretty" est particulièrement utile pour identifier de manière conviviale des machines dans des interfaces graphiques.
- Les modifications apportées avec `hostnamectl` sont persistantes et prennent effet immédiatement, sans nécessiter de redémarrage.

## Conclusion

`hostnamectl` est un outil puissant et versatile pour gérer l'identité du système sur les distributions Linux qui utilisent `systemd`. Il fournit une méthode simple et uniforme pour configurer le nom d'hôte et d'autres paramètres d'identification, facilitant la gestion des machines dans des environnements réseau complexes ou des déploiements à grande échelle.

---

<!-- File: netcat.md -->

# Documentation pour la commande `netcat` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `netcat`](#fonctionnement-de-la-commande-netcat)
3. [Syntaxe de la commande `netcat`](#syntaxe-de-la-commande-netcat)
4. [Options de la commande `netcat`](#options-de-la-commande-netcat)
    - [Option `-l` (listen mode)](#option--l-listen-mode)
    - [Option `-p` (local port)](#option--p-local-port)
    - [Option `-u` (UDP mode)](#option--u-udp-mode)
    - [Option `-z` (zero-I/O mode)](#option--z-zero-io-mode)
    - [Option `-v` (verbose)](#option--v-verbose)
    - [Option `-e` (execute)](#option--e-execute)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Établir une connexion TCP](#exemple-1--établir-une-connexion-tcp)
    - [Exemple 2 : Utiliser `netcat` comme serveur](#exemple-2--utiliser-netcat-comme-serveur)
    - [Exemple 3 : Transférer un fichier](#exemple-3--transférer-un-fichier)
    - [Exemple 4 : Scanner des ports](#exemple-4--scanner-des-ports)
    - [Exemple 5 : Écouter sur un port UDP](#exemple-5--écouter-sur-un-port-udp)
6. [Conclusion](#conclusion)

## Introduction

La commande `netcat` (souvent abrégée en `nc`) sous Linux est un utilitaire réseau polyvalent qui permet d'établir des connexions réseau, d'envoyer et de recevoir des données, et de faire du dépannage réseau. Elle est souvent utilisée pour les tests réseau, le dépannage, et comme outil de back-end pour d'autres scripts et programmes.

## Fonctionnement de la commande `netcat`

`netcat` peut fonctionner à la fois comme un client et un serveur. En mode client, il se connecte à une adresse IP et un port spécifiés et envoie/ reçoit des données. En mode serveur, il écoute sur un port spécifié pour les connexions entrantes.

## Syntaxe de la commande `netcat`

```bash
nc [options] [hôte] [port]
```

### Arguments

- `[hôte]` : L'adresse IP ou le nom d'hôte de la machine à laquelle se connecter.
- `[port]` : Le numéro de port à utiliser pour la connexion.

## Options de la commande `netcat`

### Option `-l` (listen mode)

Active le mode écoute, permettant à `netcat` d'agir comme un serveur.

```bash
nc -l [port]
```

### Option `-p` (local port)

Spécifie le port local à utiliser.

```bash
nc -p [port]
```

### Option `-u` (UDP mode)

Utilise le mode UDP au lieu du mode TCP par défaut.

```bash
nc -u [hôte] [port]
```

### Option `-z` (zero-I/O mode)

Utilise le mode sans I/O pour scanner des ports.

```bash
nc -z [hôte] [port]
```

### Option `-v` (verbose)

Active le mode verbeux, fournissant plus de détails sur les opérations effectuées.

```bash
nc -v [hôte] [port]
```

### Option `-e` (execute)

Exécute un programme spécifique après avoir établi une connexion.

```bash
nc -e [programme] [hôte] [port]
```

## Exemples concrets

### Exemple 1 : Établir une connexion TCP

Pour établir une connexion TCP à `example.com` sur le port `80` :

```bash
nc example.com 80
```

### Exemple 2 : Utiliser `netcat` comme serveur

Pour écouter les connexions sur le port `12345` :

```bash
nc -l 12345
```

### Exemple 3 : Transférer un fichier

Pour envoyer un fichier `file.txt` d'une machine à une autre :

Sur la machine de destination (serveur) :

```bash
nc -l 12345 > received_file.txt
```

Sur la machine source (client) :

```bash
nc [adresse_IP_serveur] 12345 < file.txt
```

### Exemple 4 : Scanner des ports

Pour scanner les ports `20` à `30` sur `example.com` :

```bash
nc -z -v example.com 20-30
```

### Exemple 5 : Écouter sur un port UDP

Pour écouter les connexions UDP sur le port `12345` :

```bash
nc -u -l 12345
```

## Conclusion

La commande `netcat` est un outil puissant et polyvalent pour les administrateurs système et les professionnels du réseau. Elle permet de tester, diagnostiquer et dépanner les connexions réseau de manière flexible et efficace. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man nc` ou `man netcat`, ou la documentation officielle de votre distribution Linux.

---

<!-- File: nmblookup.md -->

# Tutoriel et Documentation Complète sur `nmblookup`

## Introduction

`nmblookup` est un outil en ligne de commande disponible dans les distributions Linux qui fait partie du paquet Samba. Il est utilisé pour interroger les serveurs NetBIOS sur le réseau local pour résoudre leur noms NetBIOS en adresses IP ou vice versa. C'est un outil précieux pour le dépannage des problèmes de réseau et pour découvrir des ressources dans des réseaux Windows.

## Options de `nmblookup`

- `-A <adresse_ip>` : Effectue une requête de nom NetBIOS inverse, c'est-à-dire qu'il trouve le nom NetBIOS associé à une adresse IP spécifiée.
- `-B <adresse_ip>` : Spécifie l'adresse IP du nœud à interroger pour une requête directe.
- `-d <niveau>` : Définit le niveau de débogage. Les niveaux plus élevés fournissent plus d'informations.
- `-M` : Recherche le master browser sur un sous-réseau. Utilisé pour identifier le contrôleur du domaine ou le serveur principal dans un workgroup.
- `-n` : Effectue une requête de nom NetBIOS utilisant le nom local configuré.
- `-S` : Renvoie une liste de services NetBIOS disponibles sur l'hôte spécifié.
- `-U <serveur>` : Spécifie le serveur WINS à utiliser pour la résolution de nom.
- `-R` : Répète la résolution de nom plusieurs fois (utile pour le débogage ou le test de fiabilité).

## Utilisation de Base de `nmblookup`

### Résoudre un Nom NetBIOS en Adresse IP

Pour trouver l'adresse IP associée à un nom NetBIOS :

```bash
nmblookup <nom_netbios>
```

### Trouver le Nom NetBIOS pour une Adresse IP

Pour découvrir le nom NetBIOS associé à une adresse IP spécifique :

```bash
nmblookup -A <adresse_ip>
```

### Interroger un Serveur WINS Spécifique

Si vous souhaitez utiliser un serveur WINS spécifique pour résoudre un nom NetBIOS :

```bash
nmblookup -U <serveur_wins> <nom_netbios>
```

### Rechercher le Master Browser

Pour identifier le master browser dans un workgroup ou domaine :

```bash
nmblookup -M <workgroup/domaine>
```

### Lister les Services NetBIOS

Pour lister les services NetBIOS offerts par un hôte :

```bash
nmblookup -S <nom_hôte>
```

## Exemples Avancés

### Utilisation avec le Débogage

Si vous rencontrez des problèmes ou si vous souhaitez simplement plus de détails sur le processus de recherche :

```bash
nmblookup -d 2 <nom_netbios>
```

### Requête Répétée

Pour effectuer une requête répétée afin de tester la fiabilité ou la constance de la réponse :

```bash
nmblookup -R <nom_netbios>
```

## Conseils d'Utilisation

- **Permissions** : Selon votre configuration réseau, vous pourriez avoir besoin de droits d'administrateur pour exécuter certaines commandes `nmblookup`.
- **Dépannage Réseau** : `nmblookup` est particulièrement utile pour le dépannage des problèmes de connectivité et de résolution de noms dans des réseaux mixtes (Windows et Unix/Linux).
- **Sécurité** : Soyez conscient des politiques de sécurité réseau. L'utilisation intensive de `nmblookup` pourrait être perçue comme une tentative de scan du réseau.

## Conclusion

`nmblookup` est un outil essentiel pour la gestion et le dépannage des réseaux Windows depuis des systèmes Unix/Linux. Que ce soit pour la résolution de noms NetBIOS, la recherche de serveurs WINS ou la découverte de ressources partagées sur le réseau, `nmblookup` offre une gamme de fonctionnalités pour simplifier ces tâches.

---

<!-- File: SSH - config.md -->

---
title: SSH - config
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour la configuration et la sécurisation de 
 sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de SSH](#fonctionnement-de-ssh)
4. [Syntaxe de la commande SSH](#syntaxe-de-la-commande-ssh)
5. [Options de configuration de SSH](#options-de-configuration-de-ssh)
    - [Option `Port`](#option-port)
    - [Option `PermitRootLogin`](#option-permitrootlogin)
    - [Option `PasswordAuthentication`](#option-passwordauthentication)
    - [Option `PubkeyAuthentication`](#option-pubkeyauthentication)
    - [Option `AllowUsers`](#option-allowusers)
    - [Option `DenyUsers`](#option-denyusers)
6. [Exemples concrets de configuration et de sécurisation](#exemples-concrets-de-configuration-et-de-sécurisation)
    - [Exemple 1 : Changer le port SSH](#exemple-1--changer-le-port-ssh)
    - [Exemple 2 : Désactiver l'authentification par mot de passe](#exemple-2--désactiver-lauthentification-par-mot-de-passe)
    - [Exemple 3 : Restreindre l'accès SSH à certains utilisateurs](#exemple-3--restreindre-laccès-ssh-à-certains-utilisateurs)
    - [Exemple 4 : Activer l'authentification par clé publique](#exemple-4--activer-lauthentification-par-clé-publique)

## Introduction

SSH (Secure Shell) est un protocole utilisé pour sécuriser les connexions à distance entre deux machines. Il est couramment utilisé pour accéder à des serveurs distants de manière sécurisée, en chiffrant toutes les données échangées. La configuration et la sécurisation de SSH sont essentielles pour protéger vos systèmes contre les accès non autorisés.

## Installation

### Sur Debian/Ubuntu

Pour installer le serveur SSH (OpenSSH), utilisez la commande suivante :

```bash
sudo apt update
sudo apt install openssh-server
```

Pour installer le client SSH :

```bash
sudo apt install openssh-client
```

### Sur Fedora

Pour installer le serveur SSH (OpenSSH), utilisez la commande suivante :

```bash
sudo dnf install openssh-server
```

Pour installer le client SSH :

```bash
sudo dnf install openssh-clients
```

### Sur Arch Linux

Pour installer OpenSSH (serveur et client) :

```bash
sudo pacman -S openssh
```

### Vérification de l'installation

Pour vérifier que le serveur SSH est installé et en cours d'exécution, utilisez la commande suivante :

```bash
sudo systemctl status ssh
```

## Fonctionnement de SSH

SSH fonctionne en utilisant une paire de clés cryptographiques pour authentifier les utilisateurs et chiffrer la communication entre les clients et les serveurs. Lorsqu'un utilisateur tente de se connecter à un serveur SSH, le serveur utilise sa clé privée pour déchiffrer un message chiffré envoyé par le client, qui utilise la clé publique du serveur.

## Syntaxe de la commande SSH

La commande SSH de base pour se connecter à un serveur distant est :

```bash
ssh [options] utilisateur@hôte
```

### Exemple :

```bash
ssh user@192.168.1.100
```

## Options de configuration de SSH

Les options de configuration de SSH sont définies dans le fichier `/etc/ssh/sshd_config` pour le serveur et dans le fichier `~/.ssh/config` pour le client. Voici quelques options importantes :

### Option `Port`

Change le port sur lequel le serveur SSH écoute.

**Syntaxe :**

```text
Port 2222
```

**Explication :** Par défaut, SSH écoute sur le port 22. Changer le port peut aider à réduire les tentatives de brute force.

### Option `PermitRootLogin`

Contrôle si l'utilisateur root peut se connecter via SSH.

**Syntaxe :**

```text
PermitRootLogin no
```

**Explication :** Désactiver les connexions SSH directes pour l'utilisateur root augmente la sécurité.

### Option `PasswordAuthentication`

Active ou désactive l'authentification par mot de passe.

**Syntaxe :**

```text
PasswordAuthentication no
```

**Explication :** Désactiver l'authentification par mot de passe et utiliser l'authentification par clé publique à la place augmente la sécurité.

### Option `PubkeyAuthentication`

Active l'authentification par clé publique.

**Syntaxe :**

```text
PubkeyAuthentication yes
```

**Explication :** Assurez-vous que cette option est activée pour permettre l'authentification par clé publique.

### Option `AllowUsers`

Restreint les utilisateurs autorisés à se connecter via SSH.

**Syntaxe :**

```text
AllowUsers user1 user2
```

**Explication :** Seuls les utilisateurs spécifiés peuvent se connecter via SSH.

### Option `DenyUsers`

Empêche certains utilisateurs de se connecter via SSH.

**Syntaxe :**

```text
DenyUsers user1 user2
```

**Explication :** Les utilisateurs spécifiés ne peuvent pas se connecter via SSH.

## Exemples concrets de configuration et de sécurisation

### Exemple 1 : Changer le port SSH

1. Ouvrez le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

2. Modifiez la ligne suivante pour changer le port :

```text
Port 2222
```

3. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

### Exemple 2 : Désactiver l'authentification par mot de passe

1. Ouvrez le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

2. Modifiez ou ajoutez la ligne suivante :

```text
PasswordAuthentication no
```

3. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

### Exemple 3 : Restreindre l'accès SSH à certains utilisateurs

1. Ouvrez le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

2. Ajoutez la ligne suivante pour restreindre l'accès :

```text
AllowUsers user1 user2
```

3. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

### Exemple 4 : Activer l'authentification par clé publique

1. Générer une paire de clés publique/privée sur le client :

```bash
ssh-keygen -t rsa -b 4096 -C "votre_email@example.com"
```

2. Copier la clé publique sur le serveur :

```bash
ssh-copy-id user@serveur
```

3. Assurez-vous que l'option `PubkeyAuthentication` est activée dans le fichier de configuration SSH du serveur :

```text
PubkeyAuthentication yes
```

4. Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart ssh
```

---

Cette documentation vous fournit toutes les informations nécessaires pour configurer et sécuriser SSH sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man sshd_config` ou la documentation officielle de SSH.

---

<!-- File: uniq.md -->

---
title: uniq
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour la commande `uniq` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `uniq`](#fonctionnement-de-la-commande-uniq)
3. [Syntaxe de la commande `uniq`](#syntaxe-de-la-commande-uniq)
4. [Options de la commande `uniq`](#options-de-la-commande-uniq)
    - [Option `-c` (count)](#option--c-count)
    - [Option `-d` (duplicate)](#option--d-duplicate)
    - [Option `-u` (unique)](#option--u-unique)
    - [Option `-i` (ignore case)](#option--i-ignore-case)
    - [Option `-f` (skip fields)](#option--f-skip-fields)
    - [Option `-s` (skip characters)](#option--s-skip-characters)
    - [Option `-w` (check characters)](#option--w-check-characters)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Supprimer les lignes en double](#exemple-1--supprimer-les-lignes-en-double)
    - [Exemple 2 : Compter les occurrences de chaque ligne](#exemple-2--compter-les-occurrences-de-chaque-ligne)
    - [Exemple 3 : Afficher uniquement les lignes en double](#exemple-3--afficher-uniquement-les-lignes-en-double)
    - [Exemple 4 : Afficher uniquement les lignes uniques](#exemple-4--afficher-uniquement-les-lignes-uniques)
    - [Exemple 5 : Ignorer la casse lors de la comparaison](#exemple-5--ignorer-la-casse-lors-de-la-comparaison)
6. [Conclusion](#conclusion)

## Introduction

La commande `uniq` sous Linux est utilisée pour supprimer les lignes en double dans un fichier ou une sortie standard. Elle peut également être utilisée pour afficher des lignes en double ou uniques et pour compter les occurrences de chaque ligne. Pour que `uniq` fonctionne correctement, les lignes en double doivent être adjacentes, ce qui signifie que le fichier doit être trié avant d'utiliser `uniq`.

## Fonctionnement de la commande `uniq`

La commande `uniq` lit l'entrée standard ou un fichier et supprime les lignes en double adjacentes. Elle peut également afficher des informations supplémentaires sur les lignes, comme le nombre d'occurrences.

## Syntaxe de la commande `uniq`

```bash
uniq [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à traiter. Si aucun fichier n'est spécifié, `uniq` lit l'entrée standard.

## Options de la commande `uniq`

### Option `-c` (count)

Affiche chaque ligne unique avec le nombre d'occurrences.

```bash
uniq -c [fichier]
```

### Option `-d` (duplicate)

Affiche uniquement les lignes en double.

```bash
uniq -d [fichier]
```

### Option `-u` (unique)

Affiche uniquement les lignes uniques.

```bash
uniq -u [fichier]
```

### Option `-i` (ignore case)

Ignore la casse lors de la comparaison des lignes.

```bash
uniq -i [fichier]
```

### Option `-f` (skip fields)

Ignore les n premiers champs lors de la comparaison des lignes.

```bash
uniq -f n [fichier]
```

### Option `-s` (skip characters)

Ignore les n premiers caractères lors de la comparaison des lignes.

```bash
uniq -s n [fichier]
```

### Option `-w` (check characters)

Compare uniquement les n premiers caractères des lignes.

```bash
uniq -w n [fichier]
```

## Exemples concrets

### Exemple 1 : Supprimer les lignes en double

Pour supprimer les lignes en double dans un fichier `example.txt` :

```bash
sort example.txt | uniq
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et supprime les lignes en double adjacentes.

### Exemple 2 : Compter les occurrences de chaque ligne

Pour afficher chaque ligne unique avec le nombre d'occurrences dans `example.txt` :

```bash
sort example.txt | uniq -c
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et affiche chaque ligne unique avec le nombre d'occurrences.

### Exemple 3 : Afficher uniquement les lignes en double

Pour afficher uniquement les lignes en double dans `example.txt` :

```bash
sort example.txt | uniq -d
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et affiche uniquement les lignes en double adjacentes.

### Exemple 4 : Afficher uniquement les lignes uniques

Pour afficher uniquement les lignes uniques dans `example.txt` :

```bash
sort example.txt | uniq -u
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` et affiche uniquement les lignes uniques.

### Exemple 5 : Ignorer la casse lors de la comparaison

Pour ignorer la casse lors de la comparaison des lignes dans `example.txt` :

```bash
sort example.txt | uniq -i
```

**Explication :** Cette commande trie les lignes du fichier `example.txt` sans tenir compte de la casse et supprime les lignes en double adjacentes.

## Conclusion

La commande `uniq` est un outil puissant pour manipuler et nettoyer les données en supprimant les doublons. En utilisant ses différentes options, vous pouvez personnaliser la manière dont `uniq` traite les lignes en double, les lignes uniques et les occurrences de chaque ligne. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man uniq` ou la documentation officielle de votre distribution Linux.

---

<!-- File: X11Forwarding.md -->

---
title: X11Forwarding
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour "
" sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement de la fonction `X11Forwarding`](#fonctionnement-de-la-fonction-x11forwarding)
4. [Syntaxe de la fonction `X11Forwarding`](#syntaxe-de-la-fonction-x11forwarding)
5. [Options de la fonction `X11Forwarding`](#options-de-la-fonction-x11forwarding)
    - [Option `yes`](#option-yes)
    - [Option `no`](#option-no)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Activer le transfert X11](#exemple-1--activer-le-transfert-x11)
    - [Exemple 2 : Désactiver le transfert X11](#exemple-2--désactiver-le-transfert-x11)

## Introduction

L'option `X11Forwarding` dans la configuration du serveur SSH (`sshd_config`) permet le transfert des sessions X11 via SSH. Cette fonctionnalité est couramment utilisée pour exécuter des applications graphiques sur un serveur distant et afficher l'interface graphique sur une machine locale.

## Installation

Pour utiliser le transfert X11 via SSH, vous devez installer OpenSSH et un serveur X sur les machines client et serveur.

### Sur Debian/Ubuntu

Pour installer le serveur SSH (OpenSSH) et le serveur X :

```bash
sudo apt update
sudo apt install openssh-server xauth
```

### Sur Fedora

Pour installer le serveur SSH (OpenSSH) et le serveur X :

```bash
sudo dnf install openssh-server xorg-x11-xauth
```

### Sur Arch Linux

Pour installer OpenSSH et le serveur X :

```bash
sudo pacman -S openssh xorg-xauth
```

### Vérification de l'installation

Pour vérifier que le serveur SSH est installé et en cours d'exécution, utilisez la commande suivante :

```bash
sudo systemctl status sshd
```

## Fonctionnement de la fonction `X11Forwarding`

La fonction `X11Forwarding` permet de rediriger les connexions X11 (utilisées pour les interfaces graphiques) à travers une connexion SSH. Cela permet aux utilisateurs de lancer des applications graphiques sur un serveur distant et d'afficher leur interface graphique sur leur machine locale.

## Syntaxe de la fonction `X11Forwarding`

L'option `X11Forwarding` est définie dans le fichier de configuration du serveur SSH (`/etc/ssh/sshd_config`).

```text
X11Forwarding option
```

### Options possibles

- `yes` : Active le transfert X11.
- `no` : Désactive le transfert X11 (par défaut).

## Options de la fonction `X11Forwarding`

### Option `yes`

Active le transfert X11.

```text
X11Forwarding yes
```

**Explication :** Permet au serveur SSH de rediriger les connexions X11 vers le client SSH. Cela permet aux applications graphiques sur le serveur distant d'être affichées sur la machine locale.

### Option `no`

Désactive le transfert X11.

```text
X11Forwarding no
```

**Explication :** Empêche le serveur SSH de rediriger les connexions X11. Cela peut être utilisé pour des raisons de sécurité si le transfert X11 n'est pas nécessaire.

## Exemples concrets

### Exemple 1 : Activer le transfert X11

Pour activer le transfert X11, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
X11Forwarding yes
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

### Sur le client

Pour utiliser le transfert X11 lors de la connexion à un serveur SSH, utilisez l'option `-X` :

```bash
ssh -X user@server
```

### Exemple 2 : Désactiver le transfert X11

Pour désactiver le transfert X11, ajoutez ou modifiez la ligne suivante dans `/etc/ssh/sshd_config` :

```text
X11Forwarding no
```

Redémarrez le service SSH pour appliquer les modifications :

```bash
sudo systemctl restart sshd
```

---

Cette documentation vous fournit toutes les informations nécessaires pour comprendre et utiliser l'option `X11Forwarding` dans la configuration SSH sous Linux. Pour toute question supplémentaire, consultez les pages de manuel en utilisant la commande `man sshd_config` ou la documentation officielle de SSH.

---

<!-- File: build-essential.md -->

- [Documentation sur le paquet `build-essential` sous Debian et dérivés](#documentation-sur-le-paquet-build-essential-sous-debian-et-dérivés)
  - [Introduction](#introduction)
  - [Contenu de `build-essential`](#contenu-de-build-essential)
  - [Installation](#installation)
  - [Utilisation](#utilisation)
  - [Pourquoi `build-essential` est essentiel ?](#pourquoi-build-essential-est-essentiel-)
  - [Conclusion](#conclusion)


# Documentation sur le paquet `build-essential` sous Debian et dérivés

## Introduction

Le paquet `build-essential` est un méta-paquet Debian qui installe les paquets et les outils de base nécessaires pour compiler et lier des programmes en C et C++ sous les systèmes basés sur Debian. Il ne contient pas de logiciel en lui-même mais spécifie une liste de paquets à installer pour créer un environnement de développement minimal.

## Contenu de `build-essential`

L'installation de `build-essential` comprend généralement les éléments suivants :

- **GCC** : Le compilateur GNU C qui permet de compiler des programmes en C.
- **G++** : Le compilateur GNU C++ pour la compilation de programmes en C++.
- **Make** : Un outil qui contrôle la génération des exécutables et autres fichiers non source d'un programme à partir des fichiers source.
- **DPKG-DEV** : Contient des outils de développement pour Debian, y compris des scripts et autres utilitaires nécessaires à la compilation de paquets Debian.
- **Librairies de développement standard** : Les fichiers d'en-tête et les bibliothèques de développement pour la standard C library, et potentiellement d'autres bibliothèques utiles.

## Installation

Pour installer `build-essential`, ouvrez un terminal et exécutez la commande suivante :

```bash
sudo apt update
sudo apt install build-essential
```

Cette commande met à jour la liste des paquets disponibles et installe `build-essential` ainsi que ses dépendances.

## Utilisation

Après l'installation, vous pouvez commencer à compiler et à lier des programmes en C/C++. Voici un exemple simple pour compiler un programme en C :

1. Créez un fichier nommé `hello.c` contenant le code suivant :

```c
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```

2. Ouvrez un terminal dans le répertoire contenant `hello.c`.
3. Compilez le programme avec la commande suivante :

```bash
gcc hello.c -o hello
```

4. Exécutez le programme compilé :

```bash
./hello
```

Vous devriez voir le message `Hello, World!` s'afficher dans le terminal.

## Pourquoi `build-essential` est essentiel ?

`build-essential` est crucial pour les développeurs travaillant sur des projets en C ou C++ sous Debian et ses dérivés, ainsi que pour la compilation de logiciels à partir de sources. C'est souvent une dépendance pour installer d'autres logiciels ou bibliothèques de développement.

## Conclusion

Le paquet `build-essential` est une composante clé pour la compilation de logiciels sous Debian et ses systèmes dérivés. Il fournit les outils et les ressources nécessaires pour démarrer le développement en C et C++, rendant la compilation de logiciels à partir des sources possible et efficace.

---

<!-- File: debian_alt_click.md -->

## Gnome

### 1. Vérifier les Paramètres de VSCode
- Assurez-vous que la fonctionnalité de sélection multiple est activée dans les paramètres de VSCode. Bien qu'il n'y ait pas de paramètre spécifique pour activer ou désactiver `Alt` + clic pour la sélection multiple, il est bon de vérifier si d'autres paramètres relatifs au comportement de la souris ont été modifiés.

### 2. Tester dans un Nouvel Environnement de Bureau ou une Session Xorg
- Si vous utilisez Wayland, essayez de passer à une session Xorg pour voir si le problème persiste, car certains comportements de la souris peuvent différer entre Wayland et Xorg.
- Si vous utilisez un environnement de bureau particulier (comme GNOME, KDE, etc.), essayez de voir si le problème se pose également dans un environnement différent.

### 3. Vérifier les Raccourcis Globaux du Système
- Certains environnements de bureau ou gestionnaires de fenêtres utilisent `Alt` + clic gauche pour des fonctions comme déplacer des fenêtres. Vérifiez les paramètres de raccourcis globaux de votre système pour s'assurer qu'il n'y a pas de conflit.
- Sous GNOME, KDE, ou d'autres environnements, cherchez dans les paramètres des raccourcis clavier ou dans le gestionnaire de configurations pour modifier ou désactiver les raccourcis en conflit.

### 4. Utiliser un Outil de Configuration de Clavier
- Utilisez un outil comme `dconf-editor` sous GNOME pour rechercher et modifier les paramètres de clavier et de souris qui pourraient être en conflit avec VSCode.



## Désactivation ou Reconfiguration de `Alt` + Clic Gauche sous Cinnamon

1. **Ouvrir le Menu des Paramètres du Système**
   - Vous pouvez le faire en cliquant sur le menu, puis en sélectionnant `Paramètres du système` ou en recherchant "Paramètres du système" dans la barre de recherche.

2. **Accéder aux Paramètres de la Fenêtre**
   - Dans les Paramètres du système, cherchez une section nommée `Fenêtres`, `Gestion de la fenêtre`, ou quelque chose de similaire. Sous Cinnamon, cela peut souvent se trouver sous la catégorie `Préférences`.

3. **Chercher l'Option de Mouvement de la Fenêtre**
   - À l'intérieur des paramètres de la fenêtre, recherchez une option qui contrôle le comportement du mouvement de la fenêtre. Ceci peut être sous une sous-section comme `Comportement` ou directement visible dans les options principales.

4. **Modifier ou Désactiver la Touche de Modification**
   - Vous devriez trouver une option permettant de changer ou de désactiver la touche de modification utilisée pour déplacer les fenêtres. Par défaut, cela est souvent réglé sur `Alt`, mais vous pouvez le changer en une autre touche (comme `Super`, c'est-à-dire la touche Windows sur la plupart des claviers) ou le désactiver complètement si vous préférez ne pas utiliser cette fonctionnalité.

5. **Sauvegarder Vos Changements**
   - Une fois que vous avez fait votre choix, assurez-vous de sauvegarder ou d'appliquer vos modifications. Les effets devraient être immédiats.



---

<!-- File: debian_ctrl_alt_fleche.md -->

Pour activer la sélection multiple avec le raccourci `Ctrl` + `Alt` + flèche dans VSCode sous Debian (ou dans d'autres distributions Linux où ce raccourci est intercepté par le gestionnaire de fenêtres pour changer de bureau virtuel), vous devez désactiver ou modifier le raccourci dans le gestionnaire de fenêtres. Voici comment vous pouvez le faire dans GNOME, qui est souvent utilisé avec Debian :

### Désactiver le changement de bureau avec `Ctrl` + `Alt` + flèche
1. **Ouvrez les Paramètres de GNOME :** Vous pouvez y accéder via le menu des applications ou en utilisant la recherche.
2. **Allez dans "Clavier" ou "Raccourcis Clavier" :** Le nom peut varier selon la version de GNOME.
3. **Naviguez vers les raccourcis pour les bureaux virtuels ou la navigation :** Vous cherchez les raccourcis liés au changement de bureau, souvent sous une catégorie comme "Navigation" ou "Bureaux virtuels".
4. **Désactivez ou modifiez les raccourcis :** Trouvez les raccourcis pour "Changer de bureau à gauche/droite/haut/bas" qui sont généralement liés à `Ctrl` + `Alt` + flèche, et désactivez-les ou modifiez-les selon vos préférences.

### Alternative : Modifier le raccourci dans VSCode
Si vous préférez ne pas modifier les raccourcis globaux de votre système, vous pouvez reconfigurer les raccourcis dans VSCode pour contourner le conflit :

1. **Ouvrez les Paramètres de raccourcis dans VSCode :** Utilisez `Ctrl` + `Shift` + `P` pour ouvrir la palette de commandes, puis tapez `Open Keyboard Shortcuts (JSON)` pour éditer directement le fichier de configuration des raccourcis.
2. **Trouvez ou ajoutez les raccourcis pour la sélection multiple :** Vous pouvez modifier ou ajouter des raccourcis pour la sélection multiple. Si le raccourci `Ctrl` + `Alt` + flèche n'est pas utilisé par défaut pour cela dans VSCode, vous devrez peut-être ajouter une nouvelle entrée correspondant à l'action souhaitée.

Exemple de modification dans le fichier JSON de raccourcis (remplacez `"key"` par le nouveau raccourci si vous modifiez) :

```json
{
    "key": "ctrl+alt+down",
    "command": "editor.action.insertCursorBelow",
    "when": "editorTextFocus"
},
{
    "key": "ctrl+alt+up",
    "command": "editor.action.insertCursorAbove",
    "when": "editorTextFocus"
}
```

3. **Dans la Palette de Commandes, tapez** : `Open Keyboard Shortcuts (JSON)`. Vous verrez cette option apparaître pendant que vous tapez. Sélectionnez-la et appuyez sur `Entrée`.



---

<!-- File: fstab.md -->

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

---

<!-- File: instal_debian.md -->

# apress l'installation

## ajouter le groupe sudo a l'utilisateur


### 1. Se connecter en tant que root

Si vous n'avez pas accès à `sudo`, vous devrez vous connecter directement en tant que l'utilisateur root. Si vous êtes déjà connecté avec un utilisateur non-root, vous pouvez essayer de passer à l'utilisateur root en utilisant :

```bash
su -
```

### 2. Installer sudo

Une fois connecté en tant que root, exécutez la commande suivante pour installer `sudo` :

```bash
apt update && apt install sudo -y
```

Cette commande met à jour la liste des paquets puis installe le paquet `sudo`.

### 3. Ajouter l'utilisateur au groupe sudo

Après avoir installé `sudo`, assurez-vous que votre utilisateur non-root est ajouté au groupe `sudo` avec la commande suivante (remplacez `nom_utilisateur` par le nom de votre utilisateur) :

```bash
adduser nom_utilisateur sudo
```

Ou, vous pouvez utiliser cette commande :

```bash
usermod -aG sudo nom_utilisateur
```

### 4. Se déconnecter et se reconnecter

Pour que les changements prennent effet, vous devez vous déconnecter puis vous reconnecter avec votre compte utilisateur.

- Si vous êtes en session SSH, tapez `exit` ou appuyez sur `Ctrl+D`, puis reconnectez-vous.
- Si vous êtes en accès physique ou via une console KVM, déconnectez-vous de la session root et reconnectez-vous avec votre utilisateur.

### 5. Tester sudo

Pour tester si `sudo` fonctionne correctement avec votre utilisateur, vous pouvez exécuter une commande simple comme :

```bash
sudo echo "sudo fonctionne!"
```

### mettre a jour le systeme 
sudo apt-get update && sudo apt-get upgrade -y

### installer des utilitaires
```bash
apt install git curl wget unzip
```
### installer zsh
```sh
sudo apt install zsh
```
```sh
chsh -s $(which zsh)
```

#### zshrc
```sh
export ZSH="$HOME/.oh-my-zsh"
bira
zsh-autosuggestions zsh-syntax-highlighting
copy_find_a() {
    echo "find -type d \( -iname 'md' \) -o  \( -iname \"*cmd*\" \) -exec find {} -type f -iname \"*.md\" \;" | xclip -selection clipboard
}
alias clip="xclip -selection clipboard"
alias find_1='copy_find_a'

export HSTR_CONFIG=hicolor         
setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=100000
export SAVEHIST=100000
setopt SHARE_HISTORY

export PATH="$HOME/bin:$PATH"
```
### installer oh-my-zsh
```sh
sudo apt install curl
```
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```sh
sh -c "$(wget -O- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

---

<!-- File: mount.md -->

La commande `mount` sous Debian (et d'autres distributions Linux) est essentielle pour monter des systèmes de fichiers et des dispositifs de stockage. Elle permet aux utilisateurs d'accéder aux fichiers sur différents dispositifs, tels que des disques durs, des CD-ROMs, et des partages réseau. Voici une documentation complète sur l'utilisation de `mount` :

### Comprendre `mount`

La syntaxe de base de la commande `mount` est :

```bash
mount [OPTION...] <source> <destination>
```

- **`<source>`** : Le périphérique, l'image disque, ou le système de fichiers à monter.
- **`<destination>`** : Le point de montage où le système de fichiers doit être accessible.

### Options Communes

- `-t <type>` : Spécifie le type de système de fichiers (`ext4`, `ntfs`, `vfat`, etc.).
- `-o <options>` : Permet de spécifier des options de montage, séparées par des virgules (par exemple, `ro` pour montage en lecture seule, `rw` pour lecture-écriture).
- `-a` : Monte tous les systèmes de fichiers définis dans `/etc/fstab`.
- `-r` : Monte le système de fichiers en lecture seule.
- `-w` : Monte le système de fichiers en lecture-écriture.

### Monter un Périphérique

Pour monter un disque dur ou une partition, identifiez d'abord le périphérique (par exemple, `/dev/sdb1`) :

1. Créez un point de montage si nécessaire :

   ```bash
   sudo mkdir /mnt/mydisk
   ```

2. Montez le périphérique :

   ```bash
   sudo mount /dev/sdb1 /mnt/mydisk
   ```

### Monter une Image Disque

Pour monter une image ISO, par exemple :

```bash
sudo mount -o loop myimage.iso /mnt/myiso
```

### Utiliser `/etc/fstab` pour le Montage Automatique

Le fichier `/etc/fstab` contient la configuration des systèmes de fichiers à monter automatiquement au démarrage. Pour ajouter un système de fichiers à ce fichier :

1. Ouvrez `/etc/fstab` dans un éditeur de texte :

   ```bash
   sudo nano /etc/fstab
   ```

2. Ajoutez une ligne avec les détails du système de fichiers :

   ```plaintext
   /dev/sdb1 /mnt/mydisk ext4 defaults 0 2
   ```

   Ceci monte automatiquement `/dev/sdb1` à `/mnt/mydisk` avec le système de fichiers `ext4`, en utilisant les options par défaut.

### Monter un Partage Réseau (SMB/CIFS)

Pour monter un partage Windows (SMB/CIFS) :

1. Installez `cifs-utils` si nécessaire :

   ```bash
   sudo apt-get install cifs-utils
   ```

2. Créez un point de montage :

   ```bash
   sudo mkdir /mnt/shared
   ```

3. Montez le partage :

   ```bash
   sudo mount -t cifs -o username=monuser,password=monmdp //monserveur/monpartage /mnt/shared
   ```

### Démonter un Système de Fichiers

Pour démonter un système de fichiers :

```bash
sudo umount /mnt/mydisk
```

### Conseils d'Utilisation

- Utilisez `mount` avec `sudo` pour obtenir les permissions nécessaires.
- Vérifiez toujours le type de système de fichiers et les options de montage appropriées pour éviter des erreurs ou des pertes de données.
- Pour les montages temporaires, n'oubliez pas de démonter proprement les systèmes de fichiers avant de déconnecter le périphérique.
- Utilisez `lsblk` ou `fdisk -l` pour lister les périphériques et partitions disponibles.

Cette documentation couvre les bases et quelques cas d'usage courants de la commande `mount`. Pour une aide plus détaillée et des options avancées, consultez la page man de `mount` (`man mount`) ou la documentation en ligne de Debian.

---

<!-- File: mount_samba.md -->

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

---

<!-- File: ntfs-3g.md -->

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


---

<!-- File: path_scripts.md -->

- [ajouter des scripts au $**PATH**](#ajouter-des-scripts-au-path)
- [zsh: ajouter des scripts au $**PATH**](#zsh-ajouter-des-scripts-au-path)
- [exemple de script python a lier dans le $PATH](#exemple-de-script-python-a-lier-dans-le-path)
  - [hello\_world.py](#hello_worldpy)
  - [traiter\_fichier.py](#traiter_fichierpy)


# ajouter des scripts au $**PATH**

1. **Rendez le script exécutable :**
   - Ajoutez la shebang line (`#!/usr/bin/env python3`) au début de votre script pour indiquer avec quel interpréteur le script doit être exécuté.
   - Rendez le fichier exécutable en utilisant la commande `chmod +x mon_script.py`.

2. **Placez le script dans un dossier inclus dans votre `$PATH` :**
   - Le `$PATH` est une variable d'environnement qui spécifie les répertoires dans lesquels le shell recherche les commandes. Vous pouvez voir les dossiers actuellement dans votre `$PATH` en exécutant `echo $PATH` dans le terminal.
   - Les emplacements communs pour les scripts personnels sont `/usr/local/bin` ou `~/bin` (un dossier `bin` dans votre répertoire personnel).
     - **Pour `/usr/local/bin`** (nécessite des privilèges superutilisateur) : déplacez ou créez un lien symbolique de votre script dans `/usr/local/bin`.
       - Par exemple : 
            ```bash
            sudo mv mon_script.py /usr/local/bin/
            ```
            ou
            ```bash
            sudo ln -s /chemin/vers/mon_script.py /usr/local/bin/mon_script
            ```
     - **Pour `~/bin`** :
       1. Créez le dossier s'il n'existe pas déjà :
            ```bash
            mkdir -p ~/bin
            ```
       2. Déplacez ou créez un lien symbolique de votre script dans `~/bin`.
           - Par exemple :
                ```bash
                mv mon_script.py ~/bin/
                ```
                ou
                ```bash
                ln -s /chemin/vers/mon_script.py ~/bin/mon_script
                ``` 
       3. Assurez-vous que `~/bin` est dans votre `$PATH`. 
          1. Si ce n'est pas le cas, vous pouvez l'ajouter en modifiant le fichier `~/.bashrc`, `~/.bash_profile`, ou `~/.profile` (selon votre shell et configuration) et en ajoutant la ligne :
                ```bash
                export PATH="$HOME/bin:$PATH"
                ```
                Ensuite, rechargez la configuration avec :
                ```bash
                source ~/.bashrc

3. **Utilisez le nom du script pour l'exécuter :**
   - Après avoir suivi ces étapes, vous devriez être capable d'exécuter votre script en tapant simplement son nom (sans le `.py` si vous avez choisi de le renommer lors du déplacement) dans le terminal, peu importe le répertoire dans lequel vous vous trouvez.

**Note :** Si vous travaillez avec des versions spécifiques de Python ou dans des environnements virtuels, assurez-vous que la shebang line de votre script pointe vers l'interpréteur Python appropri

# zsh: ajouter des scripts au $**PATH**

Si vous utilisez `zsh` comme shell, le processus pour ajouter `~/bin` à votre `$PATH` et y accéder rapidement depuis la ligne de commande reste assez similaire à celui de `bash`, avec quelques petites différences dans les fichiers de configuration que vous pourriez modifier.

Pour ajouter `~/bin` à votre `$PATH` en utilisant `zsh`, suivez ces étapes :

1. **Créez le dossier `~/bin` si ce n'est pas déjà fait :**
   ```
   mkdir -p ~/bin
   ```

2. **Ouvrez votre fichier de configuration `zsh` :**
   - Le fichier de configuration pour `zsh` est généralement `~/.zshrc`. Vous pouvez l'ouvrir avec votre éditeur de texte préféré. Par exemple, avec nano, vous feriez :
     ```
     nano ~/.zshrc
     ```

3. **Ajoutez `~/bin` à votre `$PATH` :**
   - À la fin du fichier `~/.zshrc`, ajoutez la ligne suivante :
     ```
     export PATH="$HOME/bin:$PATH"
     ```
   - Cette commande ajoute `~/bin` au début de votre `$PATH`, ce qui signifie que les exécutables dans `~/bin` seront trouvés et exécutés en priorité par rapport à ceux situés dans les autres répertoires listés dans votre `$PATH`.

4. **Sauvegardez le fichier et rechargez la configuration :**
   - Après avoir sauvegardé vos modifications (dans nano, vous appuyeriez sur `Ctrl+O`, puis `Enter` pour sauvegarder, et `Ctrl+X` pour quitter), rechargez votre configuration `zsh` pour que les changements prennent effet. Vous pouvez le faire en exécutant :
     ```
     source ~/.zshrc
     ```
     ou simplement en fermant et en rouvrant votre terminal.

5. **Rendez votre script exécutable et déplacez-le (ou créez un lien) dans `~/bin` :**
   - Assurez-vous que votre script est exécutable :
     ```
     chmod +x /chemin/vers/mon_script.py
     ```
   - Déplacez ou créez un lien symbolique de votre script dans `~/bin` :
     ```
     ln -s /chemin/vers/mon_script.py ~/bin/mon_script
     ```
     ou
     ```
     mv /chemin/vers/mon_script.py ~/bin/
     ```

Après avoir suivi ces étapes, vous devriez pouvoir exécuter votre script Python en tapant `mon_script` (ou le nom que vous avez choisi pour le lien symbolique) directement dans votre terminal `zsh`.

# exemple de script python a lier dans le $PATH
## hello_world.py
```python
#!/usr/bin/env python3
print("Hello, world!")
```
```bash
chmod +x /chemin/vers/mon_script.py
ln -s /chemin/vers/mon_script.py ~/bin/mon_script
```
```bash
mon_script
```
## traiter_fichier.py
```python
#!/usr/bin/env python3

import sys
from pathlib import Path

def is_file(_path) -> bool:
    return Path(_path).is_file()

def traiter_fichier(chemin_fichier):
    # Ici, vous mettriez votre logique de traitement du fichier
    print(f"Traitement du fichier: {chemin_fichier}")
    
    # Créer un objet Path
    p = Path(chemin_fichier)

    # Obtenir le dossier parent
    dossier_parent = p.parent

    # Obtenir le nom du fichier
    nom_fichier = p.name
    
    # Obtenir le nom du fichier sans extension
    nom_fichier_se = p.stem

    # Obtenir l'extension du fichier
    extension = p.suffix

    # Afficher les informations
    print(f"Dossier parent: {dossier_parent}")
    print(f"Nom du fichier: {nom_fichier}")
    print(f"Nom du fichier sans extension: {nom_fichier_se}")
    print(f"Extension: {extension}")
    print(f"isfile: {is_file(chemin_fichier)}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python traiter_fichier.py <chemin_fichier>")
        sys.exit(1)

    chemin_fichier = sys.argv[1]
    traiter_fichier(chemin_fichier)
```
```bash
chmod +x /chemin/vers/traiter_fichier.py
ln -s /chemin/vers/mon_script.py ~/bin/traiter_fichier
```
```bash
traiter_fichier /chemin/vers/mon_fichier.txt
```



---

<!-- File: redirections.md -->

---
title: redirections
date: 2024-07-18
tags:
  - ressource
  - linux
status:
  - En cours
type de note:
  - ressource
---

- [Introduction aux flux d'entrées et de sorties](#introduction-aux-flux-dentrées-et-de-sorties)
  - [Redirections](#redirections)
    - [Rediriger la sortie standard](#rediriger-la-sortie-standard)
    - [Rediriger l'erreur standard](#rediriger-lerreur-standard)
    - [Rediriger à la fois la sortie standard et l'erreur standard](#rediriger-à-la-fois-la-sortie-standard-et-lerreur-standard)
    - [Rediriger l'entrée standard](#rediriger-lentrée-standard)
    - [Pipelines](#pipelines)
    - [Exemples avancés](#exemples-avancés)
    - [Exemple : Dupliquer des descripteurs](#exemple--dupliquer-des-descripteurs)
      - [Utilisation de `tee` pour la duplication de sortie](#utilisation-de-tee-pour-la-duplication-de-sortie)


# Introduction aux flux d'entrées et de sorties

Dans un environnement Linux, le terminal interagit avec les utilisateurs à travers trois flux principaux :

1. **0 : Entrée standard (stdin)** : C'est le flux d'entrée à travers lequel le terminal reçoit les données. Par défaut, il s'agit de votre clavier.
2. **1 : Sortie standard (stdout)** : C'est le flux de sortie où le terminal affiche les données. Par défaut, il s'agit de votre écran.
3. **2 : Erreur standard (stderr)** : C'est un flux de sortie dédié aux messages d'erreur. Par défaut, il s'affiche également sur votre écran.

## Redirections

Les redirections permettent de diriger les flux d'entrées et de sorties vers des fichiers ou à partir de fichiers, au lieu des sources et destinations par défaut.

### Rediriger la sortie standard

Pour enregistrer la sortie d'une commande dans un fichier, utilisez le caractère `>` suivi du nom du fichier.

```bash
ls > liste_des_fichiers.txt
```

Cette commande redirige la sortie de `ls` vers `liste_des_fichiers.txt`.

### Rediriger l'erreur standard

Utilisez `2>` pour rediriger les erreurs.

```bash
commande_inexistante 2> erreur.txt
```

Les erreurs de `commande_inexistante` seront écrites dans `erreur.txt`.

### Rediriger à la fois la sortie standard et l'erreur standard

```bash
commande > sortie_et_erreur.txt 2>&1
```
```bash
commande > /dev/null 2>&1
```

Ou, de manière plus concise avec la syntaxe `&>` :

```bash
commande &> sortie_et_erreur.txt
```

### Rediriger l'entrée standard

Utilisez `<` pour rediriger l'entrée standard depuis un fichier.

```bash
sort < liste_des_fichiers.txt
```

Cette commande triera le contenu de `liste_des_fichiers.txt`.

### Pipelines

Les pipelines utilisent le caractère `|` pour passer la sortie standard d'une commande comme entrée standard à une autre.

```bash
ls | sort
```

Cette commande liste les fichiers et dossiers puis trie cette liste.

### Exemples avancés

- #### **Compter le nombre de fichiers dans un répertoire** :

  ```bash
  ls | wc -l
  ```

  `wc -l` compte le nombre de lignes, ce qui, dans ce cas, correspond au nombre de fichiers.

- #### **Trouver un fichier spécifique** :

  ```bash
  ls -R | grep 'nom_du_fichier'
  ```

  `ls -R` liste tous les fichiers récursivement, et `grep` filtre cette liste pour afficher seulement ceux qui correspondent à 'nom_du_fichier'.

- #### Créer un fichier sans commande d'entrée

    ```bash
    > fichier_vide.txt
    ```

    Cela crée un nouveau fichier vide `fichier_vide.txt` ou écrase un fichier existant avec un fichier vide, sans avoir besoin d'une commande qui génère une sortie.

- #### Concaténer des fichiers en redirigeant l'entrée

```bash
cat > nouveau_fichier.txt << EOF
Texte ligne 1
Texte ligne 2
EOF
```
    

Ceci utilise l'opérateur `<<` pour rediriger un bloc de texte (délimité par `EOF` dans ce cas) vers `cat`, qui à son tour le redirige vers `nouveau_fichier.txt`. C'est utile pour écrire plusieurs lignes de texte dans un fichier directement depuis le terminal.

- ### Manipulation et analyse des flux d'E/S

Les outils comme `grep`, `awk`, et `sed` permettent de manipuler et d'analyser les données à l'intérieur de ces flux.

- **Filtrer la sortie** : `grep 'motif'` extrait les lignes contenant 'motif'.
- **Analyse et transformation** : `awk '{print $1}'` imprime la première colonne de chaque ligne.
- **Édition en flux** : `sed 's/ancien/nouveau/g'` remplace toutes les occurrences de 'ancien' par 'nouveau'.


### Exemple : Dupliquer des descripteurs

Imaginons que vous voulez rediriger à la fois stdout et stderr vers le même fichier mais également conserver stderr sur l'écran. Ceci peut être accompli en dupliquant le descripteur de stderr avant de le rediriger.

```bash
commande 2>&1 1>fichier.log | tee erreur.log
```

Cette commande complexe fait plusieurs choses :
1. `2>&1` redirige stderr vers la destination courante de stdout (l'écran, dans ce cas).
2. `1>fichier.log` redirige ensuite stdout (qui inclut maintenant ce qui était destiné à stderr) vers `fichier.log`.
3. `| tee erreur.log` prend la sortie de stderr (avant qu'elle soit redirigée) et la duplique dans `erreur.log` tout en la laissant s'afficher à l'écran.

#### Utilisation de `tee` pour la duplication de sortie

La commande `tee` est utilisée pour lire depuis l'entrée standard et écrire à la fois dans la sortie standard et dans un fichier. Cela est particulièrement utile pour conserver une trace de la sortie d'une commande tout en visualisant cette sortie en temps réel.

```bash
ls | tee liste_des_fichiers.txt
```

Cette commande affiche la sortie de `ls` dans le terminal et écrit également cette sortie dans `liste_des_fichiers.txt`.

---

<!-- File: hstr.md -->

# Tutoriel et Documentation Complète sur HSTR (HISTory ReSearch)

## Introduction

HSTR (HISTory ReSearch) est un outil de ligne de commande qui améliore la façon dont vous recherchez dans l'historique des commandes bash et zsh. Il permet une recherche facile et une gestion de l'historique des commandes, offrant une interface interactive pour trouver et exécuter rapidement des commandes précédentes.

## Installation

**Sur Ubuntu/Debian :**

```bash
sudo add-apt-repository ppa:ultradvorka/ppa
sudo apt-get update
sudo apt-get install hstr
```

**Sur Fedora :**

```bash
sudo dnf install hstr
```

**Sur Arch Linux :**

```bash
yay -S hstr
```

## Configuration

Pour configurer HSTR pour bash, ajoutez ceci à votre `~/.bashrc` :

```bash
export HSTR_CONFIG=hicolor         # optionnel: personnalisez la configuration
bind '"\C-r": "\C-a hstr -- \C-j"' # bind Ctrl-r pour lancer HSTR
```

Pour zsh, ajoutez ceci à votre `~/.zshrc` :

```bash
bindkey -s "\C-r" "\C-a hstr -- \C-j"
```

Après modification, rechargez votre shell :

```bash
source ~/.bashrc # ou ~/.zshrc
```

## Options et Paramètres

- `--show-configuration` ou `-s`: Affiche les instructions de configuration pour bash/zsh.
- `--help` ou `-h` : Affiche l'aide.
- `--version` ou `-V` : Affiche la version de HSTR.
- `--favorites` ou `-f` : Gère les commandes favorites.
- `--non-interactive` ou `-n`: Affiche l'historique sans entrer dans l'interface utilisateur interactive.

## Utilisation de Base

Appuyez sur `Ctrl-r` pour lancer HSTR. Tapez pour rechercher dans l'historique. Utilisez les flèches pour naviguer et `Enter` pour exécuter une commande.

## Exemples d'Utilisation

### Recherche et Exécution d'une Commande

1. **Lancer HSTR** : Appuyez sur `Ctrl-r`.
2. **Recherche** : Commencez à taper les premiers caractères de votre commande. HSTR filtre les résultats en temps réel.
3. **Navigation** : Utilisez les flèches haut/bas pour sélectionner une commande.
4. **Exécution** : Appuyez sur `Enter` pour exécuter la commande sélectionnée.

### Ajout aux Favoris

1. Sélectionnez une commande avec les flèches.
2. Appuyez sur `Ctrl-f` pour ajouter/retirer la commande des favoris.

### Affichage et Sélection à partir des Favoris

- Lancez HSTR et appuyez sur `Ctrl-f` pour basculer vers l'affichage des favoris. Sélectionnez et exécutez comme d'habitude.

### Filtrage Non-Interactif

Pour afficher les commandes contenant `git` sans entrer en mode interactif :

```bash
hstr --non-interactive git
```

## Personnalisation

HSTR peut être personnalisé via la variable d'environnement `HSTR_CONFIG`. Exemple :

```bash
export HSTR_CONFIG='hicolor,keywords'
```

- `hicolor` : Utilise des couleurs vives pour l'interface.
- `keywords` : Active le filtrage par mots-clés.

## Conclusion

HSTR est un outil puissant et flexible pour gérer l'historique de commande de manière efficace. Il offre une recherche rapide, la gestion des favoris, et une interface utilisateur intuitive pour retrouver et réexécuter des commandes. Sa personnalisation et ses options avancées le rendent inestimable pour tout utilisateur de terminal cherchant à optimiser son flux de travail.

---

<!-- File: tmux.md -->

- [Installation de `tmux` sur Debian](#installation-de-tmux-sur-debian)
- [Démarrage avec `tmux`](#démarrage-avec-tmux)
- [Commandes de base](#commandes-de-base)
- [Gestion des fenêtres](#gestion-des-fenêtres)
- [Division en panneaux](#division-en-panneaux)
- [Personnalisation de `tmux`](#personnalisation-de-tmux)
  - [Changement du Préfixe](#changement-du-préfixe)
  - [Amélioration de l'Apparence](#amélioration-de-lapparence)
  - [Gestion des fenêtres et des panneaux](#gestion-des-fenêtres-et-des-panneaux)
  - [Raccourcis Clavier](#raccourcis-clavier)
  - [Autres fonctionnalités](#autres-fonctionnalités)
- [Listes de raccourcis](#listes-de-raccourcis)
  - [Gestion des sessions](#gestion-des-sessions)
  - [Gestion des fenêtres](#gestion-des-fenêtres-1)
  - [Gestion des panneaux](#gestion-des-panneaux)
  - [Autres commandes utiles](#autres-commandes-utiles)

### Installation de `tmux` sur Debian

1. **Ouvrez un terminal**.
2. Mettez à jour la liste des paquets de votre système avec la commande :
   ```
   sudo apt update
   ```
3. Installez `tmux` en exécutant :
   ```
   sudo apt install tmux
   ```

### Démarrage avec `tmux`

Pour démarrer une nouvelle session `tmux`, ouvrez un terminal et tapez :
```
tmux
```
Vous entrerez dans une nouvelle session `tmux`. Par défaut, vous ne verrez pas beaucoup de différence, mais vous êtes maintenant à l'intérieur d'une session `tmux`.

### Commandes de base

- **Démarrer une nouvelle session** : `tmux new -s nom_session`
- **Lister les sessions actives** : `tmux ls`
- **Attacher à une session existante** : `tmux attach -t nom_session`
- **Détacher de la session actuelle** : `Ctrl+b d`

### Gestion des fenêtres

Dans `tmux`, les fenêtres fonctionnent comme des onglets dans un navigateur.

- **Créer une nouvelle fenêtre** : `Ctrl+b c`
- **Changer de fenêtre** : `Ctrl+b numéro_fenêtre`
- **Renommer la fenêtre actuelle** : `Ctrl+b ,`

### Division en panneaux

`tmux` permet également de diviser une fenêtre en plusieurs panneaux.

- **Diviser verticalement** : `Ctrl+b %`
- **Diviser horizontalement** : `Ctrl+b "`
- **Naviguer entre les panneaux** : `Ctrl+b flèche_directionnelle`

### Personnalisation de `tmux`

Vous pouvez personnaliser `tmux` en modifiant le fichier de configuration `~/.tmux.conf`. Par exemple, pour changer le raccourci préfixe de `Ctrl+b` à `Ctrl+a`, ajoutez la ligne suivante à votre fichier `~/.tmux.conf` :

```
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```

Redémarrez `tmux` ou rechargez la configuration pour que les changements prennent effet.

La personnalisation de `tmux` se fait principalement à travers le fichier de configuration `~/.tmux.conf`. Vous pouvez modifier ce fichier pour ajuster l'apparence, le comportement des sessions, fenêtres, et panneaux, ainsi que pour redéfinir ou créer des raccourcis clavier. Voici une liste de personnalisation populaire que vous pouvez appliquer à `tmux` :

#### Changement du Préfixe

Modifier la touche préfixe (par défaut `Ctrl+b`) pour quelque chose de plus facile à atteindre, comme `Ctrl+a` :

```tmux
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```

#### Amélioration de l'Apparence

- **Définir le thème des barres de statut** : Changer la couleur ou le format de la barre de statut.

    ```tmux
    set -g status-bg cyan
    set -g status-fg black
    set -g status-interval 60
    set -g status-left '#[fg=green](#S) '
    set -g status-right '#[fg=yellow]#(uptime | cut -d "," -f 1-2)'
    ```

- **Personnaliser le panneau de sélection de fenêtres** : Modifier l'apparence de la liste des fenêtres lors de l'utilisation de `Ctrl+b w`.

    ```tmux
    setw -g window-status-current-bg red
    ```

#### Gestion des fenêtres et des panneaux

- **Définir la réindexation automatique des fenêtres** : Pour que les numéros de fenêtres soient toujours consécutifs sans aucun trou.

    ```tmux
    set -g renumber-windows on
    ```

- **Configurer le découpage automatique des panneaux** : Pour définir le comportement par défaut lors de la création de nouveaux panneaux.

    ```tmux
    bind | split-window -h
    bind - split-window -v
    setw -g automatic-rename on
    ```

#### Raccourcis Clavier

- **Créer des raccourcis pour redimensionner les panneaux** :

    ```tmux
    bind -r H resize-pane -L 5
    bind -r J resize-pane -D 5
    bind -r K resize-pane -U 5
    bind -r L resize-pane -R 5
    ```

- **Définir des raccourcis pour naviguer entre les panneaux avec Vim keybindings** :

    ```tmux
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R
    ```

#### Autres fonctionnalités

- **Augmenter l'historique du tampon de défilement** :

    ```tmux
    set -g history-limit 10000
    ```

- **Utiliser des couleurs 256 couleurs** :

    ```tmux
    set -g default-terminal "screen-256color"
    ```

- **Démarrage automatique de sessions et de fenêtres** : Vous pouvez configurer `tmux` pour démarrer automatiquement avec plusieurs sessions, fenêtres, et même exécuter des commandes dans ces fenêtres.

```tmux
new-session -d -s 'Session1'
new-window -t 'Session1:1' -n 'Window1'
new-window -t 'Session1:2' -n 'Window2'
send-keys -t 'Session1:1' 'cd /mon/dossier/projet && clear' C-m
```

Ces personnalisations ne sont que la pointe de l'iceberg en termes de ce que vous pouvez réaliser avec `tmux`. En explorant la documentation et les ressources communautaires, vous découvrirez une richesse d'options pour rendre votre expérience `tmux` aussi efficace et agréable que possible.


### Listes de raccourcis

Les raccourcis clavier jouent un rôle crucial dans la manipulation efficace de `tmux`, permettant de contrôler les sessions, les fenêtres, et les panneaux rapidement. Voici une liste exhaustive des raccourcis `tmux` les plus couramment utilisés, en supposant que le préfixe par défaut `Ctrl+b` est conservé. Pour activer un raccourci, vous devez d'abord appuyer sur `Ctrl+b`, puis relâcher ces touches, et enfin presser la touche du raccourci.

#### Gestion des sessions

- **Démarrer une nouvelle session** : `tmux new -s nom_session`
- **Lister toutes les sessions** : `tmux ls`
- **Attacher à une session nommée/détachée** : `tmux attach -t nom_session`
- **Détacher de la session actuelle** : `Ctrl+b d`
- **Passer à la session suivante** : `Ctrl+b )`
- **Passer à la session précédente** : `Ctrl+b (`
- **Renommer la session actuelle** : `Ctrl+b $`

#### Gestion des fenêtres

- **Créer une nouvelle fenêtre** : `Ctrl+b c`
- **Fermer la fenêtre actuelle** : `Ctrl+b &`
- **Passer à la fenêtre suivante** : `Ctrl+b n`
- **Passer à la fenêtre précédente** : `Ctrl+b p`
- **Sélectionner une fenêtre par son numéro** : `Ctrl+b numéro`
- **Renommer la fenêtre actuelle** : `Ctrl+b ,`
- **Trouver une fenêtre** : `Ctrl+b f`

#### Gestion des panneaux

- **Diviser le panneau actuel horizontalement** : `Ctrl+b "`
- **Diviser le panneau actuel verticalement** : `Ctrl+b %`
- **Fermer le panneau actuel** : `Ctrl+b x`
- **Passer au panneau suivant** : `Ctrl+b o`
- **Échanger le panneau actuel avec le suivant** : `Ctrl+b ;`
- **Sélectionner un panneau spécifique** : `Ctrl+b q` (puis appuyez sur le numéro du panneau)
- **Redimensionner le panneau** : `Ctrl+b` suivi de l'une des flèches directionnelles
- **Passer en mode de redimensionnement** : `Ctrl+b :` puis tapez `resize-pane` suivi de `-D`, `-U`, `-L`, `-R` pour déplacer les bordures du panneau vers le bas, le haut, la gauche ou la droite respectivement.

#### Autres commandes utiles

- **Lister toutes les commandes** : `Ctrl+b ?`
- **Passer en mode copie** : `Ctrl+b [`
- **Coller le tampon** : `Ctrl+b ]`
- **Capturer le contenu d'un panneau** : `Ctrl+b :` puis tapez `capture-pane`
- **Sauvegarder le contenu capturé** : `Ctrl+b :` puis tapez `save-buffer fichier.txt`
- **Recharger la configuration tmux** : `tmux source-file ~/.tmux.conf`

Ces raccourcis et commandes offrent un point de départ solide pour naviguer et manipuler efficacement `tmux`. La personnalisation de ces raccourcis via le fichier `~/.tmux.conf` peut encore améliorer votre productivité et adapter l'outil à vos préférences spécifiques.

---

<!-- File: tty_clock.md -->

# Tutoriel et Documentation Complète sur `tty-clock`

## Introduction

`tty-clock` est une horloge simple mais élégante pour le terminal. Elle affiche l'heure et, optionnellement, la date, dans un format numérique. Elle est particulièrement appréciée pour son faible encombrement et sa facilité d'utilisation dans des environnements de terminal ou des TTYs.

## Installation

`tty-clock` peut ne pas être disponible dans les dépôts officiels de toutes les distributions Linux, mais elle peut souvent être trouvée dans les dépôts communautaires ou compilée à partir des sources.

- Sur **Arch Linux** (disponible sur AUR) :

  ```bash
  yay -S tty-clock
  ```

- Compilation à partir des sources (pour les autres distributions) :

  ```bash
  git clone https://github.com/xorg62/tty-clock.git
  cd tty-clock
  make
  sudo make install
  ```

## Options et Paramètres

`tty-clock` offre plusieurs options de ligne de commande pour personnaliser l'affichage :

- `-C [0-7]` : Définit la couleur de l'horloge (selon les couleurs du terminal).
- `-B` : Active l'utilisation d'un fond coloré pour les chiffres.
- `-b` : Active le mode "gras" pour les chiffres.
- `-c` : Centre l'horloge dans le terminal.
- `-d` : Active l'affichage de la date.
- `-D` : Active l'affichage des secondes.
- `-f` : Active l'utilisation de la police par défaut (désactive `-B` et `-b`).
- `-r` : Active l'affichage en mode 12 heures avec AM/PM.
- `-s` : Active l'effet de défilement des chiffres.
- `-t` : Active l'affichage des secondes sous forme de texte.
- `-x [num]` : Définit la position horizontale de l'horloge.
- `-y [num]` : Définit la position verticale de l'horloge.
- `-h` : Affiche l'aide et quitte.
- `-v` : Affiche la version et quitte.

## Exemples d'Utilisation de `tty-clock`

### Lancer `tty-clock` avec la Couleur par Défaut

```bash
tty-clock
```

### Lancer `tty-clock` avec une Couleur Spécifique

Pour afficher l'horloge en cyan :

```bash
tty-clock -C 6
```

### Afficher l'Horloge et la Date au Centre du Terminal

```bash
tty-clock -c -d
```

### Afficher l'Horloge avec les Secondes

```bash
tty-clock -D
```

### Utiliser le Mode 12 Heures avec AM/PM

```bash
tty-clock -r
```

### Personnaliser la Position de l'Horloge

Pour placer l'horloge en bas à droite du terminal :

```bash
tty-clock -x [largeur_terminal] -y [hauteur_terminal]
```
Notez que `[largeur_terminal]` et `[hauteur_terminal]` doivent être remplacés par des valeurs numériques appropriées.

### Afficher l'Horloge avec un Fond Coloré

```bash
tty-clock -B
```

## Bonnes Pratiques

- **Personnalisation** : Utilisez les options de `tty-clock` pour personnaliser l'affichage selon vos préférences ou besoins. Cela peut être particulièrement utile pour intégrer l'horloge dans des environnements de travail spécifiques.
- **Utilisation dans des Scripts** : `tty-clock` peut être lancé dans des scripts shell pour fournir une horloge visuelle lors de l'exécution de tâches de longue durée dans le terminal.
- **Utilisation en Tant que Réveil** : Avec l'option `-D`, `tty-clock` peut servir de réveil simple lorsque vous travaillez tard.

## Conclusion

`tty-clock` est un outil simple mais flexible pour afficher l'heure dans le terminal, offrant diverses options de personnalisation. Que vous cherchiez à ajouter un peu de flair à votre terminal ou que vous ayez besoin d'une horloge visible pendant que vous travaillez, `tty-clock` est une excellente solution.

---

<!-- File: zsh_ohmyzsh.md -->

- [Étape 1: Installation de Zsh](#étape-1-installation-de-zsh)
- [Étape 2: Configurer Zsh comme shell par défaut](#étape-2-configurer-zsh-comme-shell-par-défaut)
- [Étape 3: Configuration initiale de Zsh](#étape-3-configuration-initiale-de-zsh)
- [Étape 4: Installation d'Oh My Zsh (Optionnel)](#étape-4-installation-doh-my-zsh-optionnel)
- [Étape 5: Personnalisation de Zsh](#étape-5-personnalisation-de-zsh)
- [Étape 6: plugins](#étape-6-plugins)
  - [download syntax highlighting extension](#download-syntax-highlighting-extension)
  - [download Auto-completion extension](#download-auto-completion-extension)


L'installation et la configuration de Zsh (Z Shell) sous Debian sont relativement simples et peuvent rendre votre expérience en ligne de commande plus agréable grâce à des fonctionnalités comme l'autocomplétion améliorée, les thèmes, et bien plus encore. Voici un guide étape par étape pour installer et configurer Zsh sur Debian.

### Étape 1: Installation de Zsh

1. **Ouvrir le terminal**: La première étape consiste à ouvrir votre terminal.

2. **Mise à jour de la liste des paquets**: Avant d'installer de nouveaux paquets, il est recommandé de mettre à jour la liste des paquets disponibles pour s'assurer que vous installez les dernières versions. Exécutez la commande suivante:

   ```sh
   sudo apt update
   ```

3. **Installation de Zsh**: Une fois la liste des paquets mise à jour, installez Zsh en exécutant la commande suivante:

   ```sh
   sudo apt install zsh
   ```

4. **Vérification de l'installation**: Après l'installation, vous pouvez vérifier la version de Zsh installée pour confirmer que tout s'est bien passé:

   ```sh
   zsh --version
   ```

5. **Une fois que vous avez modifier le fichier .zshrc**, vous pouvez soit relancer le terminal, soit rentrer la commande:

    ```sh
    .zshrc
    ```

### Étape 2: Configurer Zsh comme shell par défaut

1. **Changer le shell par défaut**: Pour utiliser Zsh comme votre shell par défaut, utilisez la commande `chsh` (change shell). Vous devrez entrer votre mot de passe.

   ```sh
   chsh -s $(which zsh)
   ```

2. **Déconnexion et reconnexion**: Pour que le changement prenne effet, vous devrez vous déconnecter et vous reconnecter à votre session utilisateur. Alternativement, vous pouvez redémarrer votre terminal.

### Étape 3: Configuration initiale de Zsh

1. **Premier lancement de Zsh**: Lorsque vous lancez Zsh pour la première fois, vous serez accueilli par un assistant de configuration (`zsh-newuser-install`). Vous pouvez choisir de suivre l'assistant pour configurer les paramètres de base ou appuyer sur `q` pour quitter et configurer Zsh manuellement.

### Étape 4: Installation d'Oh My Zsh (Optionnel)

Oh My Zsh est un framework open-source pour gérer votre configuration Zsh. Il vient avec un grand nombre de thèmes et de plugins pour améliorer votre expérience en ligne de commande.

1. **Installer curl ou wget**: Assurez-vous que `curl` ou `wget` est installé pour télécharger le script d'installation.

   ```sh
   sudo apt install curl
   ```

2. **Installation d'Oh My Zsh**: Exécutez la commande suivante pour installer Oh My Zsh:

   ```sh
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

   Alternativement, si vous préférez `wget`:

   ```sh
   sh -c "$(wget -O- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

### Étape 5: Personnalisation de Zsh

Après avoir installé Oh My Zsh, vous pouvez personnaliser votre shell en éditant le fichier de configuration `~/.zshrc`. Vous pouvez changer le thème, activer des plugins, et ajuster d'autres paramètres selon vos préférences.

```sh
nano ~/.zshrc
```

Par exemple, pour changer de thème, modifiez la ligne `ZSH_THEME="robbyrussell"` par un autre nom de thème disponible dans le répertoire des thèmes d'Oh My Zsh.

### Étape 6: plugins 

#### download syntax highlighting extension

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- Then activate the plugin by updating the .zshrc file.

```sh
# add syntax highlighting to the list of plugins in your ~/.zshrc file
plugins=(zsh-syntax-highlighting)
```

#### download Auto-completion extension

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- Then activate the plugin by updating the .zshrc file.

    ```shqq
    # update plugins in your ~/.zshrc file
    plugins=(
        zsh-syntax-highlighting 
        zsh-autosuggestions
    )
    ```


---

<!-- File: base64.md -->

---
title: base64
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour la commande `base64` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `base64`](#fonctionnement-de-la-commande-base64)
3. [Syntaxe de la commande `base64`](#syntaxe-de-la-commande-base64)
4. [Options de la commande `base64`](#options-de-la-commande-base64)
    - [Option `-d` (decode)](#option--d-decode)
    - [Option `-i` (ignore-garbage)](#option--i-ignore-garbage)
    - [Option `-w` (wrap)](#option--w-wrap)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Encoder un fichier en base64](#exemple-1--encoder-un-fichier-en-base64)
    - [Exemple 2 : Décoder un fichier base64](#exemple-2--décoder-un-fichier-base64)
    - [Exemple 3 : Encoder une chaîne de texte en base64](#exemple-3--encoder-une-chaîne-de-texte-en-base64)
    - [Exemple 4 : Décoder une chaîne base64](#exemple-4--décoder-une-chaîne-base64)
    - [Exemple 5 : Ignorer les caractères non base64 lors du décodage](#exemple-5--ignorer-les-caractères-non-base64-lors-du-décodage)
6. [Conclusion](#conclusion)

## Introduction

La commande `base64` sous Linux est utilisée pour encoder et décoder des données en base64. L'encodage base64 est couramment utilisé pour représenter des données binaires sous forme de texte ASCII, ce qui est utile pour le transfert de données sur des réseaux qui ne sont pas 8-bit propres, comme les emails.

## Fonctionnement de la commande `base64`

La commande `base64` lit les données d'un fichier ou de l'entrée standard et les encode en base64, ou bien elle décode des données encodées en base64. Le résultat est envoyé vers la sortie standard, ou peut être redirigé vers un fichier.

## Syntaxe de la commande `base64`

```bash
base64 [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à encoder ou décoder. Si aucun fichier n'est spécifié, `base64` lit l'entrée standard.

## Options de la commande `base64`

### Option `-d` (decode)

Décode les données encodées en base64.

```bash
base64 -d [fichier]
```

### Option `-i` (ignore-garbage)

Ignore les caractères non base64 lors du décodage.

```bash
base64 -i [fichier]
```

### Option `-w` (wrap)

Enveloppe la sortie encodée en base64 à tous les `n` caractères (par défaut, 76). Utilisez `0` pour désactiver l'enveloppement.

```bash
base64 -w <n> [fichier]
```

## Exemples concrets

### Exemple 1 : Encoder un fichier en base64

Pour encoder le fichier `example.txt` en base64 :

```bash
base64 example.txt
```

**Sortie :**

```
U29tZSBleGFtcGxlIHRleHQgdG8gYmUgZW5jb2RlZCBpbiBiYXNlNjQu
```

### Exemple 2 : Décoder un fichier base64

Pour décoder le fichier `example.b64` encodé en base64 :

```bash
base64 -d example.b64
```

**Sortie :**

```
Some example text to be encoded in base64.
```

### Exemple 3 : Encoder une chaîne de texte en base64

Pour encoder une chaîne de texte `Hello, World!` en base64 :

```bash
echo -n "Hello, World!" | base64
```

**Sortie :**

```
SGVsbG8sIFdvcmxkIQ==
```

### Exemple 4 : Décoder une chaîne base64

Pour décoder une chaîne base64 `SGVsbG8sIFdvcmxkIQ==` :

```bash
echo "SGVsbG8sIFdvcmxkIQ==" | base64 -d
```

**Sortie :**

```
Hello, World!
```

### Exemple 5 : Ignorer les caractères non base64 lors du décodage

Pour décoder un fichier `example.b64` en ignorant les caractères non base64 :

```bash
base64 -di example.b64
```

**Explication :** Cette commande décode les données du fichier `example.b64` en ignorant les caractères non base64, ce qui peut être utile si le fichier contient des caractères parasites.

## Conclusion

La commande `base64` est un outil puissant pour encoder et décoder des données en base64 sous Linux. En utilisant ses différentes options, vous pouvez personnaliser l'encodage et le décodage des données selon vos besoins. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man base64` ou la documentation officielle de votre distribution Linux.

---

<!-- File: bc.md -->



---

<!-- File: find-mkdocs.md -->

La commande `find` sous Linux est un outil extrêmement puissant et flexible pour rechercher des fichiers dans un système de fichiers. Voici une vue d'ensemble structurée et approfondie de son utilisation :

- [Documentation de Base de `find`](#documentation-de-base-de-find)
  - [1. **Syntaxe Générale** :](#1-syntaxe-générale-)
    - [Paramètres](#paramètres)
    - [Options Principales d'Expression de Recherche](#options-principales-dexpression-de-recherche)
      - [-name pattern](#-name-pattern)
      - [-iname pattern](#-iname-pattern)
      - [-type c](#-type-c)
      - [-size n\[сwbkMG\]](#-size-nсwbkmg)
      - [-mtime n](#-mtime-n)
      - [-user nomUtilisateur](#-user-nomutilisateur)
      - [-group nomGroupe](#-group-nomgroupe)
      - [-perm mode](#-perm-mode)
      - [-exec commande {} ;](#-exec-commande--)
      - [-ok commande {} ;](#-ok-commande--)
      - [-prune](#-prune)
      - [-delete](#-delete)
    - [Autres Options Utiles](#autres-options-utiles)
      - [-ctime n](#-ctime-n)
      - [-atime n](#-atime-n)
      - [-depth](#-depth)
      - [-maxdepth levels](#-maxdepth-levels)
      - [-mindepth levels](#-mindepth-levels)
    - [Combinaison d'Expressions](#combinaison-dexpressions)
  - [2. grouper des conditions ou des expressions :](#2-grouper-des-conditions-ou-des-expressions-)
  - [3. Exlure par -iname ou -name](#3-exlure-par--iname-ou--name)
    - [version avec ((... -o ...)) -prune -o](#version-avec---o---prune--o)
    - [version avec  grep](#version-avec--grep)
    - [version avec  !](#version-avec--)
- [Exemples d'Utilisation de Base](#exemples-dutilisation-de-base)
  - [1. **Trouver des Fichiers par Nom** :](#1-trouver-des-fichiers-par-nom-)
  - [2. **Recherche de Dossiers** :](#2-recherche-de-dossiers-)
  - [3. **Recherche par Taille de Fichier** :](#3-recherche-par-taille-de-fichier-)
  - [4. **Recherche par Date de Modification** :](#4-recherche-par-date-de-modification-)
- [Utilisation avec Pipe pour Afficher la Taille](#utilisation-avec-pipe-pour-afficher-la-taille)
  - [1. **Taille des Fichiers Trouvés** :](#1-taille-des-fichiers-trouvés-)
  - [2. **Taille des Dossiers Trouvés** :](#2-taille-des-dossiers-trouvés-)
- [Autres Exemples Courants](#autres-exemples-courants)
  - [1. **Trouver et Supprimer** :](#1-trouver-et-supprimer-)
  - [2. **Trouver et Compresser** :](#2-trouver-et-compresser-)
    - [Autres Exemples avec Pipe](#autres-exemples-avec-pipe)
  - [1. **Lister et Trier par Taille** :](#1-lister-et-trier-par-taille-)
  - [2. **Trouver et Afficher le Contenu** :](#2-trouver-et-afficher-le-contenu-)
- [Commandes utiles](#commandes-utiles)
- [Conclusion](#conclusion)


# Documentation de Base de `find`

## 1. **Syntaxe Générale** : 
   ```bash
   find [chemin...] [option...] [expression de recherche...]
   ```
  - **chemin...** : Dossiers où commencer la recherche.
  - **expression** : Critères de recherche et actions.

### Paramètres

- **chemin...** : Spécifie le(s) répertoire(s) de départ pour la recherche. Si aucun chemin n'est donné, `find` utilise le répertoire courant par défaut.

### Options Principales d'Expression de Recherche

#### -name pattern
- Recherche des fichiers dont le nom correspond exactement au motif spécifié. Les caractères jokers comme `*` (remplace n'importe quelle chaîne de caractères) et `?` (remplace un seul caractère) peuvent être utilisés.
- Exemple : `find . -name "*.txt"` trouve tous les fichiers `.txt` dans le répertoire courant et ses sous-dossiers.

#### -iname pattern
- Comme `-name`, mais la recherche est insensible à la casse.
- Exemple : `find . -iname "readme.*"` trouvera "README.txt", "readme.md", "ReadMe.TXT", etc.

#### -type c
- Recherche des fichiers d'un type spécifié par `c`. Les valeurs courantes incluent `f` pour les fichiers réguliers, `d` pour les dossiers, et `l` pour les liens symboliques.
- Exemple : `find . -type d` liste tous les dossiers.

#### -size n[сwbkMG]
- Recherche des fichiers par taille. `n` peut être suivi par :
  - `c` pour les octets,
  - `w` pour les mots de deux octets,
  - `b` pour les blocs de 512 octets,
  - `k` pour les kilo-octets,
  - `M` pour les méga-octets,
  - `G` pour les giga-octets.
- Exemple : `find . -size +1M` trouve les fichiers de plus de 1 méga-octet.

#### -mtime n
- Recherche des fichiers modifiés il y a `n` * 24 heures. `+n` pour plus que `n` jours, `-n` pour moins.
- Exemple : `find . -mtime -7` trouve les fichiers modifiés dans les derniers 7 jours.

#### -user nomUtilisateur
- Recherche des fichiers appartenant à l'utilisateur spécifié.
- Exemple : `find . -user adrien` trouve tous les fichiers appartenant à "adrien".

#### -group nomGroupe
- Recherche des fichiers appartenant au groupe spécifié.
- Exemple : `find . -group adrien` trouve tous les fichiers appartenant au groupe "adrien".

#### -perm mode
- Recherche des fichiers avec les permissions spécifiées. Le mode peut être spécifié symboliquement ou en octal.
- Exemple : `find . -perm 644` trouve les fichiers avec des permissions `644`.

#### -exec commande {} \;
- Exécute une commande sur chaque fichier trouvé. `{}` est remplacé par le chemin du fichier trouvé.
- Exemple : `find . -type f -exec chmod 644 {} \;` change les permissions de tous les fichiers en `644`.
- `commande` est la commande que vous souhaitez exécuter sur chaque fichier ou dossier trouvé.
- `{}` est remplacé par le chemin du fichier ou du dossier trouvé par `find`.
- `\;` termine la commande que vous souhaitez exécuter avec `-exec`. Le backslash `\` est utilisé pour échapper le caractère `;`, car sans le backslash, le shell interpréterait `;` comme la fin de la commande `find` elle-même, et non comme une partie de l'argument pour `-exec`.

   En d'autres termes, `\;` est nécessaire pour faire comprendre au shell et à la commande `find` que la fin de la commande spécifiée avec `-exec` a été atteinte, et que ce n'est pas la fin de la commande `find` principale.


#### -ok commande {} \;
- Identique à `-exec`, mais demande une confirmation avant d'exécuter chaque commande.
- Exemple : `find . -type f -ok rm {} \;` demande avant de supprimer chaque fichier trouvé.

#### -prune
- Empêche `find` de descendre dans les sous-dossiers du dossier actuel s'il correspond au motif de recherche.
- Exemple : `find . -type d -name ".git" -prune -o -print` liste tous les fichiers et dossiers, en excluant les dossiers `.git` et leur contenu.

#### -delete
- Supprime les fichiers ou dossiers trouvés (avec prudence).
- Exemple : `find . -type f -name "*.bak" -delete` supprime tous les fichiers avec l'extension `.bak`.

### Autres Options Utiles

#### -ctime n
- Recherche des fichiers par leur "ctime" (le temps de changement du statut du fichier) les derniers `n` jours.
- Exemple : `find . -ctime -5` trouve les fichiers dont le statut a changé dans les 5 derniers jours.

#### -atime n
- Recherche des fichiers accédés dans les derniers `n` jours.
- Exemple : `find . -atime -2` trouve les fichiers qui ont été accédés dans les 2 derniers jours.

#### -depth
- Indique à `find` de traiter chaque répertoire après ses sous-dossiers. Utile pour les actions qui modifient la structure du dossier, comme supprimer.
- Exemple : `find . -depth -type d -empty -delete` supprime les dossiers vides.

#### -maxdepth levels
- Limite la recherche à une certaine profondeur de répertoires.
- Exemple : `find . -maxdepth 2 -name "*.txt"` cherche les fichiers `.txt` seulement jusqu'à 2 niveaux de profondeur.

#### -mindepth levels
- Ignore les niveaux de répertoires spécifiés au début de la recherche.
- Exemple : `find . -mindepth 2 -name "*.txt"` cherche les fichiers `.txt` en ignorant le répertoire courant et ses sous-dossiers immédiats.


### Combinaison d'Expressions

- **expression1 -a expression2** : Opérateur logique "ET", souvent omis car c'est le comportement par défaut.
- **expression1 -o expression2** : Opérateur logique "OU".
- **! expression** : Opérateur logique "NON".
- **\( expression \)** : Groupe des expressions pour contrôler l'ordre d'évaluation (les backslashes sont nécessaires pour échapper les parenthèses au shell).

## 2. grouper des conditions ou des expressions : 

Les symboles `\( ... \)` dans une commande `find` sous Linux sont utilisés pour grouper des conditions ou des expressions. Le but est de contrôler l'ordre d'évaluation des expressions et de s'assurer que certaines opérations logiques sont effectuées ensemble, un peu comme les parenthèses sont utilisées en mathématiques pour grouper des nombres et des opérations.

Dans le contexte des commandes shell comme `find`, les parenthèses ont une signification spéciale et peuvent être interprétées par le shell avant que `find` ne les reçoive. Pour éviter cette interprétation précoce par le shell et s'assurer que les parenthèses sont passées à `find` comme partie de son expression de recherche, on les échappe avec un backslash `\`, d'où `\( ... \)`.

Par exemple, considérez la commande suivante :

```bash
find /chemin/ -type d \( -iname "*gsdata*" -o -iname "*tuto*" \) -prune -o -iname "*apprentissage*" -print
```

Ici, `\( ... \)` est utilisé pour grouper `-iname "*gsdata*" -o -iname "*tuto*"` comme une seule condition logique. Cela signifie que `find` évaluera cette condition en tant qu'unité, appliquant `-prune` aux dossiers qui correspondent soit à `*gsdata*`, soit à `*tuto*`. Sans ces parenthèses, l'ordre des opérations pourrait ne pas être celui que vous attendez, ce qui pourrait conduire à des résultats différents de ceux désirés.

En résumé, `\( ... \)` sert à :
- Grouper des conditions ou des expressions pour contrôler l'ordre d'évaluation.
- Assurer que les expressions groupées sont traitées comme une seule unité logique par la commande `find`.
- Éviter l'interprétation des parenthèses par le shell, en les échappant avec `\`.

## 3. Exlure par -iname ou -name
### version avec ((... -o ...)) -prune -o
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d \( -iname "*gsdata*" \) -prune -o -iname "*apprentissage*" -print
```
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d \( -iname "*gsdata*" -o -iname "*tuto*" \) -prune -o -iname "*apprentissage*" -print
```

Cette commande fonctionne comme suit :
- Elle commence par chercher dans le répertoire `/media/adrien/data/programmation_code/_REVISIONS/`.
- Elle utilise `-type d` pour limiter la recherche aux dossiers.
- La partie `\(... -o ... \) -prune` spécifie que si un dossier correspond soit au motif "*gsdata*" soit au motif "*tuto*", il sera exclu de la recherche (ne descend pas dans ces dossiers).
- L'option `-o` (qui signifie "ou") est ensuite utilisée pour séparer les conditions d'exclusion de la condition de recherche principale.
- La condition `-iname "*apprentissage*"` spécifie le motif de recherche pour les dossiers à inclure.
- `-print` s'assure que seuls les chemins correspondant à la condition "apprentissage*" sont affichés.

Cette commande va donc lister tous les dossiers qui contiennent "apprentissage" dans leur nom, tout en excluant ceux qui contiennent "gsdata" ou "tuto" dans leur nom, sans descendre dans ces derniers.
### version avec  grep
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d -iname "*apprentissage*" | grep -v gsdata
```
### version avec  !
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d ! -iname "*gsdata*" -a -iname "*apprentissage*" -print
```

# Exemples d'Utilisation de Base

## 1. **Trouver des Fichiers par Nom** :
   ```
   find /chemin -name 'nom_fichier'
   ```
## 2. **Recherche de Dossiers** :
   ```
   find /chemin -type d -name 'nom_dossier'
   ```
## 3. **Recherche par Taille de Fichier** :
   ```
   find /chemin -size +50M
   ```
## 4. **Recherche par Date de Modification** :
   ```
   find /chemin -mtime -7
   ```

# Utilisation avec Pipe pour Afficher la Taille

## 1. **Taille des Fichiers Trouvés** :
   ```
   find /chemin -type f -exec du -h {} +
   ```
## 2. **Taille des Dossiers Trouvés** :
   ```
   find /chemin -type d -exec du -sh {} +
   ```

# Autres Exemples Courants

## 1. **Trouver et Supprimer** :
   ```
   find /chemin -type f -name 'nom_fichier' -exec rm {} +
   ```
## 2. **Trouver et Compresser** :
   ```
   find /chemin -type f -name '*.log' -exec gzip {} +
   ```

### Autres Exemples avec Pipe

## 1. **Lister et Trier par Taille** :
   ```
   find /chemin -type f -exec ls -lh {} + | sort -k 5 -h
   ```
## 2. **Trouver et Afficher le Contenu** :
   ```
   find /chemin -type f -name 'nom_fichier' -exec cat {} \; | less
   ```

# Commandes utiles
   ```bash
   find /path -iname "*.avi"  -type f -size +100M -size -1000M -exec du -sh {} \; | awk -F/ 'tolower($NF) ~ /^/' | sort -nr

   find / -iname "*.avi" -iname "*dri*" -type f -size +100M -size -1000M -exec du -sh {} \; |  awk -F/ 'tolower($NF) ~ /^t/'| awk -F "/" '{print $1"- "$9}'  | sort -nr

   find / -iname "*.avi" -iname "*ToPia*" -type f -size +100M -size -1000M -exec du -sh {} \; | awk -F "/" '{print $1"- "$9}'  | sort -nr 

   find -name "*.js" -not -path "./directory/*"

   du -a -BM --max-depth=1 / |sort -nr | head -20
   
   find /  -type d -iname "*_0_docu*" -iname "*linux" -exec find {} -type f -iname "*md" -mtime -2  \; | sort > result.txt                                                                                                     
   cat result.txt | xargs l -lh | awk -F: '{print $1 $2}'

   find / -type d \( -iname "*gsdata*" -iname "docu" -prune  \) -o \( -iname "*apprentissage*" -print \)                                                                                                                       

   ```

# Conclusion

`find` est un outil très versatile qui peut être combiné avec d'autres commandes UNIX pour effectuer une grande variété de tâches sur des fichiers et des dossiers. La maîtrise de `find` et de ses nombreuses options permet de gagner beaucoup de temps et d'efficacité lors de la gestion des fichiers dans un système Linux.

---

<!-- File: find.md -->

---
title: find
date: 2024-07-12
tags:
  - ressource
  - bash
  - linux
  - programmation
  - scripts
  - programmes
status:
  - En cours
type de note:
  - ressource
référence:
  - "[[redirections]]"
  - "[[Substitution-de-commandes]]"
---

# Documentation de Base de `find`# [¶](https://agrellard.github.io/documentations_linux/commandes-de-base/utilitaires_divers/find/#documentation-de-base-de-find "Permanent link")

## 1. Syntaxe Générale : 
   ```bash
   find [chemin...] [option...] [expression de recherche...]
   ```
  - **chemin...** : Dossiers où commencer la recherche.
  - **expression** : Critères de recherche et actions.

### Paramètres

- **chemin...** : Spécifie le(s) répertoire(s) de départ pour la recherche. Si aucun chemin n'est donné, `find` utilise le répertoire courant par défaut.

### Options Principales d'Expression de Recherche

#### -name pattern
- Recherche des fichiers dont le nom correspond exactement au motif spécifié. Les caractères jokers comme `*` (remplace n'importe quelle chaîne de caractères) et `?` (remplace un seul caractère) peuvent être utilisés.
- Exemple : `find . -name "*.txt"` trouve tous les fichiers `.txt` dans le répertoire courant et ses sous-dossiers.

#### -iname pattern
- Comme `-name`, mais la recherche est insensible à la casse.
- Exemple : `find . -iname "readme.*"` trouvera "README.txt", "readme.md", "ReadMe.TXT", etc.

#### -type c
- Recherche des fichiers d'un type spécifié par `c`. Les valeurs courantes incluent `f` pour les fichiers réguliers, `d` pour les dossiers, et `l` pour les liens symboliques.
- Exemple : `find . -type d` liste tous les dossiers.

#### -size n[сwbkMG]
- Recherche des fichiers par taille. `n` peut être suivi par :
  - `c` pour les octets,
  - `w` pour les mots de deux octets,
  - `b` pour les blocs de 512 octets,
  - `k` pour les kilo-octets,
  - `M` pour les méga-octets,
  - `G` pour les giga-octets.
- Exemple : `find . -size +1M` trouve les fichiers de plus de 1 méga-octet.

#### -mtime n
- Recherche des fichiers modifiés il y a `n` * 24 heures. `+n` pour plus que `n` jours, `-n` pour moins.
- Exemple : `find . -mtime -7` trouve les fichiers modifiés dans les derniers 7 jours.

#### -user nomUtilisateur
- Recherche des fichiers appartenant à l'utilisateur spécifié.
- Exemple : `find . -user adrien` trouve tous les fichiers appartenant à "adrien".

#### -group nomGroupe
- Recherche des fichiers appartenant au groupe spécifié.
- Exemple : `find . -group adrien` trouve tous les fichiers appartenant au groupe "adrien".

#### -perm mode
- Recherche des fichiers avec les permissions spécifiées. Le mode peut être spécifié symboliquement ou en octal.
- Exemple : `find . -perm 644` trouve les fichiers avec des permissions `644`.

#### -exec commande {} \;
- Exécute une commande sur chaque fichier trouvé. `{}` est remplacé par le chemin du fichier trouvé.
- Exemple : `find . -type f -exec chmod 644 {} \;` change les permissions de tous les fichiers en `644`.
- `commande` est la commande que vous souhaitez exécuter sur chaque fichier ou dossier trouvé.
- `{}` est remplacé par le chemin du fichier ou du dossier trouvé par `find`.
- `\;` termine la commande que vous souhaitez exécuter avec `-exec`. Le backslash `\` est utilisé pour échapper le caractère `;`, car sans le backslash, le shell interpréterait `;` comme la fin de la commande `find` elle-même, et non comme une partie de l'argument pour `-exec`.

   En d'autres termes, `\;` est nécessaire pour faire comprendre au shell et à la commande `find` que la fin de la commande spécifiée avec `-exec` a été atteinte, et que ce n'est pas la fin de la commande `find` principale.


#### -ok commande {} \;
- Identique à `-exec`, mais demande une confirmation avant d'exécuter chaque commande.
- Exemple : `find . -type f -ok rm {} \;` demande avant de supprimer chaque fichier trouvé.

#### -prune
- Empêche `find` de descendre dans les sous-dossiers du dossier actuel s'il correspond au motif de recherche.
- Exemple : `find . -type d -name ".git" -prune -o -print` liste tous les fichiers et dossiers, en excluant les dossiers `.git` et leur contenu.

#### -delete
- Supprime les fichiers ou dossiers trouvés (avec prudence).
- Exemple : `find . -type f -name "*.bak" -delete` supprime tous les fichiers avec l'extension `.bak`.

### Autres Options Utiles

#### -ctime n
- Recherche des fichiers par leur "ctime" (le temps de changement du statut du fichier) les derniers `n` jours.
- Exemple : `find . -ctime -5` trouve les fichiers dont le statut a changé dans les 5 derniers jours.

#### -atime n
- Recherche des fichiers accédés dans les derniers `n` jours.
- Exemple : `find . -atime -2` trouve les fichiers qui ont été accédés dans les 2 derniers jours.

#### -depth
- Indique à `find` de traiter chaque répertoire après ses sous-dossiers. Utile pour les actions qui modifient la structure du dossier, comme supprimer.
- Exemple : `find . -depth -type d -empty -delete` supprime les dossiers vides.

#### -maxdepth levels
- Limite la recherche à une certaine profondeur de répertoires.
- Exemple : `find . -maxdepth 2 -name "*.txt"` cherche les fichiers `.txt` seulement jusqu'à 2 niveaux de profondeur.

#### -mindepth levels
- Ignore les niveaux de répertoires spécifiés au début de la recherche.
- Exemple : `find . -mindepth 2 -name "*.txt"` cherche les fichiers `.txt` en ignorant le répertoire courant et ses sous-dossiers immédiats.


### Combinaison d'Expressions

- **expression1 -a expression2** : Opérateur logique "ET", souvent omis car c'est le comportement par défaut.
- **expression1 -o expression2** : Opérateur logique "OU".
- **! expression** : Opérateur logique "NON".
- **\( expression \)** : Groupe des expressions pour contrôler l'ordre d'évaluation (les backslashes sont nécessaires pour échapper les parenthèses au shell).
### Utiliser la négation
L'argument `!` dans la commande `find` sous Linux est utilisé pour négationner une condition. En d'autres termes, il permet de trouver des fichiers ou des répertoires qui ne correspondent pas à un critère spécifique.

Voici quelques exemples concrets pour illustrer comment utiliser cet argument :

#### Exemple 1 : Trouver tous les fichiers sauf ceux avec une extension spécifique

Si vous voulez trouver tous les fichiers dans un répertoire sauf ceux avec l'extension `.txt`, vous pouvez utiliser la commande suivante :

```sh
find /path/to/directory ! -name "*.txt"
```

Dans cet exemple, `! -name "*.txt"` signifie que vous cherchez tous les fichiers dont le nom **ne correspond pas** au motif `*.txt`.

#### Exemple 2 : Trouver tous les fichiers sauf ceux d'une taille spécifique

Si vous voulez trouver tous les fichiers qui ne font pas exactement 1 Mo, vous pouvez utiliser la commande suivante :

```sh
find /path/to/directory ! -size 1M
```

Ici, `! -size 1M` signifie que vous cherchez tous les fichiers dont la taille **n'est pas** de 1 Mo.

#### Exemple 3 : Trouver tous les fichiers sauf ceux appartenant à un utilisateur spécifique

Si vous voulez trouver tous les fichiers qui n'appartiennent pas à l'utilisateur `john`, vous pouvez utiliser la commande suivante :

```sh
find /path/to/directory ! -user john
```

Dans ce cas, `! -user john` signifie que vous cherchez tous les fichiers qui **n'appartiennent pas** à l'utilisateur `john`.

#### Exemple 4 : Combiner plusieurs critères avec la négation

Vous pouvez également combiner plusieurs critères, y compris des négations. Par exemple, si vous voulez trouver tous les fichiers sauf ceux qui sont des fichiers vides et qui n'ont pas l'extension `.log`, vous pouvez utiliser :

```sh
find /path/to/directory ! -empty ! -name "*.log"
```

Ici, `! -empty` signifie que vous cherchez tous les fichiers qui **ne sont pas** vides, et `! -name "*.log"` signifie que vous cherchez tous les fichiers dont le nom **ne correspond pas** au motif `*.log`.


## 2. grouper des conditions ou des expressions : 

Les symboles `\( ... \)` dans une commande `find` sous Linux sont utilisés pour grouper des conditions ou des expressions. Le but est de contrôler l'ordre d'évaluation des expressions et de s'assurer que certaines opérations logiques sont effectuées ensemble, un peu comme les parenthèses sont utilisées en mathématiques pour grouper des nombres et des opérations.

Dans le contexte des commandes shell comme `find`, les parenthèses ont une signification spéciale et peuvent être interprétées par le shell avant que `find` ne les reçoive. Pour éviter cette interprétation précoce par le shell et s'assurer que les parenthèses sont passées à `find` comme partie de son expression de recherche, on les échappe avec un backslash `\`, d'où `\( ... \)`.

Par exemple, considérez la commande suivante :

```bash
find /chemin/ -type d \( -iname "*gsdata*" -o -iname "*tuto*" \) -prune -o -iname "*apprentissage*" -print
```

Ici, `\( ... \)` est utilisé pour grouper `-iname "*gsdata*" -o -iname "*tuto*"` comme une seule condition logique. Cela signifie que `find` évaluera cette condition en tant qu'unité, appliquant `-prune` aux dossiers qui correspondent soit à `*gsdata*`, soit à `*tuto*`. Sans ces parenthèses, l'ordre des opérations pourrait ne pas être celui que vous attendez, ce qui pourrait conduire à des résultats différents de ceux désirés.

En résumé, `\( ... \)` sert à :
- Grouper des conditions ou des expressions pour contrôler l'ordre d'évaluation.
- Assurer que les expressions groupées sont traitées comme une seule unité logique par la commande `find`.
- Éviter l'interprétation des parenthèses par le shell, en les échappant avec `\`.

## 3. Exclure par -iname ou -name
### version avec ((... -o ...)) -prune -o
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d \( -iname "*gsdata*" \) -prune -o -iname "*apprentissage*" -print
```
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d \( -iname "*gsdata*" -o -iname "*tuto*" \) -prune -o -iname "*apprentissage*" -print
```

Cette commande fonctionne comme suit :
- Elle commence par chercher dans le répertoire `/media/adrien/data/programmation_code/_REVISIONS/`.
- Elle utilise `-type d` pour limiter la recherche aux dossiers.
- La partie `\(... -o ... \) -prune` spécifie que si un dossier correspond soit au motif "*gsdata*" soit au motif "*tuto*", il sera exclu de la recherche (ne descend pas dans ces dossiers).
- L'option `-o` (qui signifie "ou") est ensuite utilisée pour séparer les conditions d'exclusion de la condition de recherche principale.
- La condition `-iname "*apprentissage*"` spécifie le motif de recherche pour les dossiers à inclure.
- `-print` s'assure que seuls les chemins correspondant à la condition "apprentissage*" sont affichés.

Cette commande va donc lister tous les dossiers qui contiennent "apprentissage" dans leur nom, tout en excluant ceux qui contiennent "gsdata" ou "tuto" dans leur nom, sans descendre dans ces derniers.
### version avec  grep
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d -iname "*apprentissage*" | grep -v gsdata
```
### version avec  !
```bash
find /media/adrien/data/programmation_code/_REVISIONS/ -type d ! -iname "*gsdata*" -a -iname "*apprentissage*" -print
```

# Exemples d'Utilisation de Base

## 1. **Trouver des Fichiers par Nom** :
   ```
   find /chemin -name 'nom_fichier'
   ```
## 2. **Recherche de Dossiers** :
   ```
   find /chemin -type d -name 'nom_dossier'
   ```
## 3. **Recherche par Taille de Fichier** :
   ```
   find /chemin -size +50M
   ```
## 4. **Recherche par Date de Modification** :
   ```
   find /chemin -mtime -7
   ```

# Utilisation avec Pipe pour Afficher la Taille

## 1. **Taille des Fichiers Trouvés** :
   ```
   find /chemin -type f -exec du -h {} +
   ```
## 2. **Taille des Dossiers Trouvés** :
   ```
   find /chemin -type d -exec du -sh {} +
   ```

# Autres Exemples Courants

## 1. **Trouver et Supprimer** :
   ```
   find /chemin -type f -name 'nom_fichier' -exec rm {} +
   ```
## 2. **Trouver et Compresser** :
   ```
   find /chemin -type f -name '*.log' -exec gzip {} +
   ```

### Autres Exemples avec Pipe

## 1. **Lister et Trier par Taille** :
   ```
   find /chemin -type f -exec ls -lh {} + | sort -k 5 -h
   ```
## 2. **Trouver et Afficher le Contenu** :
   ```
   find /chemin -type f -name 'nom_fichier' -exec cat {} \; | less
   ```

# Commandes utiles
   ```bash
   find /path -iname "*.avi"  -type f -size +100M -size -1000M -exec du -sh {} \; | awk -F/ 'tolower($NF) ~ /^/' | sort -nr

   find / -iname "*.avi" -iname "*dri*" -type f -size +100M -size -1000M -exec du -sh {} \; |  awk -F/ 'tolower($NF) ~ /^t/'| awk -F "/" '{print $1"- "$9}'  | sort -nr

   find / -iname "*.avi" -iname "*ToPia*" -type f -size +100M -size -1000M -exec du -sh {} \; | awk -F "/" '{print $1"- "$9}'  | sort -nr 

   find -name "*.js" -not -path "./directory/*"

   du -a -BM --max-depth=1 / |sort -nr | head -20
   
   find /  -type d -iname "*_0_docu*" -iname "*linux" -exec find {} -type f -iname "*md" -mtime -2  \; | sort > result.txt                                                                                                     
   cat result.txt | xargs l -lh | awk -F: '{print $1 $2}'

   find / -type d \( -iname "*gsdata*" -iname "docu" -prune  \) -o \( -iname "*apprentissage*" -print \)

---

<!-- File: gestionnaire_de_paquets.md -->

Un gestionnaire de paquets est un outil logiciel qui automatise le processus d'installation, de mise à jour, de configuration et de suppression de logiciels sur le système d'exploitation d'un ordinateur. Les gestionnaires de paquets sont un composant essentiel des systèmes d'exploitation modernes, fournissant une interface cohérente pour gérer les logiciels et leurs dépendances, et garantissant ainsi l'intégrité et la stabilité du système. Ils sont particulièrement prévalents et importants dans les systèmes d'exploitation basés sur Linux, mais des versions existent également pour Windows et macOS.

### Fonctionnalités Clés

- **Installation de logiciels** : Permettent d'installer facilement des logiciels à partir de sources centralisées appelées dépôts ou repositories.
- **Gestion des dépendances** : Résolvent automatiquement les dépendances requises par un logiciel, évitant ainsi à l'utilisateur de devoir les installer manuellement.
- **Mises à jour et upgrades** : Facilitent la mise à jour des logiciels installés vers les dernières versions disponibles, améliorant ainsi la sécurité et la fonctionnalité.
- **Configuration et personnalisation** : Certains gestionnaires de paquets permettent de configurer et de personnaliser les logiciels au moment de l'installation.
- **Suppression propre** : Permettent de supprimer les logiciels de manière à ne laisser aucun fichier résiduel inutile.

### Exemples de Gestionnaires de Paquets

- **APT (Advanced Package Tool)** : Utilisé dans les distributions basées sur Debian, comme Ubuntu. Gère les paquets `.deb` et s'appuie sur des outils comme `dpkg` pour l'installation des paquets.

- **Pacman** : Le gestionnaire de paquets standard pour Arch Linux, réputé pour sa vitesse et son efficacité. Il utilise des paquets `.tar.xz` ou `.tar.zst` et gère à la fois les dépôts officiels d'Arch et les dépôts utilisateur AUR (Arch User Repository).

- **YUM (Yellowdog Updater, Modified) / DNF (Dandified YUM)** : YUM était le gestionnaire de paquets par défaut pour les distributions basées sur Red Hat comme CentOS, remplacé par DNF dans Fedora. Ils gèrent les paquets `.rpm`.

- **Chocolatey** : Un gestionnaire de paquets pour Windows, permettant d'installer des logiciels et des outils de ligne de commande à partir du PowerShell ou de la ligne de commande de Windows.

- **Homebrew** : Un gestionnaire de paquets pour macOS (et Linux), offrant une installation facile de logiciels qui ne sont pas nécessairement inclus dans le système d'exploitation par défaut.

- **npm (Node Package Manager)** : Spécifiquement conçu pour le JavaScript, npm permet de gérer les bibliothèques et les outils nécessaires au développement de projets Node.js.

- **Pip** : Le gestionnaire de paquets pour Python, permettant d'installer et de gérer des bibliothèques et des outils Python.

### Avantages

- **Facilité d'utilisation** : Les gestionnaires de paquets rendent l'installation et la gestion des logiciels beaucoup plus simples et plus intuitives.
- **Cohérence et stabilité** : Ils assurent la compatibilité des logiciels avec le système d'exploitation et entre les logiciels eux-mêmes.
- **Sécurité** : Les mises à jour régulières des logiciels via les gestionnaires de paquets contribuent à la sécurité du système en corrigeant rapidement les vulnérabilités.

### Conclusion

Les gestionnaires de paquets sont essentiels pour maintenir l'organisation, la mise à jour, et la sécurité des logiciels sur les ordinateurs et autres dispositifs. Ils simplifient grandement le processus de gestion des logiciels et sont un pilier de l'expérience utilisateur dans les systèmes d'exploitation modernes.

---

<!-- File: hexdump.md -->

---
title: hexdump
date: 2024-07-18
tags:
  - ressource
status:
  - En cours
type de note:
  - ressource
---
# Documentation pour la commande `hexdump` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `hexdump`](#fonctionnement-de-la-commande-hexdump)
3. [Syntaxe de la commande `hexdump`](#syntaxe-de-la-commande-hexdump)
4. [Options de la commande `hexdump`](#options-de-la-commande-hexdump)
    - [Option `-b` (one-byte octal display)](#option--b-one-byte-octal-display)
    - [Option `-C` (canonical hex+ASCII display)](#option--c-canonical-hexascii-display)
    - [Option `-n` (length)](#option--n-length)
    - [Option `-s` (skip)](#option--s-skip)

    - [Option `-v` (no suppression)](#option--v-no-suppression)
    - [Option `-e` (format string)](#option--e-format-string)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Afficher le contenu d'un fichier en hexadécimal](#exemple-1--afficher-le-contenu-dun-fichier-en-hexadécimal)
    - [Exemple 2 : Afficher les premiers 16 octets d'un fichier](#exemple-2--afficher-les-premiers-16-octets-dun-fichier)
    - [Exemple 3 : Sauter les 10 premiers octets et afficher le reste](#exemple-3--sauter-les-10-premiers-octets-et-afficher-le-reste)
    - [Exemple 4 : Afficher le contenu en hexadécimal et ASCII](#exemple-4--afficher-le-contenu-en-hexadécimal-et-ascii)
    - [Exemple 5 : Utiliser une chaîne de format personnalisée](#exemple-5--utiliser-une-chaîne-de-format-personnalisée)
6. [Conclusion](#conclusion)

## Introduction

La commande `hexdump` sous Linux est utilisée pour afficher le contenu d'un fichier en format hexadécimal, décimal, octal ou ASCII. Elle est particulièrement utile pour les développeurs et les administrateurs système pour inspecter les fichiers binaires et les données en mémoire.

## Fonctionnement de la commande `hexdump`

La commande `hexdump` lit un fichier ou un flux de données en entrée, et affiche son contenu en utilisant différents formats selon les options spécifiées. Elle peut afficher les données en hexadécimal, octal, ASCII, ou d'autres formats personnalisés.

## Syntaxe de la commande `hexdump`

```bash
hexdump [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à afficher. Si aucun fichier n'est spécifié, `hexdump` lit l'entrée standard.

## Options de la commande `hexdump`

### Option `-b` (one-byte octal display)

Affiche le contenu du fichier en octets octaux.

```bash
hexdump -b [fichier]
```

### Option `-C` (canonical hex+ASCII display)

Affiche le contenu du fichier en hexadécimal et en ASCII de manière canonique.

```bash
hexdump -C [fichier]
```

### Option `-n` (length)

Affiche uniquement les n premiers octets du fichier.

```bash
hexdump -n [nombre] [fichier]
```

### Option `-s` (skip)

Ignore les n premiers octets du fichier.

```bash
hexdump -s [nombre] [fichier]
```

### Option `-v` (no suppression)

Affiche toutes les lignes de sortie, y compris les lignes répétitives. Par défaut, les lignes répétitives sont représentées par `*`.

```bash
hexdump -v [fichier]
```

### Option `-e` (format string)

Permet d'utiliser une chaîne de format personnalisée pour afficher les données.

```bash
hexdump -e 'format_string' [fichier]
```

## Exemples concrets

### Exemple 1 : Afficher le contenu d'un fichier en hexadécimal

Pour afficher le contenu du fichier `example.bin` en hexadécimal :

```bash
hexdump example.bin
```

**Sortie :**

```
0000000 4865 6c6c 6f20 576f 726c 6421
000000c
```

### Exemple 2 : Afficher les premiers 16 octets d'un fichier

Pour afficher les premiers 16 octets du fichier `example.bin` :

```bash
hexdump -n 16 example.bin
```

**Sortie :**

```
0000000 4865 6c6c 6f20 576f 726c 6421 0000 0000
0000010
```

### Exemple 3 : Sauter les 10 premiers octets et afficher le reste

Pour sauter les 10 premiers octets du fichier `example.bin` et afficher le reste :

```bash
hexdump -s 10 example.bin
```

**Sortie :**

```
000000a 726c 6421 0000 0000
0000012
```

### Exemple 4 : Afficher le contenu en hexadécimal et ASCII

Pour afficher le contenu du fichier `example.bin` en hexadécimal et ASCII :

```bash
hexdump -C example.bin
```

**Sortie :**

```
00000000  48 65 6c 6c 6f 20 57 6f  72 6c 64 21 00 00 00 00  |Hello World!....|
00000010
```

### Exemple 5 : Utiliser une chaîne de format personnalisée

Pour afficher le contenu du fichier `example.bin` en utilisant une chaîne de format personnalisée :

```bash
hexdump -e '16/1 "%02X " "\n"' example.bin
```

**Sortie :**

```
48 65 6C 6C 6F 20 57 6F 72 6C 64 21 00 00 00 00 
```

## Conclusion

La commande `hexdump` est un outil puissant pour inspecter et afficher le contenu des fichiers binaires sous différents formats. Elle offre des options flexibles pour afficher les données en hexadécimal, octal, ASCII, et bien plus encore. En utilisant les options appropriées, vous pouvez personnaliser la sortie de `hexdump` pour répondre à vos besoins spécifiques. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man hexdump` ou la documentation officielle de votre distribution Linux.

---

<!-- File: lsof.md -->

`lsof` est un outil en ligne de commande sous Unix et Linux qui signifie "List Open Files". Il est utilisé pour afficher des informations sur les fichiers ouverts par les processus en cours d'exécution sur le système. Un "fichier ouvert" peut être un fichier régulier, un répertoire, une bibliothèque partagée, un fichier de périphérique (comme `/dev/null`), ou même un réseau ou une connexion IPC. `lsof` est particulièrement utile pour le diagnostic de systèmes, la surveillance des ressources et le dépannage.

### Installation de `lsof`

Sous la plupart des distributions Linux, `lsof` peut être installé via le gestionnaire de paquets du système. Par exemple :

- Sur Debian/Ubuntu et dérivés :

  ```bash
  sudo apt-get install lsof
  ```

- Sur Fedora :

  ```bash
  sudo dnf install lsof
  ```

- Sur CentOS/RHEL :

  ```bash
  sudo yum install lsof
  ```

### Utilisation de Base de `lsof`

Voici quelques exemples d'utilisation courante de `lsof` :

- **Lister tous les fichiers ouverts** :

  ```bash
  lsof
  ```

- **Lister les fichiers ouverts par un utilisateur spécifique** :

  ```bash
  lsof -u nom_utilisateur
  ```

- **Lister les fichiers ouverts par un processus spécifique** :

  ```bash
  lsof -p pid
  ```
  Remplacez `pid` par l'identifiant du processus.

- **Lister les fichiers ouverts sur un port spécifique** :

  ```bash
  lsof -i :port
  ```
  Remplacez `port` par le numéro de port.

- **Lister les fichiers ouverts dans un répertoire spécifique et ses sous-répertoires** :

  ```bash
  lsof +D /chemin/vers/repertoire
  ```

- **Lister les connexions réseau ouvertes** :

  ```bash
  lsof -i
  ```

### Options Communes de `lsof`

- `-u` : Filtrer par nom d'utilisateur.
- `-c` : Filtrer par le nom du processus.
- `-p` : Filtrer par l'ID du processus.
- `-i` : Afficher les informations de réseau (comme TCP et UDP ouvertures).
- `-d` : Filtrer par descripteur de fichier.
- `+D` : Recherche récursive dans un répertoire.

### Conseils

- **Privilèges** : Certaines informations requièrent des privilèges d'administration pour être affichées. Lancez `lsof` avec `sudo` si vous ne voyez pas les informations attendues.
- **Performance** : L'exécution de `lsof` sans filtres peut prendre du temps sur des systèmes avec de nombreux fichiers ouverts. Utilisez des options de filtrage pour réduire la sortie à ce qui vous intéresse.

`lsof` est un outil puissant et flexible. Explorez sa page de manuel (`man lsof`) pour une liste complète des options et des exemples d'utilisation supplémentaires.

---

<!-- File: raccourcis.md -->

- [Navigation dans le Terminal](#navigation-dans-le-terminal)
- [Manipulation de Texte](#manipulation-de-texte)
- [Gestion et Contrôle des Processus](#gestion-et-contrôle-des-processus)
- [Recherche et Historique](#recherche-et-historique)
- [Complétion et Correction](#complétion-et-correction)
- [Navigation dans un Fichier avec `cat`, `nano`, `less`, etc.](#navigation-dans-un-fichier-avec-cat-nano-less-etc)

### Navigation dans le Terminal

- **Ctrl+A** : Déplace le curseur au début de la ligne. Utile pour retourner rapidement au début sans utiliser les touches fléchées.
- **Ctrl+E** : Déplace le curseur à la fin de la ligne. Cela vous permet de passer rapidement à la fin pour continuer votre saisie.
- **Ctrl+B** : Déplace le curseur d'un caractère vers la gauche, similaire à la flèche gauche, sans supprimer de caractères.
- **Ctrl+F** : Déplace le curseur d'un caractère vers la droite, comme la flèche droite, sans supprimer de caractères.
- **Alt+B** : Déplace le curseur d'un mot vers la gauche, permettant de naviguer plus rapidement dans les commandes longues.
- **Alt+F** : Déplace le curseur d'un mot vers la droite, idéal pour sauter par-dessus des mots sans effacer.
- **Ctrl+XX** : Bascule entre le début de la ligne et la position actuelle du curseur, offrant une méthode rapide pour revenir à une position antérieure.

### Manipulation de Texte

- **Ctrl+K** : Supprime tout à droite du curseur jusqu'à la fin de la ligne. Utilisé pour effacer rapidement la partie inutile d'une commande.
- **Ctrl+U** : Supprime tout à gauche du curseur jusqu'au début de la ligne. Parfait pour corriger des erreurs au début d'une commande sans effacer toute la ligne.
- **Ctrl+W** : Supprime le mot à gauche du curseur, offrant une méthode efficace pour corriger des erreurs de mot spécifiques.
- **Ctrl+Y** : Colle le texte précédemment coupé avec `Ctrl+U`, `Ctrl+K`, ou `Ctrl+W`. Utilisez-le pour récupérer ou déplacer du texte.
- **Ctrl+T** : Transpose les deux caractères avant le curseur, utile pour corriger rapidement les fautes de frappe.
- **Alt+T** : Transpose les deux mots avant le curseur, permettant de changer l'ordre des mots sans les supprimer.
- **Alt+L** : Convertit en minuscules le mot après le curseur, utile pour corriger la casse sans ressaisir le mot.
- **Alt+U** : Convertit en majuscules le mot après le curseur, permettant de mettre en évidence des mots spécifiques ou de corriger la casse.

### Gestion et Contrôle des Processus

- **Ctrl+C** : Interrompt la commande en cours d'exécution, envoyant le signal `SIGINT` pour arrêter l'exécution.
- **Ctrl+Z** : Suspend le processus en cours, le mettant en arrière-plan. Peut être repris avec `fg` ou `bg`.
- **Ctrl+D** : Envoie un signal EOF (End Of File) pour fermer le terminal ou la session en cours si la ligne est vide. Utilisé aussi pour terminer l'entrée dans de nombreux programmes interactifs.
- **Ctrl+S** : Suspend temporairement le défilement du terminal, utile pour lire des sorties longues.
- **Ctrl+Q** : Reprend le défilement du terminal après une suspension avec `Ctrl+S`.

### Recherche et Historique

- **Ctrl+R** : Active la recherche récursive dans l'historique des commandes, permettant de retrouver rapidement une commande utilisée précédemment.
- **Ctrl+P** ou `Flèche vers le haut` : Navigue à la commande précédente dans l'historique.
- **Ctrl+N** ou `Flèche vers le bas` : Navigue à la commande suivante dans l'historique.
- **Alt+.** ou **Alt+_** : Insère le dernier argument de la commande précédente. Très utile pour réutiliser des arguments sans les retaper.
- **Ctrl+G** : Annule l'interaction en cours dans le mode de recherche d'historique ou de complétion, permettant de quitter sans effectuer de changement.

### Complétion et Correction

- **Tab** : Tente de compléter le nom

 du fichier, du dossier, de la commande ou de l'option commencé à taper, accélérant la saisie des commandes.
- **Alt+?** : Affiche une liste de complétions possibles lorsque la complétion automatique avec Tab est ambiguë, offrant un choix entre plusieurs options.

### Navigation dans un Fichier avec `cat`, `nano`, `less`, etc.

- **`nano`** : Dans `nano`, utilisez `Ctrl+Y` pour avancer d'une page et `Ctrl+V` pour reculer. `Ctrl+O` sauvegarde le fichier, et `Ctrl+X` quitte l'éditeur.
- **`less`** : Dans `less`, utilisez `Space` pour avancer d'une page, `b` pour reculer, `/` pour rechercher en avant, et `?` pour rechercher en arrière. `q` quitte `less`.
- **`cat`** ne permet pas la navigation interactive, mais peut être combiné avec `less` ou `more` pour visualiser le contenu d'un fichier page par page.



---

<!-- File: strings.md -->

---
title: strings
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour la commande `strings` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `strings`](#fonctionnement-de-la-commande-strings)
3. [Syntaxe de la commande `strings`](#syntaxe-de-la-commande-strings)
4. [Options de la commande `strings`](#options-de-la-commande-strings)
    - [Option `-a` (scan entire file)](#option--a-scan-entire-file)
    - [Option `-n` (minimum length)](#option--n-minimum-length)
    - [Option `-o` (print offsets)](#option--o-print-offsets)
    - [Option `-t` (radix)](#option--t-radix)
    - [Option `-e` (encoding)](#option--e-encoding)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Extraire les chaînes de caractères d'un fichier](#exemple-1--extraire-les-chaînes-de-caractères-dun-fichier)
    - [Exemple 2 : Extraire les chaînes de caractères avec une longueur minimale](#exemple-2--extraire-les-chaînes-de-caractères-avec-une-longueur-minimale)
    - [Exemple 3 : Afficher les offsets des chaînes de caractères](#exemple-3--afficher-les-offsets-des-chaînes-de-caractères)
    - [Exemple 4 : Extraire les chaînes de caractères avec un encodage spécifique](#exemple-4--extraire-les-chaînes-de-caractères-avec-un-encodage-spécifique)
6. [Conclusion](#conclusion)

## Introduction

La commande `strings` sous Linux est utilisée pour extraire les chaînes de caractères imprimables d'un fichier binaire. Elle est particulièrement utile pour analyser des fichiers exécutables, des bibliothèques, ou d'autres fichiers binaires pour trouver du texte lisible par l'homme.

## Fonctionnement de la commande `strings`

La commande `strings` scanne un fichier binaire ou un flux d'entrée standard pour les séquences de caractères imprimables (texte lisible par l'homme) d'une certaine longueur. Par défaut, elle considère toute séquence de 4 caractères imprimables ou plus comme une chaîne de caractères.

## Syntaxe de la commande `strings`

```bash
strings [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à analyser. Si aucun fichier n'est spécifié, `strings` lit l'entrée standard.

## Options de la commande `strings`

### Option `-a` (scan entire file)

Analyse le fichier entier, y compris les sections non initialisées.

```bash
strings -a [fichier]
```

### Option `-n` (minimum length)

Spécifie la longueur minimale des chaînes de caractères à extraire.

```bash
strings -n <longueur> [fichier]
```

### Option `-o` (print offsets)

Affiche les offsets (positions) des chaînes de caractères dans le fichier.

```bash
strings -o [fichier]
```

### Option `-t` (radix)

Affiche les offsets en utilisant une base spécifique (o pour octal, x pour hexadécimal, d pour décimal).

```bash
strings -t <base> [fichier]
```

### Option `-e` (encoding)

Spécifie l'encodage des chaînes de caractères (s pour single-7-bit-byte, S pour single-8-bit-byte, b pour 16-bit big-endian, l pour 16-bit little-endian).

```bash
strings -e <encodage> [fichier]
```

## Exemples concrets

### Exemple 1 : Extraire les chaînes de caractères d'un fichier

Pour extraire les chaînes de caractères imprimables d'un fichier binaire `example.bin` :

```bash
strings example.bin
```

**Sortie :**

```
Some text
Another string
More readable text
```

### Exemple 2 : Extraire les chaînes de caractères avec une longueur minimale

Pour extraire les chaînes de caractères d'au moins 6 caractères de `example.bin` :

```bash
strings -n 6 example.bin
```

**Sortie :**

```
Another string
More readable text
```

### Exemple 3 : Afficher les offsets des chaînes de caractères

Pour afficher les offsets des chaînes de caractères dans `example.bin` :

```bash
strings -o example.bin
```

**Sortie :**

```
1234 Some text
5678 Another string
91011 More readable text
```

### Exemple 4 : Extraire les chaînes de caractères avec un encodage spécifique

Pour extraire les chaînes de caractères encodées en 16-bit little-endian de `example.bin` :

```bash
strings -e l example.bin
```

**Sortie :**

```
Text1
Text2
```

## Conclusion

La commande `strings` est un outil puissant pour extraire des chaînes de caractères imprimables à partir de fichiers binaires. En utilisant ses différentes options, vous pouvez personnaliser l'extraction de texte en fonction de vos besoins spécifiques, comme la longueur minimale des chaînes, l'affichage des offsets, et le choix de l'encodage. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man strings` ou la documentation officielle de votre distribution Linux.

---

<!-- File: terminal_raccourci_clavier.md -->

### Raccourcis fournis
- **Ctrl+A** : Déplace le curseur au début de la ligne de commande.
- **Ctrl+E** : Déplace le curseur à la fin de la ligne de commande.
- **Ctrl+D** : Envoie un EOF (End Of File) pour fermer le terminal si la ligne est vide. Dans un contexte d'entrée, cela peut également servir à supprimer le caractère sous le curseur.
- **Ctrl+W** : Supprime le mot à gauche du curseur sur la ligne de commande.
- **Ctrl+X puis E** : Lance un éditeur de texte (`$EDITOR`, par défaut souvent `vi` ou `nano`) pour éditer la ligne de commande actuelle. Ceci peut varier en fonction de la configuration de l'environnement.
- **Ctrl+R** : Active la recherche récursive dans l'historique des commandes. En tapant après avoir activé ce raccourci, vous recherchez une commande précédente contenant le texte saisi.
- **Esc + .** ou **Alt+.** : Insère le dernier argument de la commande précédente à l'emplacement actuel du curseur. Répéter ce raccourci remonte dans l'historique des arguments.

### Autres raccourcis utiles
- **Ctrl+K** : Supprime tout le texte à droite du curseur jusqu'à la fin de la ligne.
- **Ctrl+U** : Supprime tout le texte à gauche du curseur jusqu'au début de la ligne. Dans certains cas, il supprime toute la ligne.
- **Ctrl+L** : Efface l'écran, équivalent à la commande `clear`.
- **Ctrl+Y** : Colle (ou "yank") le texte supprimé par Ctrl+U, Ctrl+K, ou Ctrl+W.
- **Ctrl+C** : Interrompt la commande en cours d'exécution et retourne à la ligne de commande. Il envoie le signal `SIGINT` au processus en cours.
- **Ctrl+Z** : Suspend le processus en cours en envoyant le signal `SIGSTOP`. Vous pouvez le reprendre plus tard en arrière-plan avec `bg` ou en avant-plan avec `fg`.
- **Ctrl+T** : Transpose (échange) le caractère avant le curseur avec le caractère sous le curseur.
- **Alt+B** : Se déplace en arrière d'un mot dans la ligne de commande.
- **Alt+F** : Se déplace en avant d'un mot dans la ligne de commande.



---

<!-- File: utils.md -->

- [Programmes Utils sous Linux](#programmes-utils-sous-linux)
  - [Gestion des Utilisateurs](#gestion-des-utilisateurs)
    - [`id`](#id)
    - [`su`](#su)
    - [`whoami`](#whoami)
  - [Manipulation de Texte](#manipulation-de-texte)
    - [`xclip`](#xclip)
    - [`pandoc`](#pandoc)
  - [Personnalisation et Productivité](#personnalisation-et-productivité)
    - [`screen` / `tmux`](#screen--tmux)
    - [`alias`](#alias)
    - [`cron`](#cron)
  - [Shells Alternatifs](#shells-alternatifs)
    - [`zsh`](#zsh)
  - [Navigation Web en Ligne de Commande](#navigation-web-en-ligne-de-commande)
    - [`lynx`](#lynx)
  - [Surveillance et Maintenance](#surveillance-et-maintenance)
    - [`journalctl`](#journalctl)
    - [`du`](#du)
    - [`df`](#df)
  - [Surveillance et Analyse du Système](#surveillance-et-analyse-du-système)
    - [`htop`](#htop)
    - [`iotop`](#iotop)
    - [`nmon`](#nmon)
    - [`dmesg`](#dmesg)
    - [`lsof`](#lsof)
  - [Gestion de Paquets](#gestion-de-paquets)
    - [`apt` (pour Debian, Ubuntu et dérivés)](#apt-pour-debian-ubuntu-et-dérivés)
    - [`yum` (pour CentOS, RHEL)](#yum-pour-centos-rhel)
    - [`dnf` (pour Fedora)](#dnf-pour-fedora)
  - [Sécurité](#sécurité)
    - [`iptables`](#iptables)
    - [`chmod` / `chown`](#chmod--chown)
    - [`fail2ban`](#fail2ban)
    - [`ufw`](#ufw)
  - [Archivage et Compression](#archivage-et-compression)
    - [`tar`](#tar)
    - [`gzip` / `bzip2`](#gzip--bzip2)
  - [Recherche et Triage](#recherche-et-triage)
    - [`grep`](#grep)
    - [`find`](#find)
    - [`sed`](#sed)
    - [`awk`](#awk)
    - [`sort`](#sort)
    - [`uniq`](#uniq)
  - [requette http](#requette-http)
    - [`wget`](#wget)
    - [`curl`](#curl)
  - [Connectivité](#connectivité)
    - [`ssh`](#ssh)
    - [`scp`](#scp)
    - [`rsync`](#rsync)
  - [Développement et Monitoring Réseau](#développement-et-monitoring-réseau)
    - [`netstat`](#netstat)
    - [`ping`](#ping)
    - [`traceroute` / `tracepath`](#traceroute--tracepath)
  - [Développement et Débogage](#développement-et-débogage)
    - [`git`](#git)
    - [`vim` / `nano`](#vim--nano)
    - [`gdb`](#gdb)
  - [Gestion de Versions](#gestion-de-versions)
    - [`git`](#git-1)
  - [Edition de Texte](#edition-de-texte)
    - [`nano` / `vim`](#nano--vim)
  - [Surveillance de Logs](#surveillance-de-logs)
    - [`tail`](#tail)
    - [`journalctl`](#journalctl-1)
  - [Manipulation d'Images Disque](#manipulation-dimages-disque)
    - [`dd`](#dd)
  - [Compression et Archivage](#compression-et-archivage)
    - [`zip` / `unzip`](#zip--unzip)
  - [Sécurité et Chiffrement](#sécurité-et-chiffrement)
    - [`gpg`](#gpg)
  - [Virtualisation](#virtualisation)
    - [`docker`](#docker)
    - [`virtualbox`](#virtualbox)


# Programmes Utils sous Linux

## Gestion des Utilisateurs

### `id`

- **Utilité** : Affiche les identifiants de l'utilisateur courant ou d'un utilisateur spécifié, y compris UID, GID, et appartenance aux groupes.
- **Commande** : `id [nom_utilisateur]`

### `su`

- **Utilité** : Permet de changer l'identité de l'utilisateur courant, souvent utilisé pour obtenir les privilèges du superutilisateur.
- **Commande** : `su - [nom_utilisateur]`

### `whoami`

- **Utilité** : Affiche le nom de l'utilisateur courant.
- **Commande** : `whoami`

## Manipulation de Texte

### `xclip`

- **Utilité** : Permet de copier du texte dans le presse-papier depuis la ligne de commande.
- **Commande** : `echo "texte" | xclip -selection clipboard`

### `pandoc`

- **Utilité** : Un convertisseur de documents permettant de transformer des fichiers Markdown, HTML, LaTeX, et d'autres formats de texte.
- **Commande** : `pandoc fichier_source -o fichier_destination`

## Personnalisation et Productivité

### `screen` / `tmux`

- **Utilité** : Multiplexeurs de terminal qui permettent à l'utilisateur de travailler avec plusieurs fenêtres de terminal dans une session unique. `tmux` offre des fonctionnalités plus riches par rapport à `screen`.
- **Commande** : `tmux` ou `screen`

### `alias`

- **Utilité** : Permet de créer des alias, c'est-à-dire des raccourcis pour des commandes longues ou complexes.
- **Exemple** : Ajouter `alias ll='ls -la'` dans `.bashrc` ou `.zshrc` pour créer un raccourci pour `ls -la`.

### `cron`

- **Utilité** : Planificateur de tâches qui exécute des scripts ou des commandes à des moments spécifiés.
- **Configuration** : Éditez la table de cron avec `crontab -e` pour ajouter, modifier ou supprimer des tâches planifiées.

## Shells Alternatifs

### `zsh`

- **Utilité** : Un interpréteur de commandes puissant et extensible souvent utilisé avec le framework de configuration `oh-my-zsh`.
- **Installation** : `sudo apt-get install zsh`

## Navigation Web en Ligne de Commande

### `lynx`

- **Utilité** : Un navigateur Web en mode texte permettant de naviguer sur Internet directement depuis le terminal.
- **Commande** : `lynx [URL]`

## Surveillance et Maintenance

### `journalctl`

- **Utilité** : Partie du système `systemd`, cet outil permet de consulter et d'analyser les journaux système.
- **Commande** : `journalctl -u nom_du_service`

### `du`

- **Utilité** : Outil pour estimer l'espace disque utilisé par les fichiers/dossiers.
- **Commande** : `du -sh /chemin/dossier`

### `df`

- **Utilité** : Affiche l'utilisation du disque par les systèmes de fichiers montés.
- **Commande** : `df -h`

## Surveillance et Analyse du Système

### `htop`

- **Utilité** : Une version améliorée de `top`, offrant une vue interactive des processus en cours d'exécution et de l'utilisation des ressources système.
- **Commande** : `htop`

### `iotop`

- **Utilité** : Outil pour surveiller l'utilisation du disque par les processus, utile pour diagnostiquer la lenteur du système liée aux opérations d'entrée/sortie.
- **Commande** : `sudo iotop`

### `nmon`

- **Utilité** : Outil de performance système qui affiche les statistiques CPU, mémoire, réseau, disque, et autres en temps réel.
- **Commande** : `nmon`

### `dmesg`

- **Utilité** : Affiche les messages du noyau, utile pour le diagnostic de matériel et les problèmes de démarrage.
- **Commande** : `dmesg | less`

### `lsof`

- **Utilité** : Liste les fichiers ouverts et les processus qui les ont ouverts.
- **Commande** : `lsof /chemin/fichier`
  
## Gestion de Paquets

### `apt` (pour Debian, Ubuntu et dérivés)

- **Utilité** : Outil de gestion de paquets pour les systèmes basés sur Debian, permettant d'installer, mettre à jour et supprimer des logiciels.
- **Commandes** : 
  - Installer un paquet : `sudo apt install nom_paquet`
  - Mettre à jour la liste des paquets : `sudo apt update`
  - Mettre à jour les paquets : `sudo apt upgrade`

### `yum` (pour CentOS, RHEL)

- **Utilité** : Outil de gestion de paquets pour les distributions basées sur Red Hat.
- **Commandes** :
  - Installer un paquet : `sudo yum install nom_paquet`
  - Mettre à jour tous les paquets : `sudo yum update`

### `dnf` (pour Fedora)

- **Utilité** : Le successeur de `yum`, offrant une gestion de paquets améliorée pour Fedora.
- **Commandes** :
  - Installer un paquet : `sudo dnf install nom_paquet`
  - Mettre à jour tous les paquets : `sudo dnf upgrade`

## Sécurité

### `iptables`

- **Utilité** : Outil de filtrage de paquets. `iptables` permet de configurer les règles de firewall au sein du système.
- **Commande** : `sudo iptables -L` pour lister les règles actuelles.

### `chmod` / `chown`

- **Utilité** : Commandes pour modifier les permissions et la propriété des fichiers et répertoires, essentielles pour la sécurisation des données.
- **Commandes** : 
  - `chmod 755 fichier` pour définir les permissions.
  - `chown utilisateur:groupe fichier` pour changer la propriété.
  
### `fail2ban`

- **Utilité** : Protège le système contre les attaques par force brute en bannissant les adresses IP qui tentent de se connecter de manière répétée et échouée.
- **Installation** : `sudo apt install fail2ban` (sur les systèmes basés sur Debian/Ubuntu)

### `ufw`

- **Utilité** : Interface utilisateur simplifiée pour `iptables`, permettant de gérer facilement un pare-feu.
- **Commandes** :
  - Activer ufw : `sudo ufw enable`
  - Autoriser un port : `sudo ufw allow 22`

## Archivage et Compression

### `tar`

- **Utilité** : Outil d'archivage qui permet de regrouper plusieurs fichiers et répertoires en un seul fichier archive `.tar` ou `.tar.gz`.
- **Commandes** :
  - Créer une archive : `tar -cvzf archive.tar.gz /chemin/vers/dossier`
  - Extraire une archive : `tar -xvzf archive.tar.gz`

### `gzip` / `bzip2`

- **Utilité** : Outils de compression de fichiers, avec `bzip2` offrant généralement un taux de compression supérieur à `gzip`.
- **Commandes** :
  - Compresser : `gzip fichier` ou `bzip2 fichier`
  - Décompresser : `gunzip fichier.gz` ou `bunzip2 fichier.bz2`

## Recherche et Triage

### `grep`

- **Utilité** : Recherche des motifs dans le texte. Utile pour trouver des lignes correspondant à un motif dans des fichiers.
- **Commande** : `grep "motif" fichier`

### `find`

- **Utilité** : Recherche de fichiers et de répertoires dans l'arborescence du système de fichiers basée sur divers critères.
- **Commande** : `find /chemin/de/recherche -type f -name "nom_fichier"`

### `sed`

- **Utilité** : L'éditeur de flux pour la transformation de texte. `sed` est extrêmement puissant pour manipuler les fichiers texte de manière programmatique.
- **Commande** : `sed 's/ancien/nouveau/g' fichier`

### `awk`

- **Utilité** : Langage de programmation conçu pour le traitement et l'analyse de fichiers texte. Excellent pour manipuler des données tabulaires.
- **Commande** : `awk '{if ($1 > 100) print $0}' fichier`

### `sort`

- **Utilité** : Trie les lignes d'un fichier texte.
- **Commande** : `sort fichier`

### `uniq`

- **Utilité** : Supprime ou signale les lignes répétées d'un fichier.
- **Commande** : `uniq fichier`

## requette http

### `wget`

- **Utilité** : Outil de téléchargement de fichiers depuis le web.
- **Commande** : `wget [URL]`

### `curl`

- **Utilité** : Outil pour transférer des données depuis ou vers un serveur, utilisé avec de nombreux protocoles.
- **Commande** : `curl [URL]`

## Connectivité

### `ssh`

- **Utilité** : Programme pour se connecter à distance à une autre machine via le protocole SSH.
- **Commande** : `ssh utilisateur@hôte`

### `scp`

- **Utilité** : Permet de copier des fichiers entre des hôtes sur un réseau en utilisant le protocole SSH.
- **Commande** : `scp fichier_source utilisateur@hôte:destination`

### `rsync`

- **Utilité** : Outil de synchronisation de fichiers/dossiers, optimisé pour minimiser la quantité de données transférées.
- **Commande** : `rsync options source destination`

## Développement et Monitoring Réseau

### `netstat`

- **Utilité** : Affiche les connexions réseau, les tables de routage, les statistiques d'interface, les connexions masquées, et plus encore.
- **Commande** : `netstat -tuln`

### `ping`

- **Utilité** : Vérifie la connectivité réseau avec un hôte spécifique. Utile pour diagnostiquer les problèmes de réseau.
- **Commande** : `ping adresse_ip_ou_domaine`

### `traceroute` / `tracepath`

- **Utilité** : Affiche la route empruntée par les paquets pour atteindre un hôte réseau. `traceroute` offre plus d'options, tandis que `tracepath` ne nécessite pas de privilèges élevés.
- **Commande** : `traceroute adresse_ip_ou_domaine` ou `tracepath adresse_ip_ou_domaine`

## Développement et Débogage

### `git`

- **Utilité** : Système de contrôle de version décentralisé pour suivre les modifications dans les fichiers et coordonner le travail entre plusieurs personnes.
- **Commande** : `git clone https://url_du_repository.git`

### `vim` / `nano`

- **Utilité** : Éditeurs de texte en ligne de commande. `vim` est puissant mais a une courbe d'apprentissage plus élevée, tandis que `nano` est plus accessible pour les débutants.
- **Commande** : `vim fichier` ou `nano fichier`

### `gdb`

- **Utilité** : Le GNU Debugger, un outil puissant pour le débogage de programmes écrits en C, C++, et d'autres langages.
- **Commande** : `gdb ./programme`
  
## Gestion de Versions

### `git`

- **Utilité** : Système de contrôle de version décentralisé essentiel pour la gestion de code source et de projets de développement.
- **Commande** : `git clone url_du_dépôt`

## Edition de Texte

### `nano` / `vim`

- **Utilité** : Éditeurs de texte en ligne de commande. `nano` est plus simple et convivial pour les débutants, tandis que `vim` est plus puissant mais a une courbe d'apprentissage plus raide.
- **Commandes** : 
  - `nano fichier`
  - `vim fichier`

## Surveillance de Logs

### `tail`

- **Utilité** : Affiche les dernières lignes d'un fichier texte, souvent utilisé pour surveiller les fichiers de log en temps réel.
- **Commande** : `tail -f /chemin/vers/fichier.log`

### `journalctl`

- **Utilité** : Utilitaire pour interroger et afficher les logs du système journalisés par systemd.
- **Commande** : `journalctl -u nom_du_service`

## Manipulation d'Images Disque

### `dd`

- **Utilité** : Copie et convertit des fichiers bloc par bloc. Utilisé pour créer des images disque, cloner des partitions, etc.
- **Commande** : `dd if=/chemin/vers/source of=/chemin/vers/destination bs=taille_bloc`

## Compression et Archivage

### `zip` / `unzip`

- **Utilité** : Outils pour compresser des fichiers et répertoires en archives `.zip` et pour extraire le contenu d'archives `.zip`.
- **Commandes** :
  - `zip -r archive.zip /chemin/vers/répertoire`
  - `unzip archive.zip`

## Sécurité et Chiffrement

### `gpg`

- **Utilité** : GNU Privacy Guard, outil pour le chiffrement et la signature de données. 
- **Commande** : `gpg -c fichier` pour chiffrer ou `gpg fichier.gpg` pour déchiffrer.

## Virtualisation

### `docker`

- **Utilité** : Plateforme de conteneurisation permettant de développer, déployer et exécuter des applications dans des conteneurs.
- **Commande** : `docker run image`

### `virtualbox`

- **Utilité** : Logiciel de virtualisation pour exécuter plusieurs systèmes d'exploitation simultanément.
- **Installation** : Souvent disponible dans les dépôts de logiciels de votre distribution.


---

<!-- File: curl.md -->



---

<!-- File: rsync.md -->

- [Documentation sur Rsync sous Debian et dérivés](#documentation-sur-rsync-sous-debian-et-dérivés)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Utilisation de base](#utilisation-de-base)
    - [Copie de fichiers localement](#copie-de-fichiers-localement)
    - [Synchronisation entre machines](#synchronisation-entre-machines)
    - [Utilisation de SSH](#utilisation-de-ssh)
  - [Options courantes](#options-courantes)
  - [Conseils pour une utilisation avancée](#conseils-pour-une-utilisation-avancée)
  - [Conclusion](#conclusion)


# Documentation sur Rsync sous Debian et dérivés

## Introduction

Rsync (Remote Synchronization) est un outil puissant et polyvalent pour la copie et la synchronisation de fichiers localement ou entre des systèmes sur un réseau. Il est largement reconnu pour sa rapidité, sa flexibilité, et son efficacité, particulièrement pour la sauvegarde et la synchronisation de répertoires. Rsync compare les fichiers source et destination et ne transfère que les différences (les "delta") entre eux, réduisant ainsi la quantité de données transférées.

## Installation

Sur Debian et ses dérivés, `rsync` peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez :

```bash
sudo apt update
sudo apt install rsync
```

## Utilisation de base

### Copie de fichiers localement

Pour copier des fichiers d'un dossier local à un autre avec rsync :

```bash
rsync -av /source/dossier /destination/dossier
```

Les options `-a` (archive) et `-v` (verbose) sont souvent utilisées pour préserver les métadonnées (comme les permissions et les horodatages) et obtenir des informations détaillées sur le processus de copie.

### Synchronisation entre machines

Pour synchroniser des fichiers d'une machine locale vers une machine distante :

```bash
rsync -av /source/dossier utilisateur@machine_distant:/destination/dossier
```

Inversement, pour copier des fichiers d'une machine distante vers une machine locale :

```bash
rsync -av utilisateur@machine_distant:/source/dossier /destination/dossier
```

### Utilisation de SSH

Par défaut, rsync utilise SSH pour la communication réseau, ce qui assure une transmission sécurisée. Vous pouvez spécifier une clé SSH différente avec l'option `-e` :

```bash
rsync -av -e "ssh -i /chemin/vers/la/clé" /source/dossier utilisateur@machine_distant:/destination/dossier
```

## Options courantes

- `-a, --archive` : Mode archive pour copier des fichiers récursivement et préserver la plupart des attributs.
- `-v, --verbose` : Affiche des informations détaillées pendant la copie.
- `-z, --compress` : Compresse les fichiers pendant le transfert.
- `--delete` : Supprime les fichiers dans le répertoire de destination qui n'existent pas dans le répertoire source.
- `--progress` : Affiche la progression de la copie pour chaque fichier.
- `--exclude` : Exclut les fichiers qui correspondent au motif spécifié.
- `-n, --dry-run` : Simule l'opération sans effectuer de transfert de fichiers.

## Conseils pour une utilisation avancée

- **Sauvegarde incrémentielle** : Rsync est idéal pour les sauvegardes incrémentielles. Utilisez `--link-dest` pour lier à une sauvegarde précédente et économiser de l'espace disque en n'enregistrant que les modifications.
  
- **Sécurité** : Si vous utilisez rsync dans des scripts automatisés, envisagez d'utiliser des clés SSH sans mot de passe pour une synchronisation sécurisée sans intervention manuelle.

- **Optimisation** : Pour les grandes synchronisations, l'option `--compress` peut réduire le temps de transfert, tandis que `--exclude` peut éviter de copier des fichiers inutiles ou temporaires.

## Conclusion

Rsync est un outil essentiel pour la gestion des fichiers et des sauvegardes sous Linux. Sa capacité à transférer uniquement les modifications rend les synchronisations efficaces et rapides. En maîtrisant les options et les configurations de rsync, vous pouvez optimiser vos flux de travail de sauvegarde et de synchronisation, que ce soit pour des tâches personnelles ou dans un environnement serveur.

---

<!-- File: scp.md -->

### Tutoriel et Documentation sur SCP (Secure Copy Protocol)

#### Introduction à SCP

SCP (Secure Copy Protocol) est un outil de ligne de commande utilisé pour le transfert sécurisé de fichiers entre deux ordinateurs sur un réseau. Il utilise SSH (Secure Shell) pour le transfert de données, garantissant ainsi la sécurité des données transférées. SCP est largement utilisé pour copier des fichiers et des dossiers entre un système local et un système distant, ou entre deux systèmes distants.

#### Installation de SCP

SCP est généralement installé avec le paquet SSH sur la plupart des distributions Linux et macOS. Sur Windows, SCP peut être utilisé via Git Bash ou en installant Windows Subsystem for Linux (WSL).

#### Syntaxe de base

La syntaxe de base de SCP est la suivante :

```bash
scp [OPTIONS] source destination
```

- **[OPTIONS]** : Paramètres supplémentaires pour personnaliser le comportement de SCP (facultatif).
- **source** : Le chemin du fichier ou du dossier à copier.
- **destination** : Le chemin où le fichier ou le dossier sera copié.

#### Options de SCP

Voici une liste des options les plus couramment utilisées avec SCP :

- `-P port` : Spécifie le port SSH sur lequel se connecter (si différent du port par défaut 22).
- `-p` : Préserve les attributs des fichiers, tels que le mode d'accès et les horodatages.
- `-r` : Copie récursivement les dossiers entiers.
- `-q` : Mode silencieux, n'affiche pas la barre de progression ni les messages d'erreur.
- `-C` : Active la compression. Utile pour accélérer le transfert de fichiers sur des connexions lentes.
- `-i identity_file` : Utilise un fichier d'identité (clé privée) pour l'authentification SSH.

#### Utilisation de SCP

**Transférer un fichier d'un système local vers un système distant :**

```bash
scp fichier.txt utilisateur@serveurdistant:/chemin/destination/
```

**Transférer un fichier d'un système distant vers un système local :**

```bash
scp utilisateur@serveurdistant:/chemin/source/fichier.txt /chemin/destination/local/
```

**Copier récursivement un dossier vers un système distant :**

```bash
scp -r dossier utilisateur@serveurdistant:/chemin/destination/
```

**Utiliser un port SSH spécifique :**

```bash
scp -P 2222 fichier.txt utilisateur@serveurdistant:/chemin/destination/
```

**Conserver les attributs des fichiers lors du transfert :**

```bash
scp -p fichier.txt utilisateur@serveurdistant:/chemin/destination/
```

#### Exemples complets avec SCP

- **Transférer plusieurs fichiers vers un système distant :**

  ```bash
  scp fichier1.txt fichier2.txt utilisateur@serveurdistant:/chemin/destination/
  ```

- **Transférer un fichier avec compression activée :**

  ```bash
  scp -C gros_fichier.txt utilisateur@serveurdistant:/chemin/destination/
  ```

- **Utiliser un fichier d'identité spécifique pour l'authentification :**

  ```bash
  scp -i ~/.ssh/ma_cle_privee fichier.txt utilisateur@serveurdistant:/chemin/destination/
  ```

#### Conseils et bonnes pratiques

- Assurez-vous que SSH est installé et configuré correctement sur les deux systèmes impliqués dans le transfert.
- Pour améliorer la sécurité, privilégiez l'authentification par clé SSH plutôt que par mot de passe.
- Utilisez l'option `-C` pour la compression sur des transferts de données volumineux et des connexions lentes.
- Testez d'abord le transfert avec un petit fichier pour vous assurer que la connexion et les permissions sont correctement configurées.

SCP est un outil puissant et flexible pour le transfert sécurisé de fichiers. Sa simplicité d'utilisation et sa sécurisation intégrée en font un choix privilégié pour de nombreux administrateurs système et utilisateurs.

---

<!-- File: wget.md -->



---

<!-- File: cat.md -->

- [Documentation de la commande `cat`](#documentation-de-la-commande-cat)
  - [Syntaxe](#syntaxe)
  - [Options Principales](#options-principales)
  - [Utilisation](#utilisation)
  - [Exemples d'Utilisation](#exemples-dutilisation)
    - [1. Afficher le contenu d'un fichier](#1-afficher-le-contenu-dun-fichier)
    - [2. Concaténer plusieurs fichiers](#2-concaténer-plusieurs-fichiers)
    - [3. Ajouter le contenu d'un fichier à la fin d'un autre](#3-ajouter-le-contenu-dun-fichier-à-la-fin-dun-autre)
    - [4. Afficher les numéros de ligne (y compris les lignes vides)](#4-afficher-les-numéros-de-ligne-y-compris-les-lignes-vides)
    - [5. Afficher les numéros de ligne, en ignorant les lignes vides](#5-afficher-les-numéros-de-ligne-en-ignorant-les-lignes-vides)
    - [6. Afficher les tabulations et les fins de ligne](#6-afficher-les-tabulations-et-les-fins-de-ligne)
    - [7. Supprimer les lignes vides multiples](#7-supprimer-les-lignes-vides-multiples)
    - [8. Afficher le contenu de fichiers avec des caractères non imprimables visibles](#8-afficher-le-contenu-de-fichiers-avec-des-caractères-non-imprimables-visibles)
    - [9. Lire l'entrée standard (terminée par CTRL+D en terminal)](#9-lire-lentrée-standard-terminée-par-ctrld-en-terminal)
  - [Conclusion](#conclusion)


La commande `cat` (abréviation de concatenate) est un utilitaire Unix/Linux qui lit, concatène et affiche le contenu de fichiers. Elle est fréquemment utilisée pour afficher le contenu de fichiers, combiner des fichiers et créer de nouveaux fichiers.

# Documentation de la commande `cat`

## Syntaxe

```bash
cat [OPTION]... [FILE]...
```

## Options Principales

- `-A, --show-all` : Équivaut à `-vET`.
- `-b, --number-nonblank` : Numérote toutes les lignes non vides, en commençant par 1.
- `-e` : Équivaut à `-vE`.
- `-E, --show-ends` : Affiche `$` à la fin de chaque ligne.
- `-n, --number` : Numérote toutes les lignes de sortie, en commençant par 1.
- `-s, --squeeze-blank` : Supprime les lignes vides multiples consécutives.
- `-t` : Équivaut à `-vT`.
- `-T, --show-tabs` : Affiche les tabulations comme `^I`.
- `-v, --show-nonprinting` : Utilise la notation `^` et `M-` pour les caractères non imprimables (à l'exception des LF, TAB et FF).
- `--help` : Affiche un message d'aide et quitte.
- `--version` : Affiche les informations de version et quitte.

## Utilisation

La commande `cat` peut être utilisée de plusieurs manières, y compris pour afficher le contenu de fichiers, combiner des fichiers en un seul flux de sortie, et créer de nouveaux fichiers. Si aucun fichier n'est spécifié, ou si le fichier spécifié est `-`, `cat` lit l'entrée standard.

## Exemples d'Utilisation

### 1. Afficher le contenu d'un fichier

```bash
cat fichier.txt
```

### 2. Concaténer plusieurs fichiers

```bash
cat fichier1.txt fichier2.txt > fichier_combiné.txt
```

### 3. Ajouter le contenu d'un fichier à la fin d'un autre

```bash
cat fichier2.txt >> fichier1.txt
```

### 4. Afficher les numéros de ligne (y compris les lignes vides)

```bash
cat -n fichier.txt
```

### 5. Afficher les numéros de ligne, en ignorant les lignes vides

```bash
cat -b fichier.txt
```

### 6. Afficher les tabulations et les fins de ligne

```bash
cat -ET fichier.txt
```

### 7. Supprimer les lignes vides multiples

```bash
cat -s fichier.txt
```

### 8. Afficher le contenu de fichiers avec des caractères non imprimables visibles

```bash
cat -v fichier.txt
```

### 9. Lire l'entrée standard (terminée par CTRL+D en terminal)

```bash
cat > nouveau_fichier.txt
```

10. Concaténer le contenu de plusieurs fichiers et afficher le résultat avec des caractères ### non imprimables visibles

```bash
cat -v fichier1.txt fichier2.txt
```

## Conclusion

`cat` est un outil de base mais extrêmement puissant dans l'arsenal de commandes Unix/Linux, utile pour afficher, combiner, et créer des fichiers. Son utilisation va bien au-delà de ces exemples, offrant une flexibilité dans le traitement et l'affichage du contenu des fichiers. Que vous soyez débutant ou expérimenté en ligne de commande, `cat` est une commande à connaître et à maîtriser.

---

<!-- File: grep.md -->

- [Documentation de la commande `grep`](#documentation-de-la-commande-grep)
  - [Syntaxe](#syntaxe)
  - [Options Principales](#options-principales)
  - [Utilisation](#utilisation)
  - [Exemples d'Utilisation](#exemples-dutilisation)
    - [1. Rechercher une chaîne simple dans un fichier](#1-rechercher-une-chaîne-simple-dans-un-fichier)
    - [2. Recherche insensible à la casse](#2-recherche-insensible-à-la-casse)
    - [3. Rechercher des mots entiers](#3-rechercher-des-mots-entiers)
    - [4. Afficher le numéro de ligne des correspondances](#4-afficher-le-numéro-de-ligne-des-correspondances)
    - [5. Inverser la recherche pour trouver les lignes ne contenant pas le motif](#5-inverser-la-recherche-pour-trouver-les-lignes-ne-contenant-pas-le-motif)
    - [6. Recherche récursive dans tous les fichiers d'un répertoire](#6-recherche-récursive-dans-tous-les-fichiers-dun-répertoire)
    - [7. Utiliser des expressions régulières étendues](#7-utiliser-des-expressions-régulières-étendues)
    - [8. Compter le nombre de lignes correspondant au motif](#8-compter-le-nombre-de-lignes-correspondant-au-motif)
    - [9. Afficher les noms de fichiers contenant le motif, sans les lignes elles-mêmes](#9-afficher-les-noms-de-fichiers-contenant-le-motif-sans-les-lignes-elles-mêmes)
    - [10. Rechercher plusieurs motifs (OR logique)](#10-rechercher-plusieurs-motifs-or-logique)
    - [11. Lire les motifs de recherche à partir d'un fichier](#11-lire-les-motifs-de-recherche-à-partir-dun-fichier)
  - [Conclusion](#conclusion)


La commande `grep` est un outil de recherche de texte utilisé pour rechercher des chaînes de caractères et des expressions régulières au sein de fichiers ou de flux de données. Il affiche les lignes qui correspondent aux motifs spécifiés. Voici une documentation détaillée sur son utilisation, ses paramètres et des exemples pratiques.

# Documentation de la commande `grep`

## Syntaxe

```bash
grep [OPTIONS] PATTERN [FILE...]
grep [OPTIONS] [-e PATTERN | -f FILE] [FILE...]
```

## Options Principales

- `-E, --extended-regexp` : Interprète PATTERN comme une expression régulière étendue (ERE).
- `-F, --fixed-strings` : Interprète PATTERN comme une liste de chaînes fixes, séparées par des nouvelles lignes, plutôt que comme une expression régulière.
- `-G, --basic-regexp` : Interprète PATTERN comme une expression régulière de base (BRE) (par défaut).
- `-P, --perl-regexp` : Interprète PATTERN comme une expression régulière de Perl.
- `-i, --ignore-case` : Ignore la casse dans les correspondances.
- `-v, --invert-match` : Sélectionne les lignes ne correspondant pas au motif.
- `-w, --word-regexp` : Force PATTERN à correspondre seulement à des mots entiers.
- `-x, --line-regexp` : Force PATTERN à correspondre à des lignes entières.
- `-c, --count` : Affiche le nombre de lignes correspondantes au lieu des lignes elles-mêmes.
- `-l, --files-with-matches` : Affiche uniquement les noms des fichiers contenant des correspondances.
- `-L, --files-without-match` : Affiche uniquement les noms des fichiers sans correspondances.
- `-n, --line-number` : Affiche le numéro de ligne avec les lignes correspondantes.
- `-H, --with-filename` : Affiche le nom du fichier avant chaque ligne correspondante.
- `-h, --no-filename` : Ne pas afficher les noms des fichiers lors d'une recherche sur plusieurs fichiers.
- `-r, --recursive` : Recherche récursive dans les sous-répertoires.
- `-e PATTERN` : Utilise PATTERN comme motif de recherche.
- `-f FILE` : Lit les motifs de recherche à partir du fichier FILE.

## Utilisation

`grep` est utilisé pour rechercher du texte en utilisant des motifs. Si aucun fichier n'est spécifié, `grep` recherche dans l'entrée standard. Sinon, il recherche dans les fichiers donnés.

## Exemples d'Utilisation

### 1. Rechercher une chaîne simple dans un fichier

```bash
grep "chaîne" fichier.txt
```

### 2. Recherche insensible à la casse

```bash
grep -i "chaîne" fichier.txt
```

### 3. Rechercher des mots entiers

```bash
grep -w "mot" fichier.txt
```

### 4. Afficher le numéro de ligne des correspondances

```bash
grep -n "texte" fichier.txt
```

### 5. Inverser la recherche pour trouver les lignes ne contenant pas le motif

```bash
grep -v "texte" fichier.txt
```

### 6. Recherche récursive dans tous les fichiers d'un répertoire

```bash
grep -r "motif" /chemin/du/repertoire
```

### 7. Utiliser des expressions régulières étendues

```bash
grep -E "1+2" fichier.txt
```

### 8. Compter le nombre de lignes correspondant au motif

```bash
grep -c "motif" fichier.txt
```

### 9. Afficher les noms de fichiers contenant le motif, sans les lignes elles-mêmes

```bash
grep -l "motif" fichier1.txt fichier2.txt
```

### 10. Rechercher plusieurs motifs (OR logique)

```bash
grep -e "motif1" -e "motif2" fichier.txt
```

### 11. Lire les motifs de recherche à partir d'un fichier

```bash
grep -f motifs.txt fichier.txt
```

## Conclusion

`grep` est un outil essentiel pour filtrer et rechercher du texte. Grâce à ses nombreuses options, il permet une grande flexibilité dans la manipulation et l'analyse de fichiers ou de flux de données. Que vous travailliez sur des scripts shell, analysiez des fichiers de log, ou simplement cherchiez des informations dans des documents, maîtriser `grep` peut considérablement accélérer vos tâches de recherche de texte.

---

<!-- File: head.md -->

La commande `head` est utilisée sous les systèmes d'exploitation Unix et Linux pour afficher les premières lignes d'un ou de plusieurs fichiers textes. Elle est particulièrement utile pour avoir un aperçu rapide du contenu d'un fichier sans avoir besoin de l'ouvrir en entier. Voici une documentation détaillée de `head`, de ses paramètres et de comment l'utiliser, suivie d'une série d'exemples pratiques.

# Documentation de la commande `head`

## Syntaxe

```bash
head [OPTION]... [FILE]...
```

## Options Principales

- `-c, --bytes=[-]NUM` : Affiche les premiers NUM octets de chaque fichier ; avec le préfixe '-', affiche tout sauf les NUM derniers octets de chaque fichier.
- `-n, --lines=[-]NUM` : Affiche les premières NUM lignes au lieu des premières 10 ; avec le préfixe '-', affiche tout sauf les NUM dernières lignes de chaque fichier.
- `-q, --quiet, --silent` : Ne jamais afficher les en-têtes indiquant les noms de fichiers.
- `-v, --verbose` : Toujours afficher les en-têtes indiquant les noms de fichiers.

Par défaut, `head` affiche les 10 premières lignes du ou des fichiers spécifiés.

## Utilisation

### 1. **Afficher les premières lignes d'un fichier 

Pour voir les premières 10 lignes d'un fichier, utilisez simplement `head` suivi du nom du fichier.

### 2. **Spécifier le nombre de lignes 

Pour changer le nombre de lignes à afficher, utilisez l'option `-n` suivi du nombre de lignes souhaité.

### 3. **Afficher les premiers octets 

L'option `-c` permet d'afficher les premiers octets d'un fichier.

### Exemples d'Utilisation

### 1. **Afficher les 10 premières lignes d'un fichier 

```bash
head fichier.txt
```

### 2. **Afficher les 5 premières lignes d'un fichier 

```bash
head -n 5 fichier.txt
```

### 3. **Afficher les 20 premiers octets d'un fichier 

```bash
head -c 20 fichier.txt
```

### 4. **Afficher les 10 premières lignes de plusieurs fichiers 

```bash
head fichier1.txt fichier2.txt
```

### 5. **Afficher tout sauf les 5 dernières lignes d'un fichier 

```bash
head -n -5 fichier.txt
```

### 6. **Afficher les premières lignes sans indiquer les noms des fichiers (silencieux) 

Si vous travaillez avec plusieurs fichiers :

```bash
head -n 5 -q fichier1.txt fichier2.txt
```

### 7. **Afficher les premières lignes avec les noms des fichiers (verbeux) 

Même si l'affichage verbeux est le comportement par défaut pour plusieurs fichiers, vous pouvez l'assurer avec `-v` :

```bash
head -n 5 -v fichier1.txt fichier2.txt
```

##s Conclusion

La commande `head` est un outil de base mais essentiel pour afficher rapidement le début des fichiers sous Unix et Linux. Que vous souhaitiez jeter un œil rapide à un fichier volumineux, ou extraire une certaine quantité de données d'un fichier pour un traitement ultérieur, `head` offre une solution simple et efficace.

---

<!-- File: less.md -->

- [`less`](#less)
  - [Syntaxe](#syntaxe)
  - [Options Principales](#options-principales)
  - [Commandes de Navigation](#commandes-de-navigation)
  - [Exemples d'Utilisation](#exemples-dutilisation)
    - [1. Lire un fichier](#1-lire-un-fichier)
    - [2. Afficher les numéros de ligne](#2-afficher-les-numéros-de-ligne)
    - [3. Recherche insensible à la casse](#3-recherche-insensible-à-la-casse)
    - [4. Afficher les caractères de contrôle (comme les codes de couleur)](#4-afficher-les-caractères-de-contrôle-comme-les-codes-de-couleur)
    - [5. Fusionner les lignes blanches multiples lors de l'affichage](#5-fusionner-les-lignes-blanches-multiples-lors-de-laffichage)
    - [6. Rechercher un motif dans le fichier](#6-rechercher-un-motif-dans-le-fichier)
  - [Conclusion](#conclusion)


# `less`

La commande `less` est un visualiseur de fichiers pour les systèmes Unix et Linux, utilisé pour afficher le contenu de fichiers texte d'une manière permettant de naviguer facilement vers l'avant et l'arrière dans le fichier. Il est particulièrement utile pour lire de longs fichiers ou des flux de données continus. `less` ne charge pas le fichier entier pour l'afficher, ce qui le rend rapide et efficace même avec de très grands fichiers.

## Syntaxe

```bash
less [options] file...
```

## Options Principales

- `-N, --LINE-NUMBERS` : Affiche les numéros de ligne dans la marge gauche.
- `-I, --IGNORE-CASE` : Ignore la casse lors de la recherche.
- `-G, --HILITE-SEARCH` : Supprime le surlignage de la recherche par défaut.
- `-g` : Met en surbrillance seulement la dernière ligne trouvée.
- `-M, --LONG-PROMPT` : Affiche des informations détaillées dans la ligne de prompt.
- `-m, --medium-prompt` : Affiche des informations moins détaillées dans le prompt.
- `-s, --squeeze-blank-lines` : Fusionne les lignes blanches multiples en une seule ligne blanche.
- `-R, --RAW-CONTROL-CHARS` : Affiche les caractères de contrôle de couleur.
- `-?` : Affiche l'aide sur les commandes moins courantes.

## Commandes de Navigation

Une fois `less` ouvert, vous pouvez utiliser diverses commandes de navigation pour parcourir le fichier :

- `Space` ou `f` : Fait défiler d'une page vers l'avant.
- `b` : Fait défiler d'une page vers l'arrière.
- `d` : Fait défiler d'une demi-page vers l'avant.
- `u` : Fait défiler d'une demi-page vers l'arrière.
- `g` : Va au début du fichier.
- `G` : Va à la fin du fichier.
- `/motif` : Recherche un motif vers l'avant.
- `?motif` : Recherche un motif vers l'arrière.
- `n` : Répète la recherche précédente dans la même direction.
- `N` : Répète la recherche précédente dans la direction opposée.
- `q` : Quitte `less`.

## Exemples d'Utilisation

### 1. Lire un fichier

```bash
less fichier.txt
```

### 2. Afficher les numéros de ligne

```bash
less -N fichier.txt
```

### 3. Recherche insensible à la casse

Lancez `less` sans option :

```bash
less fichier.txt
```

Puis tapez `-I` avant de faire une recherche pour ignorer la casse.

### 4. Afficher les caractères de contrôle (comme les codes de couleur)

```bash
less -R fichier.log
```

### 5. Fusionner les lignes blanches multiples lors de l'affichage

```bash
less -s fichier.txt
```

### 6. Rechercher un motif dans le fichier

Après avoir ouvert le fichier avec `less`, tapez `/<motif>` et appuyez sur `Enter` pour chercher `<motif>` vers l'avant. Utilisez `?<motif>` pour chercher vers l'arrière.

## Conclusion

`less` est un outil extrêmement utile pour lire et inspecter le contenu des fichiers de manière interactive, offrant une variété de commandes pour rechercher et naviguer dans les fichiers. Il est particulièrement précieux pour travailler avec de gros fichiers ou des flux en continu, car il ne nécessite pas de charger le fichier entier en mémoire. Maîtriser `less` et ses commandes peut grandement améliorer votre efficacité lors de la manipulation de fichiers textuels dans un environnement Unix ou Linux.