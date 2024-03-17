# Documentation sur UFW (Uncomplicated Firewall) sous Debian et dérivés

## Introduction

UFW (Uncomplicated Firewall) est une interface simplifiée pour gérer `iptables`, le pare-feu par défaut sous Linux. Conçu pour faciliter la configuration du pare-feu, UFW permet de gérer facilement des règles de pare-feu complexes avec des commandes simples. UFW est particulièrement adapté pour les personnes qui cherchent à sécuriser leur serveur ou leur poste de travail Linux sans se plonger dans la complexité d'`iptables`.

## Installation

Sur Debian et ses dérivés, UFW peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install ufw
```

## Activation et Statut

Pour activer UFW :

```bash
sudo ufw enable
```

Pour vérifier le statut d'UFW :

```bash
sudo ufw status verbose
```

## Configuration de Base

### Règles par défaut

Il est recommandé de définir les politiques par défaut avant d'ajouter des règles spécifiques. Habituellement, on autorise les connexions sortantes et on refuse les connexions entrantes par défaut :

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### Autoriser/Denier des Services Spécifiques

- **Autoriser le SSH** :

  ```bash
  sudo ufw allow ssh
  ```

  Ou, spécifiez le port si SSH tourne sur un port non standard :

  ```bash
  sudo ufw allow 2222/tcp
  ```

- **Autoriser HTTP/HTTPS** :

  ```bash
  sudo ufw allow http
  sudo ufw allow https
  ```

- **Denier l'accès à un service** :

  ```bash
  sudo ufw deny http
  ```

### Gestion des Règles

- **Lister toutes les règles** :

  ```bash
  sudo ufw status numbered
  ```

- **Supprimer une règle** (en utilisant le numéro de la règle affiché par la commande précédente) :

  ```bash
  sudo ufw delete 1
  ```

- **Autoriser l'accès depuis une adresse IP spécifique** :

  ```bash
  sudo ufw allow from 192.168.1.5 to any port 22
  ```

### Utilisation de profils d'application

UFW permet de définir des profils pour des applications, facilitant ainsi la gestion des règles pour des services spécifiques. Les profils d'applications sont stockés dans `/etc/ufw/applications.d/`.

- **Lister les profils disponibles** :

  ```bash
  sudo ufw app list
  ```

- **Autoriser un service par son profil d'application** :

  ```bash
  sudo ufw allow 'Nginx Full'
  ```

### Journalisation

La journalisation peut être activée pour aider à surveiller et à diagnostiquer les activités du pare-feu :

```bash
sudo ufw logging on
```

Les logs sont généralement disponibles dans `/var/log/ufw.log`.

### Désactivation et Réinitialisation

Pour désactiver UFW temporairement :

```bash
sudo ufw disable
```

Pour réinitialiser UFW aux paramètres par défaut :

```bash
sudo ufw reset
```

## Conclusion

UFW offre une approche simplifiée pour la gestion des pare-feux sous Linux, rendant la sécurisation de votre système plus accessible sans sacrifier la puissance et la flexibilité. En suivant les instructions de base fournies dans cette documentation, vous pouvez configurer efficacement UFW pour protéger votre serveur ou poste de travail Debian. N'oubliez pas de tester vos règles de pare-feu pour vous assurer qu'elles répondent à vos besoins de sécurité sans interrompre les services légitimes.