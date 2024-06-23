- [Chaînes `iptables`](#chaînes-iptables)
  - [Les Chaînes Standard](#les-chaînes-standard)
    - [1. INPUT](#1-input)
    - [2. FORWARD](#2-forward)
    - [3. OUTPUT](#3-output)
    - [4. PREROUTING (Table `nat`)](#4-prerouting-table-nat)
    - [5. POSTROUTING (Table `nat`)](#5-postrouting-table-nat)
    - [Exemples Supplémentaires](#exemples-supplémentaires)
      - [Autoriser le Ping (ICMP Echo Request) Entrant](#autoriser-le-ping-icmp-echo-request-entrant)
      - [Bloquer les Connexions Sortantes sur le Port 25 (SMTP)](#bloquer-les-connexions-sortantes-sur-le-port-25-smtp)
      - [Redirection de Port](#redirection-de-port)


# Chaînes `iptables`

Les chaînes standard d'`iptables` sont des points d'entrée prédéfinis qui permettent à `iptables` de filtrer le trafic réseau à différents stades de son traitement. Voici les chaînes standard principales et des exemples de leur utilisation :

## Les Chaînes Standard

### 1. INPUT
- **Description** : Gère les paquets destinés à l'hôte.
- **Exemple** : Autoriser le trafic SSH entrant.
  ```bash
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  ```

### 2. FORWARD
- **Description** : Gère les paquets routés à travers l'hôte, typiquement utilisé dans les configurations de pare-feu ou de passerelle.
- **Exemple** : Autoriser le transfert de tous les paquets entre deux interfaces réseau.
  ```bash
  iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
  iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
  ```

### 3. OUTPUT
- **Description** : Gère les paquets sortants de l'hôte.
- **Exemple** : Bloquer le trafic sortant vers un domaine spécifique.
  ```bash
  iptables -A OUTPUT -p tcp -d www.exemple.com -j DROP
  ```

### 4. PREROUTING (Table `nat`)
- **Description** : Utilisée pour les décisions de destination avant que les paquets ne soient routés. Principalement utilisée pour la redirection d'adresses (DNAT).
- **Exemple** : Rediriger tout le trafic HTTP entrant vers un port spécifique.
  ```bash
  iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
  ```

### 5. POSTROUTING (Table `nat`)
- **Description** : Utilisée pour les altérations d'adresses après le routage. Principalement utilisée pour masquer l'origine des paquets sortants (SNAT ou MASQUERADE).
- **Exemple** : Masquer l'adresse IP source des paquets sortants d'un réseau local.
  ```bash
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  ```

### Exemples Supplémentaires

#### Autoriser le Ping (ICMP Echo Request) Entrant
```bash
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
```

#### Bloquer les Connexions Sortantes sur le Port 25 (SMTP)
```bash
iptables -A OUTPUT -p tcp --dport 25 -j REJECT
```

#### Redirection de Port
Supposons que vous voulez rediriger le trafic arrivant sur le port TCP 80 vers le port TCP 8080 sur le même hôte :
```bash
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
```

Ces chaînes standard fournissent une base pour construire des règles de filtrage du trafic entrant, sortant et transitant par l'hôte, ainsi que pour la manipulation des adresses pour la traduction d'adresses réseau (NAT).