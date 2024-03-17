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