# Documentation pour la commande `netcat` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `netcat`](#fonctionnement-de-la-commande-netcat)
3. [Syntaxe de la commande `netcat`](#syntaxe-de-la-commande-netcat)
4. [Options de la commande `netcat`](#options-de-la-commande-netcat)
    - [Option `-l` (listen mode)](#option--l-listen-mode)
    - [Option `-p` (local port)](#option--p-local-port)
    - [Option `-u` (UDP mode)](#option--u-udp-mode)
    - [Option `-z` (zero-I/O mode)](#option--z-zero-io-mode)
    - [Option `-v` (verbose)](#option--v-verbose)
    - [Option `-e` (execute)](#option--e-execute)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Établir une connexion TCP](#exemple-1--établir-une-connexion-tcp)
    - [Exemple 2 : Utiliser `netcat` comme serveur](#exemple-2--utiliser-netcat-comme-serveur)
    - [Exemple 3 : Transférer un fichier](#exemple-3--transférer-un-fichier)
    - [Exemple 4 : Scanner des ports](#exemple-4--scanner-des-ports)
    - [Exemple 5 : Écouter sur un port UDP](#exemple-5--écouter-sur-un-port-udp)
6. [Conclusion](#conclusion)

## Introduction

La commande `netcat` (souvent abrégée en `nc`) sous Linux est un utilitaire réseau polyvalent qui permet d'établir des connexions réseau, d'envoyer et de recevoir des données, et de faire du dépannage réseau. Elle est souvent utilisée pour les tests réseau, le dépannage, et comme outil de back-end pour d'autres scripts et programmes.

## Fonctionnement de la commande `netcat`

`netcat` peut fonctionner à la fois comme un client et un serveur. En mode client, il se connecte à une adresse IP et un port spécifiés et envoie/ reçoit des données. En mode serveur, il écoute sur un port spécifié pour les connexions entrantes.

## Syntaxe de la commande `netcat`

```bash
nc [options] [hôte] [port]
```

### Arguments

- `[hôte]` : L'adresse IP ou le nom d'hôte de la machine à laquelle se connecter.
- `[port]` : Le numéro de port à utiliser pour la connexion.

## Options de la commande `netcat`

### Option `-l` (listen mode)

Active le mode écoute, permettant à `netcat` d'agir comme un serveur.

```bash
nc -l [port]
```

### Option `-p` (local port)

Spécifie le port local à utiliser.

```bash
nc -p [port]
```

### Option `-u` (UDP mode)

Utilise le mode UDP au lieu du mode TCP par défaut.

```bash
nc -u [hôte] [port]
```

### Option `-z` (zero-I/O mode)

Utilise le mode sans I/O pour scanner des ports.

```bash
nc -z [hôte] [port]
```

### Option `-v` (verbose)

Active le mode verbeux, fournissant plus de détails sur les opérations effectuées.

```bash
nc -v [hôte] [port]
```

### Option `-e` (execute)

Exécute un programme spécifique après avoir établi une connexion.

```bash
nc -e [programme] [hôte] [port]
```

## Exemples concrets

### Exemple 1 : Établir une connexion TCP

Pour établir une connexion TCP à `example.com` sur le port `80` :

```bash
nc example.com 80
```

### Exemple 2 : Utiliser `netcat` comme serveur

Pour écouter les connexions sur le port `12345` :

```bash
nc -l 12345
```

### Exemple 3 : Transférer un fichier

Pour envoyer un fichier `file.txt` d'une machine à une autre :

Sur la machine de destination (serveur) :

```bash
nc -l 12345 > received_file.txt
```

Sur la machine source (client) :

```bash
nc [adresse_IP_serveur] 12345 < file.txt
```

### Exemple 4 : Scanner des ports

Pour scanner les ports `20` à `30` sur `example.com` :

```bash
nc -z -v example.com 20-30
```

### Exemple 5 : Écouter sur un port UDP

Pour écouter les connexions UDP sur le port `12345` :

```bash
nc -u -l 12345
```

## Conclusion

La commande `netcat` est un outil puissant et polyvalent pour les administrateurs système et les professionnels du réseau. Elle permet de tester, diagnostiquer et dépanner les connexions réseau de manière flexible et efficace. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man nc` ou `man netcat`, ou la documentation officielle de votre distribution Linux.