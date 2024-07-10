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