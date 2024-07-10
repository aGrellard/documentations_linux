- [Commandes iptables](#commandes-iptables)
  - [Les commandes](#les-commandes)
    - [-A (Append)](#-a-append)
    - [-I (Insert)](#-i-insert)
    - [-D (Delete)](#-d-delete)
    - [-F (Flush)](#-f-flush)
    - [-L (List)](#-l-list)
    - [-P (Policy)](#-p-policy)
    - [-N (New chain)](#-n-new-chain)
    - [-X (Delete chain)](#-x-delete-chain)
    - [-Z (Zero)](#-z-zero)
    - [-R (Replace)](#-r-replace)
    - [-C (Check)](#-c-check)
    - [-S (List rules)](#-s-list-rules)

# Commandes iptables

Les commandes d'`iptables` permettent de gérer les règles de filtrage du trafic réseau sur les systèmes Linux. Voici les commandes les plus couramment utilisées, chacune accompagnée d'un exemple d'utilisation :

## Les commandes

### -A (Append)
- **Description** : Ajoute une règle à la fin d'une chaîne spécifique.
- **Exemple** : Ajouter une règle pour autoriser le trafic SSH entrant.
  ```bash
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  ```

### -I (Insert)
- **Description** : Insère une règle à une position donnée dans la chaîne.
- **Exemple** : Insérer au début de la chaîne INPUT une règle pour autoriser le trafic sur le port 80.
  ```bash
  iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
  ```

### -D (Delete)
- **Description** : Supprime une règle spécifique de la chaîne.
- **Exemple** : Supprimer une règle autorisant le trafic SSH entrant.
  ```bash
  iptables -D INPUT -p tcp --dport 22 -j ACCEPT
  ```

### -F (Flush)
- **Description** : Supprime toutes les règles d'une chaîne ou de toutes les chaînes si aucune n'est spécifiée.
- **Exemple** : Effacer toutes les règles dans la chaîne INPUT.
  ```bash
  iptables -F INPUT
  ```

### -L (List)
- **Description** : Liste toutes les règles d'une chaîne ou de toutes les chaînes si aucune n'est spécifiée.
- **Exemple** : Lister toutes les règles dans la chaîne INPUT.
  ```bash
  iptables -L INPUT
  ```

### -P (Policy)
- **Description** : Définit la politique par défaut pour une chaîne (ACCEPT, DROP, REJECT).
- **Exemple** : Définir la politique par défaut de la chaîne INPUT sur DROP.
  ```bash
  iptables -P INPUT DROP
  ```

### -N (New chain)
- **Description** : Crée une nouvelle chaîne personnalisée.
- **Exemple** : Créer une nouvelle chaîne appelée LOGGING.
  ```bash
  iptables -N LOGGING
  ```

### -X (Delete chain)
- **Description** : Supprime une chaîne personnalisée (la chaîne doit être vide).
- **Exemple** : Supprimer la chaîne personnalisée LOGGING.
  ```bash
  iptables -X LOGGING
  ```

### -Z (Zero)
- **Description** : Remet à zéro les compteurs de paquets et d'octets pour une chaîne ou pour toutes les chaînes.
- **Exemple** : Remettre à zéro les compteurs pour la chaîne INPUT.
  ```bash
  iptables -Z INPUT
  ```

### -R (Replace)
- **Description** : Remplace une règle à une position donnée dans la chaîne.
- **Exemple** : Remplacer la première règle de la chaîne INPUT pour autoriser le trafic sur le port 443.
  ```bash
  iptables -R INPUT 1 -p tcp --dport 443 -j ACCEPT
  ```

### -C (Check)
- **Description** : Vérifie si une règle donnée existe dans la chaîne.
- **Exemple** : Vérifier si une règle autorisant le trafic SSH existe dans la chaîne INPUT.
  ```bash
  iptables -C INPUT -p tcp --dport 22 -j ACCEPT
  ```

### -S (List rules)
- **Description** : Affiche toutes les règles d'une chaîne sous forme de commandes iptables.
- **Exemple** : Afficher les règles de la chaîne INPUT sous forme de commandes.
  ```bash
  iptables -S INPUT
  ```

Ces commandes fournissent une base solide pour gérer les règles d'`iptables`, permettant un contrôle précis sur le trafic réseau à travers votre système.