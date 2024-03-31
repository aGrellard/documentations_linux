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