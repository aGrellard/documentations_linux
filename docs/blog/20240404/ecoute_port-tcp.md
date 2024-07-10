# Ecoute réseau sur un port TCP

## Introduction

Lorsqu'un serveur écoute sur un port TCP, il attend des connexions entrantes sur ce port. Les connexions entrantes sont généralement initiées par des clients qui se connectent au serveur. Dans cet article, nous allons voir comment vérifier si un serveur écoute sur un port TCP donné.

## Prérequis

- Un système Linux avec un serveur qui écoute sur un port TCP.
- Accès à un terminal.
- Connaissances de base sur les commandes Linux.
- Droits d'administration pour exécuter des commandes avec `sudo`.
- `netstat` ou `ss` installé sur le système.
- Connexion réseau active.

## Vérifier les Ports TCP en Ecoute

Pour vérifier les ports TCP en écoute sur un serveur, vous pouvez utiliser les commandes `netstat` ou `ss`. Ces commandes affichent les connexions réseau actives, y compris les ports en écoute.

### Utiliser `netstat`

La commande `netstat` est un outil en ligne de commande qui affiche les connexions réseau actives, les tables de routage et diverses statistiques réseau. Pour afficher les ports TCP en écoute, utilisez la commande suivante :

```bash
netstat -tuln
```

- `-t` : Affiche les connexions TCP.
- `-u` : Affiche les connexions UDP.
- `-l` : Affiche les connexions en écoute.
- `-n` : Affiche les adresses IP et les numéros de port sous forme numérique.
- `-p` : Affiche le nom du programme qui utilise le port.
- `-a` : Affiche toutes les connexions.

ecouter les connection entrantes sur le port 80 (HTTP) :

```bash
netstat -tuln | grep :80
```

afficher l'adresse MAC des connexions en écoute sur le port 80 (HTTP) :

```bash
netstat -tuln -e | grep :80
```

### Utiliser `ss`

`ss` est un outil en ligne de commande qui affiche des statistiques sur les connexions réseau. Pour afficher les ports TCP en écoute, utilisez la commande suivante :

```bash
ss -tuln
```

- `-t` : Affiche les connexions TCP.
- `-u` : Affiche les connexions UDP.
- `-l` : Affiche les connexions en écoute.
- `-n` : Affiche les adresses IP et les numéros de port sous forme numérique.
- `-p` : Affiche le nom du programme qui utilise le port.
- `-a` : Affiche toutes les connexions.
- `-e` : Affiche les informations étendues.
- `-m` : Affiche les informations sur les sockets.
- `-o` : Affiche les informations sur les processus.
- `-s` : Affiche les statistiques.
- `-i` : Affiche les informations sur les interfaces.
- `-r` : Affiche les informations sur les routes.
- `-Z` : Affiche les informations sur les contextes de sécurité.

ecouter les connection entrantes sur le port 80 (HTTP) :

```bash
ss -tuln | grep :80
```

afficher l'adresse MAC des connexions en écoute sur le port 80 (HTTP) :

```bash
ss -tuln -e | grep :80
```

## Utiliser tcpdump

`tcpdump` est un outil en ligne de commande qui permet de capturer et d'analyser le trafic réseau. Pour afficher les paquets entrants sur un port TCP donné, utilisez la commande suivante :

```bash
sudo tcpdump -i eth0 -n -X 'tcp port 80'
```

- `-i` : Spécifie l'interface réseau à écouter.
- `-n` : Désactive la résolution DNS.
- `-X` : Affiche les données hexadécimales et ASCII.
- `tcp port 80` : Filtre les paquets TCP sur le port 80.
- `udp port 53` : Filtre les paquets UDP sur le port 53.
- `icmp` : Filtre les paquets ICMP.

ecouter les paquets entrants sur le port 80 (HTTP) et afficher les données ASCII :

```bash
sudo tcpdump -i eth0 -n -X 'tcp port 80'
```

afficher l'adresse MAC des paquets entrants sur le port 80 (HTTP) :

```bash
sudo tcpdump -i eth0 -n -e 'tcp port 80'
```


ecouter les paquets entrants sur le port 80 (HTTP) et afficher la requête HTTP :

```bash
sudo tcpdump -i eth0 -n -A 'tcp port 80'
```

ecouter les paquets entrants sur le port 80 (HTTP) et afficher la requête HTTP au format human-readable :

```bash
sudo tcpdump -i eth0 -n -A -s 0 'tcp port 80'
```



