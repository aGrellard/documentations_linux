---
title: Multipass
date: 2024-07-12
date de modification: 2024-07-12
timestamp: 17:59
tags:
  - templates
  - projet
  - linux
  - virtualisations
  - programmes
status:
  - En cours
type de note:
  - projet
auteur: aGrellard
source:
  - chatgpt
  - https://dynops.fr/
  - https://multipass.run/docs/
  - https://korben.info
---
- [x] Description
- [x] Installation sous linux (ubuntu, debian)
- [x] multipass find
- [ ] images qui ont été téléchargés et mis en cache localement par Multipass.
- [ ] Config
	- [x] shell
	- [x] exec
	- [x] Configuration personnalisée des VM
	- [x] Utilisation des fichiers cloud-init
- [ ] utilisation
	- [ ] ssh
	- [ ] environnement de bureau graphique
	- [ ] vnc

# Multipass

## Introduction

Multipass est un outil de Canonical, l'entreprise derrière Ubuntu, qui facilite la création et la gestion de machines virtuelles (VMs) sur Linux, macOS et Windows. Il est particulièrement utile pour les développeurs et les administrateurs système qui ont besoin de VMs légères et rapides pour des tests, du développement ou des déploiements simples.
## Pourquoi utiliser Multipass ?

1. **Tests sur une VM** : Si vous devez tester des applications ou des configurations système dans un environnement propre et isolé, une VM est souvent préférable à un conteneur Docker, car elle offre une isolation complète.
    
2. **Scaling horizontal** : Si vous avez besoin de créer plusieurs instances de serveurs pour des tests de charge ou de scalabilité, Multipass vous permet de lancer plusieurs VMs rapidement et facilement.
    
3. **Simplicité et rapidité** : Multipass simplifie le processus de création et de gestion des VMs avec des commandes simples et des images prêtes à l'emploi d'Ubuntu et Debian.


- **Les avantages de Multipass** : [[multipass-avantages]]
- **Comparaison** : [[multipass-vs-virtualbox]]
## Installation sous debian/ubuntu

Deux méthodes pour installer Multipass sur Debian 12 (via Snap et via le paquet `.deb`) elles ont leurs propres avantages et inconvénients. Voici une comparaison pour vous aider à décider laquelle est la meilleure pour votre cas d'utilisation :

### Installation via Snap

**Avantages :**
1. **Mises à jour automatiques :** Les applications installées via Snap se mettent à jour automatiquement, vous n'avez donc pas à vous soucier de maintenir Multipass à jour manuellement.
2. **Isolation :** Snap installe les applications dans un environnement isolé, réduisant ainsi les risques de conflits avec d'autres paquets.
3. **Facilité d'installation :** Le processus est simplifié et standardisé.

**Inconvénients :**
1. **Dépendances de Snap :** Vous devez installer et configurer Snap sur votre système, ce qui peut ne pas être souhaitable pour certains utilisateurs ou dans certaines configurations.
2. **Performances :** Les applications Snap peuvent parfois avoir des performances légèrement inférieures en raison de la couche d'abstraction supplémentaire.
3. **Utilisation d'espace disque :** Snap utilise plus d'espace disque en raison de l'isolation et de la duplication des bibliothèques.

### Installation via le paquet `.deb`

**Avantages :**
1. **Contrôle :** Vous avez un contrôle total sur le processus d'installation et les mises à jour.
2. **Performances :** Les paquets `.deb` sont installés directement dans le système, ce qui peut offrir de meilleures performances.
3. **Intégration système :** Les paquets `.deb` s'intègrent mieux avec le système Debian, utilisant les bibliothèques partagées et les services existants.

**Inconvénients :**
1. **Mises à jour manuelles :** Vous devez mettre à jour Multipass manuellement en téléchargeant et en installant la nouvelle version.
2. **Complexité :** Le processus peut être légèrement plus complexe, notamment si des dépendances manquent.
3. **Conflits potentiels :** Il peut y avoir des conflits avec d'autres paquets installés sur le système.

### Quelle méthode est la meilleure ?

La meilleure méthode dépend de vos besoins spécifiques :

- **Si vous préférez la simplicité et les mises à jour automatiques :** L'installation via Snap est probablement la meilleure option. Elle est plus simple et nécessite moins d'intervention manuelle.

- **Si vous avez besoin de performances optimales et d'une intégration plus étroite avec votre système :** L'installation via le paquet `.deb` peut être préférable. Cela offre un meilleur contrôle et une meilleure intégration, bien que cela demande un peu plus de gestion manuelle.

> En résumé, pour un utilisateur qui souhaite une solution facile et maintenable avec peu de gestion, Snap est recommandé. Pour un utilisateur avancé qui cherche à optimiser les performances et l'intégration, l'utilisation du paquet `.deb` serait plus adaptée.

**Installation de Multipass via snap** : [[multipass-installation-snap]]
**Installation de Multipass via paquet** `.deb` : [[multipass-installation-deb]]

## Fonctionnement de Multipass

Multipass fonctionne en créant des machines virtuelles (instances) légères basées sur Ubuntu. Vous pouvez lancer, gérer et supprimer ces instances facilement à l'aide de la ligne de commande. Multipass utilise des images cloud d'Ubuntu pour déployer rapidement de nouvelles instances.

## Syntaxe de la commande Multipass

La syntaxe de base pour utiliser Multipass est :

```bash
multipass [commande] [options]
```

## Options de la commande Multipass

### find

#### Les images dans Multipass

Multipass, tout comme Docker, utilise des "images" pour créer des machines virtuelles (VMs). Ces images sont des modèles de VMs qui contiennent un système d'exploitation préconfiguré et, parfois, des logiciels supplémentaires. Cela permet de lancer rapidement des VMs avec différentes configurations.

#### Lister les images disponibles

```bash
multipass find
```
##### Exemple de sortie :

```bash
$ multipass find
Image                   Aliases           Version          Description
core                    core16            16.04            Ubuntu Core 16
core18                  core18            18.04            Ubuntu Core 18
18.04                   bionic            20210429         Ubuntu 18.04 LTS
20.04                   focal,lts         20210429         Ubuntu 20.04 LTS
21.04                   hirsute           20210429         Ubuntu 21.04
```

#### Recherche d'Images par Nom

Vous pouvez également rechercher des images spécifiques en utilisant un mot-clé. Par exemple, pour rechercher des images associées à "core":

```bash
multipass find core
```


### launch

La commande `multipass launch` est utilisée pour créer et lancer une nouvelle machine virtuelle (VM) à l'aide de Multipass. Elle télécharge et configure une **image système**, généralement **Ubuntu**, et démarre la VM avec les paramètres spécifiés.

```bash
multipass launch [image] [options]
```

### Les options de `multipass launch [image]`

Image optionnelle à lancer. Si omise, l'image par défaut d'**Ubuntu LTS** sera utilisée.

- `<remote>` peut être soit 'release', soit 'daily'. Si `<remote>` est omis, 'release' sera utilisé.
- `<image>` peut être un hash partiel d'image ou une version, un nom de code ou un alias d'Ubuntu.
- `<url>` est une URL d'image personnalisée au format http://, https:// ou file://.

##### Lancer une instance avec une image spécifique

Pour **lancer** une instance avec l'image **Ubuntu 20.04** :

```
multipass launch 20.04 --name my-ubuntu-20-04
```

Cette commande lance une nouvelle instance avec l'image Ubuntu 20.04 et lui donne le nom `my-ubuntu-20-04`.
### Les options de `multipass launch [options]`
#### Listes de options disponibles

- `-h, --help` : Affiche l'aide sur les options de ligne de commande.
	
- `-v, --verbose` : Augmente la verbosité des journaux. 
	
- `-c, --cpus <cpus>`

	Nombre de processeurs à allouer.
	*Minimum : 1, par défaut : 1.*
	
- `-d, --disk <disk>`

	Espace disque à allouer. Entiers positifs en octets, ou décimaux, avec les suffixes K, M, G.
	*Minimum : 512M, par défaut : 5G.*
	
- `-m, --memory <memory>`

	Quantité de mémoire à allouer. Entiers positifs en octets, ou décimaux, avec les suffixes K, M, G.
	*Minimum : 128M, par défaut : 1G.*
	
- `-n, --name <name>`

	Nom de l'instance. Si c'est 'primary' (le nom de l'instance principale configurée), le répertoire personnel de l'utilisateur est monté à l'intérieur de l'instance nouvellement lancée, dans 'Home'.
	Les noms valides doivent se composer de lettres, de chiffres ou de tirets, commencer par une lettre et se terminer par un caractère alphanumérique.
	
- `--cloud-init <file> | <url>`

	Chemin ou URL vers une configuration cloud-init user-data, ou '-' pour stdin.
	
- `--network <spec>`

	Ajoute une interface réseau à l'instance, où `<spec>` est au format "clé=valeur,clé=valeur", avec les clés suivantes disponibles :
	
	- name : le réseau auquel se connecter (requis), utilisez la commande networks pour obtenir une liste des valeurs possibles, ou utilisez 'bridged' pour utiliser l'interface configurée via multipass set local.bridged-network.
	- mode : auto|manual (par défaut : auto)
	- mac : adresse matérielle (par défaut : aléatoire).
	
	Vous pouvez également utiliser un raccourci de `<name>` pour signifier "name= `<name>`".

- `--bridged`

	Ajoute un réseau --network bridged.
	
- `--mount` `<local-path>` : `<instance-path>`

	Monte un répertoire local à l'intérieur de l'instance. Si `<instance-path>` est omis, le point de montage sera le même que le chemin absolu de `<local-path>`.
	
- `--timeout` `<timeout>`

	Temps maximum, en secondes, pour attendre la fin de la commande. Notez que certaines opérations en arrière-plan peuvent continuer au-delà de ce délai. Par défaut, le démarrage et l'initialisation de l'instance sont limités à 5 minutes chacun.

#### Exemple 1 : Création d'une VM personnalisée

```bash
multipass launch --name custom-vm --cpus 4 --mem 8G --disk 20G
```

**Description**:
- Cette commande crée une machine virtuelle (VM) nommée `custom-vm` avec les spécifications suivantes :
  - **4 CPU** : La VM aura 4 processeurs.
  - **8 Go de RAM** : La VM aura 8 gigaoctets de mémoire vive.
  - **20 Go d'espace disque** : La VM aura un disque dur virtuel de 20 gigaoctets.

#### Exemple 2 : Création d'une VM avec configuration Cloud-init

```bash
multipass launch --name custom-vm --cpus 4 --mem 8G --disk 40G --cloud-init config.yaml
```

**Description**:
- Cette commande crée une machine virtuelle (VM) nommée `custom-vm` avec les spécifications suivantes :
  - **4 CPU** : La VM aura 4 processeurs.
  - **8 Go de RAM** : La VM aura 8 gigaoctets de mémoire vive.
  - **40 Go d'espace disque** : La VM aura un disque dur virtuel de 40 gigaoctets.
  - **Configuration Cloud-init** : La VM sera configurée à l'aide du fichier `config.yaml`.

#### Explication des options utilisées

- `--name custom-vm` : Spécifie le nom de la VM, ici `custom-vm`.
- `--cpus 4` : Définit le nombre de CPU alloués à la VM à 4.
- `--mem 8G` : Définit la mémoire vive allouée à la VM à 8 gigaoctets.
- `--disk 20G` ou `--disk 40G` : Définit la taille du disque alloué à la VM (20 Go ou 40 Go respectivement).
- `--cloud-init config.yaml` : Utilise un fichier de configuration Cloud-init nommé `config.yaml` pour configurer la VM lors de sa création.

#### Utilisation de Cloud-init

**Cloud-init** est un outil standard pour le provisionnement des instances de cloud. Il permet de passer des configurations initiales à la VM, telles que l'installation de packages, la création d'utilisateurs, ou la configuration réseau.

#### Exemple de fichier Cloud-init (`config.yaml`)

```yaml
#cloud-config
users:
  - name: myuser
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArzT1...

package_update: true
packages:
  - git
  - curl
  - htop

runcmd:
  - echo "Hello, World!" > /home/myuser/hello.txt
  - apt-get update
  - apt-get upgrade -y
```

**Explication du fichier `config.yaml`**:
- **users** : Crée un utilisateur `myuser` avec des privilèges sudo et ajoute une clé SSH pour l'authentification.
- **packages** : Installe les packages `git`, `curl` et `htop`.
- **runcmd** : Exécute des commandes à la fin de la phase de cloud-init (mise à jour du système, création d'un fichier texte).


### shell
#### Fonctionnement de la commande `multipass shell`

La commande `multipass shell` permet d'ouvrir un shell interactif dans une instance Multipass en cours d'exécution. Cela vous permet de vous connecter directement à l'instance et d'exécuter des commandes comme si vous étiez connecté localement à la machine virtuelle.

#### Syntaxe de la commande `multipass shell`

```bash
multipass shell <nom_instance>
```

##### Arguments

- `<nom_instance>` : Le nom de l'instance dans laquelle vous souhaitez ouvrir un shell.
##### Exemples 

###### Exemple 1 : Ouvrir un shell dans une instance

Pour ouvrir un shell dans l'instance `test-instance` :

```bash
multipass shell test-instance
```

**Explication :** Cette commande ouvre un shell interactif dans l'instance `test-instance`, vous permettant d'exécuter des commandes directement dans cette instance.

###### Exemple 2 : Utiliser des options de ligne de commande

Bien que `multipass shell` ne prenne pas directement d'options de ligne de commande spécifiques, vous pouvez combiner cette commande avec d'autres commandes Multipass pour créer des workflows automatisés.

**Exemple : Créer une instance, lister les instances, et ouvrir un shell**

```bash
multipass launch --name my-instance
multipass list
multipass shell my-instance
```

**Explication :** Ces commandes créent une nouvelle instance nommée `my-instance`, listent toutes les instances en cours d'exécution, et ouvrent ensuite un shell dans l'instance `my-instance`.
### exec

#### Fonctionnement

La commande `multipass exec` permet d'exécuter des commandes à l'intérieur d'une instance Multipass. Elle est utile pour automatiser des tâches, exécuter des scripts, et gérer les instances sans avoir besoin de se connecter manuellement à chaque instance.

#### Syntaxe

```bash
multipass exec <instance> -- <commande> [arguments]
```

##### Arguments

- `<instance>` : Le nom de l'instance dans laquelle exécuter la commande.
- `<commande>` : La commande à exécuter à l'intérieur de l'instance.
- `[arguments]` : Les arguments de la commande.

#### Exemples concrets

- ##### Exemple 1 : Exécuter une commande simple

	Pour exécuter la commande `ls` dans l'instance `test-instance` :

	```bash
	multipass exec test-instance -- ls
	```

	**Explication :** Cette commande exécute `ls` dans l'instance `test-instance` et affiche la liste des fichiers et répertoires.

- ##### Exemple 2 : Exécuter une commande avec des arguments

	Pour exécuter la commande `ls -l` dans l'instance `test-instance` :

	```bash
	multipass exec test-instance -- ls -l
	```

	**Explication :** Cette commande exécute `ls -l` dans l'instance `test-instance` et affiche la liste détaillée des fichiers et répertoires.

- ##### Exemple 3 : Exécuter un script Bash dans une instance

	Supposons que vous ayez un script `script.sh` à exécuter dans l'instance `test-instance` :

	```bash
	multipass exec test-instance -- bash -c "echo 'Hello, World!'"
	```

	**Explication :** Cette commande exécute un script Bash qui affiche "Hello, World!" dans l'instance `test-instance`.


### transfer
#### Fonctionnement de la commande `multipass transfer`

La commande `multipass transfer` permet de copier des fichiers depuis le système hôte vers une instance Multipass ou depuis une instance vers le système hôte. Cela facilite le partage de données entre l'hôte et les instances.

#### Syntaxe de la commande `multipass transfer`

```bash
multipass transfer <source> <destination>
```

##### Arguments

- `<source>` : Le chemin du fichier source sur le système hôte ou l'instance.
- `<destination>` : Le chemin de destination sur l'instance ou le système hôte.

#### Options de la commande `multipass transfer`

La commande `multipass transfer` n'a pas d'options spécifiques. Elle nécessite uniquement les chemins source et destination.

#### Exemples

##### Exemple 1 : Transférer un fichier vers une instance

Pour transférer un fichier `example.txt` depuis le système hôte vers le répertoire `/home/ubuntu/` dans une instance nommée `my-instance` :

```bash
multipass transfer example.txt my-instance:/home/ubuntu/
```

**Explication :** Cette commande copie le fichier `example.txt` depuis le système hôte vers le répertoire `/home/ubuntu/` dans l'instance `my-instance`.

##### Exemple 2 : Transférer un fichier depuis une instance

Pour transférer un fichier `example.txt` depuis le répertoire `/home/ubuntu/` dans l'instance `my-instance` vers le système hôte :

```bash
multipass transfer my-instance:/home/ubuntu/example.txt .
```

**Explication :** Cette commande copie le fichier `example.txt` depuis le répertoire `/home/ubuntu/` dans l'instance `my-instance` vers le répertoire courant sur le système hôte.
### mount

#### Fonctionnement de la commande `multipass mount`

La commande `multipass mount` permet de monter un répertoire local du système hôte dans une instance Multipass. Cela signifie que les fichiers du répertoire local seront accessibles dans l'instance comme s'ils faisaient partie de son système de fichiers. Cette fonctionnalité est particulièrement utile pour partager des fichiers de configuration, des scripts, ou d'autres données entre l'hôte et les instances.

#### Syntaxe de la commande `multipass mount`

```bash
multipass mount <répertoire_local> <nom_instance>:<répertoire_instance>
```

##### Arguments

- `<répertoire_local>` : Le chemin du répertoire sur le système hôte à monter dans l'instance.
- `<nom_instance>` : Le nom de l'instance dans laquelle monter le répertoire.
- `<répertoire_instance>` : Le chemin de destination dans l'instance où le répertoire local sera monté.

#### Options de la commande `multipass mount`

La commande `multipass mount` n'a pas d'options spécifiques. Elle nécessite uniquement les chemins du répertoire local et du répertoire de destination dans l'instance.

#### Exemples

##### Exemple 1 : Monter un répertoire local dans une instance

Pour monter un répertoire local `/home/user/documents` dans le répertoire `/mnt/documents` d'une instance nommée `my-instance` :

```bash
multipass mount /home/user/documents my-instance:/mnt/documents
```

**Explication :** Cette commande monte le répertoire `/home/user/documents` du système hôte dans le répertoire `/mnt/documents` de l'instance `my-instance`.

##### Exemple 2 : Monter un répertoire avec un chemin d'accès spécifique

Pour monter un répertoire local `/var/log` dans le répertoire `/logs` d'une instance nommée `test-instance` :

```bash
multipass mount /var/log test-instance:/logs
```

**Explication :** Cette commande monte le répertoire `/var/log` du système hôte dans le répertoire `/logs` de l'instance `test-instance`.

##### Exemple 3 : Utiliser les montages multiples

Pour monter plusieurs répertoires locaux dans différentes instances ou dans différents répertoires d'une même instance :

```bash
multipass mount /home/user/code my-instance:/home/ubuntu/code
multipass mount /home/user/data other-instance:/home/ubuntu/data
```

**Explication :** Ces commandes montent respectivement le répertoire `/home/user/code` dans le répertoire `/home/ubuntu/code` de l'instance `my-instance` et le répertoire `/home/user/data` dans le répertoire `/home/ubuntu/data` de l'instance `other-instance`.
### copy-files

#### Fonctionnement de la commande `multipass copy-files`

La commande `multipass copy-files` permet de copier des fichiers et des répertoires depuis le système hôte vers une instance Multipass ou depuis une instance vers le système hôte. Cela facilite le partage de données entre l'hôte et les instances.

#### Syntaxe de la commande `multipass copy-files`

```bash
multipass copy-files <source> <destination>
```

##### Arguments

- `<source>` : Le chemin du fichier ou du répertoire source sur le système hôte ou l'instance.
- `<destination>` : Le chemin de destination sur l'instance ou le système hôte.

#### Exemples

##### Exemple 1 : Copier un fichier vers une instance

Pour copier un fichier `example.txt` depuis le système hôte vers le répertoire `/home/ubuntu/` dans une instance nommée `my-instance` :

```bash
multipass copy-files example.txt my-instance:/home/ubuntu/
```

**Explication :** Cette commande copie le fichier `example.txt` depuis le système hôte vers le répertoire `/home/ubuntu/` dans l'instance `my-instance`.

##### Exemple 2 : Copier un fichier depuis une instance

Pour copier un fichier `example.txt` depuis le répertoire `/home/ubuntu/` dans l'instance `my-instance` vers le système hôte :

```bash
multipass copy-files my-instance:/home/ubuntu/example.txt .
```

**Explication :** Cette commande copie le fichier `example.txt` depuis le répertoire `/home/ubuntu/` dans l'instance `my-instance` vers le répertoire courant sur le système hôte.

##### Exemple 3 : Copier un répertoire vers une instance

Pour copier un répertoire `myfolder` depuis le système hôte vers le répertoire `/home/ubuntu/` dans une instance nommée `my-instance` :

```bash
multipass copy-files myfolder my-instance:/home/ubuntu/
```

**Explication :** Cette commande copie le répertoire `myfolder` depuis le système hôte vers le répertoire `/home/ubuntu/` dans l'instance `my-instance`.

##### Exemple 4 : Copier un répertoire depuis une instance

Pour copier un répertoire `myfolder` depuis le répertoire `/home/ubuntu/` dans l'instance `my-instance` vers le système hôte :

```bash
multipass copy-files my-instance:/home/ubuntu/myfolder .
```

**Explication :** Cette commande copie le répertoire `myfolder` depuis le répertoire `/home/ubuntu/` dans l'instance `my-instance` vers le répertoire courant sur le système hôte.
### delete
#### Fonctionnement de la commande `multipass delete`

La commande `multipass delete` marque une ou plusieurs instances pour suppression. Une fois marquées, les instances sont arrêtées et doivent être purgées pour être complètement supprimées du système.

#### Syntaxe de la commande `multipass delete`

```bash
multipass delete [options] <instance>
```

##### Arguments

- `<instance>` : Le nom de l'instance à supprimer. Vous pouvez spécifier plusieurs noms d'instances séparés par des espaces.

#### Exemples

##### Exemple 1 : Supprimer une instance spécifique

Pour supprimer une instance nommée `test-instance` :

```bash
multipass delete test-instance
```

**Explication :** Cette commande marque l'instance `test-instance` pour suppression. L'instance doit être purgée pour être complètement supprimée du système.

##### Exemple 2 : Supprimer plusieurs instances

Pour supprimer plusieurs instances nommées `instance1` et `instance2` :

```bash
multipass delete instance1 instance2
```

**Explication :** Cette commande marque les instances `instance1` et `instance2` pour suppression. Les instances doivent être purgées pour être complètement supprimées du système.

##### Exemple 3 : Supprimer toutes les instances marquées pour suppression

Après avoir marqué des instances pour suppression, utilisez la commande `multipass purge` pour les supprimer complètement :

```bash
multipass purge
```

**Explication :** Cette commande supprime définitivement toutes les instances marquées pour suppression avec la commande `multipass delete`.

### recover

#### Fonctionnement de la commande `multipass recover`

La commande `multipass recover` permet de restaurer une ou plusieurs instances qui ont été supprimées ou marquées pour suppression. Lorsque vous supprimez une instance avec `multipass delete`, elle est marquée pour suppression et peut être récupérée tant que la commande `multipass purge` n'a pas été exécutée.

#### Syntaxe de la commande `multipass recover`

```bash
multipass recover <instance>
```

##### Arguments

- `<instance>` : Le nom de l'instance à récupérer. Vous pouvez spécifier plusieurs noms d'instances séparés par des espaces.

#### Exemples concrets

##### Exemple 1 : Récupérer une instance spécifique

Pour récupérer une instance nommée `test-instance` qui a été supprimée :

```bash
multipass recover test-instance
```

**Explication :** Cette commande restaure l'instance `test-instance` qui a été marquée pour suppression avec `multipass delete`.
### purge

#### Fonctionnement de la commande `multipass purge`

La commande `multipass purge` efface définitivement toutes les instances qui ont été marquées pour suppression. Lorsqu'une instance est supprimée avec `multipass delete`, elle n'est pas immédiatement effacée du système ; elle est marquée pour suppression et reste sur le disque jusqu'à ce que la commande `multipass purge` soit exécutée.

#### Syntaxe de la commande `multipass purge`

```bash
multipass purge
```

#### Arguments

La commande `multipass purge` n'accepte pas d'arguments. Elle supprime toutes les instances marquées pour suppression.

#### Exemples

##### Exemple : Purger toutes les instances supprimées

Supposons que vous ayez marqué plusieurs instances pour suppression :

```bash
multipass delete instance1 instance2 instance3
```

Pour supprimer définitivement ces instances du système, exécutez la commande suivante :

```bash
multipass purge
```

**Explication :** Cette commande efface définitivement toutes les instances marquées pour suppression (`instance1`, `instance2`, et `instance3`), libérant ainsi l'espace disque qu'elles occupaient.