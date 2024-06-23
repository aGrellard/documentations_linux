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