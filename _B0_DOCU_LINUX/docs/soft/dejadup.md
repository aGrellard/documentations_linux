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