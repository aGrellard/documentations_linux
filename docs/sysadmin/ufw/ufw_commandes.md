- [Commandes `ufw` et Exemples](#commandes-ufw-et-exemples)
    - [ufw enable](#ufw-enable)
    - [ufw disable](#ufw-disable)
    - [ufw status](#ufw-status)
    - [ufw status numbered](#ufw-status-numbered)
    - [ufw allow](#ufw-allow)
    - [ufw deny](#ufw-deny)
    - [ufw reject](#ufw-reject)
    - [ufw delete](#ufw-delete)
    - [ufw default](#ufw-default)
    - [ufw reset](#ufw-reset)
    - [ufw logging](#ufw-logging)
    - [ufw reload](#ufw-reload)
    - [ufw version](#ufw-version)
  - [Conclusion](#conclusion)


# Commandes `ufw` et Exemples

`ufw` (Uncomplicated Firewall) est un outil de gestion de pare-feu pour les systèmes Linux qui simplifie le processus de configuration d'`iptables`. Voici un aperçu de ses commandes les plus utilisées, chacune accompagnée d'un exemple pratique.

### ufw enable

- **Description** : Active le pare-feu `ufw`.
- **Exemple** :
  ```bash
  sudo ufw enable
  ```

### ufw disable

- **Description** : Désactive le pare-feu `ufw`.
- **Exemple** :
  ```bash
  sudo ufw disable
  ```

### ufw status

- **Description** : Affiche l'état actuel et les règles de `ufw`.
- **Exemple** :
  ```bash
  sudo ufw status
  ```
  ```bash
  sudo ufw status verbose
  ```

### ufw status numbered

- **Description** : Affiche les règles avec des numéros pour faciliter la suppression.
- **Exemple** :
  ```bash
  sudo ufw status numbered
  ```

### ufw allow

- **Description** : Autorise le trafic sur un port ou pour un protocole spécifique.
- **Exemple** : Autoriser le trafic SSH.
  ```bash
  sudo ufw allow 22
  ```
  Autoriser le trafic HTTP.
  ```bash
  sudo ufw allow http
  ```

### ufw deny

- **Description** : Bloque le trafic sur un port ou pour un protocole spécifique.
- **Exemple** : Bloquer le trafic sur le port 80.
  ```bash
  sudo ufw deny 80
  ```

### ufw reject

- **Description** : Rejette le trafic sur un port ou pour un protocole spécifique, en envoyant une réponse d'erreur.
- **Exemple** : Rejeter le trafic sur le port 25.
  ```bash
  sudo ufw reject 25
  ```

### ufw delete

- **Description** : Supprime une règle spécifique.
- **Exemple** : Supprimer une règle par son numéro.
  ```bash
  sudo ufw delete 1
  ```

### ufw default

- **Description** : Définit la politique par défaut pour le trafic entrant/sortant.
- **Exemple** : Définir la politique par défaut pour le trafic entrant sur DENY.
  ```bash
  sudo ufw default deny incoming
  ```
  Et pour le trafic sortant sur ALLOW.
  ```bash
  sudo ufw default allow outgoing
  ```

### ufw reset

- **Description** : Réinitialise la configuration de `ufw` à son état par défaut.
- **Exemple** :
  ```bash
  sudo ufw reset
  ```

### ufw logging

- **Description** : Active ou désactive la journalisation.
- **Exemple** : Activer la journalisation.
  ```bash
  sudo ufw logging on
  ```

### ufw reload

- **Description** : Recharge la configuration `ufw` sans arrêter le pare-feu.
- **Exemple** :
  ```bash
  sudo ufw reload
  ```

### ufw version

- **Description** : Affiche la version de `ufw`.
- **Exemple** :
  ```bash
  ufw version
  ```

## Conclusion

`ufw` fournit une interface simplifiée pour gérer `iptables`, rendant la gestion du pare-feu plus accessible pour les administrateurs systèmes de tous niveaux. En maîtrisant les commandes ci-dessus, vous serez bien équipé pour configurer efficacement les règles de pare-feu sur votre système, améliorant ainsi sa sécurité.