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