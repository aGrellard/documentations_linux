- [Actions `iptables`](#actions-iptables)
  - [Actions Principales](#actions-principales)
    - [ACCEPT](#accept)
    - [DROP](#drop)
    - [REJECT](#reject)
    - [LOG](#log)
    - [MASQUERADE](#masquerade)
    - [SNAT (Source NAT)](#snat-source-nat)
    - [DNAT (Destination NAT)](#dnat-destination-nat)
    - [REDIRECT](#redirect)


# Actions `iptables` 

Les actions, souvent appelées "cibles" (`TARGETS`) dans le contexte d'`iptables`, déterminent ce qui arrive aux paquets qui correspondent aux critères définis par les règles. Voici une explication détaillée des actions les plus couramment utilisées dans `iptables` :

## Actions Principales

### ACCEPT
- **Description** : Permet au paquet de passer à travers le pare-feu, autorisant ainsi le trafic correspondant à la règle.
- **Utilisation** : Utilisé pour autoriser des connexions spécifiques, comme les connexions entrantes sur le port 22 pour SSH.
- **Exemple** : Autoriser tout le trafic entrant sur le port 22 (SSH).
  ```bash
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  ```

### DROP
- **Description** : Supprime le paquet sans envoyer de réponse à l'expéditeur, ce qui rend le filtrage invisible de l'extérieur.
- **Utilisation** : Souvent utilisé pour bloquer l'accès non autorisé ou indésirable, par exemple, bloquer les tentatives de connexion depuis une adresse IP spécifique.
- **Exemple** : Bloquer tout le trafic provenant de l'adresse IP 192.168.1.10.
  ```bash
  iptables -A INPUT -s 192.168.1.10 -j DROP
  ```

### REJECT
- **Description** : Rejette le paquet et envoie une réponse d'erreur à l'expéditeur, indiquant que le filtrage est en place.
- **Utilisation** : Peut être utilisé à la place de DROP pour fournir un feedback à l'expéditeur, par exemple, rejeter les tentatives de connexion sur des ports non utilisés.
- **Exemple** : Rejeter tout le trafic entrant sur le port 23 (Telnet).
  ```bash
  iptables -A INPUT -p tcp --dport 23 -j REJECT
  ```

### LOG
- **Description** : Journalise les informations sur le paquet, comme spécifié par la règle, dans le journal système.
- **Utilisation** : Utile pour le débogage ou le monitoring du trafic, par exemple, pour enregistrer les tentatives de connexion à un port spécifique.
- **Exemple** : Journaliser les tentatives de connexion SSH avant de les accepter.
  ```bash
  iptables -A INPUT -p tcp --dport 22 -j LOG --log-prefix "SSH attempt: "
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  ```

### MASQUERADE
- **Description** : Masque l'adresse IP source des paquets sortants par l'adresse IP de l'interface réseau. Principalement utilisé dans les configurations de NAT dynamique.
- **Utilisation** : Souvent utilisé dans les configurations de NAT sur des dispositifs agissant comme passerelles Internet pour un réseau local.
- **Exemple** : Masquer l'adresse IP source pour les paquets sortant l'interface eth0.
  ```bash
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  ```

### SNAT (Source NAT)
- **Description** : Semblable à MASQUERADE, mais permet de spécifier explicitement l'adresse IP source à utiliser, utile pour le NAT statique.
- **Utilisation** : Utilisé lorsque l'adresse IP externe est statique et connue, pour NAT le trafic sortant d'un réseau local vers Internet.
- **Exemple** : Modifier l'adresse source des paquets sortants vers 192.168.1.100.
  ```bash
  iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.1.100
  ```

### DNAT (Destination NAT)
- **Description** : Modifie l'adresse IP de destination (et éventuellement le port) des paquets entrants, utilisé pour diriger le trafic vers les hôtes internes derrière un pare-feu/NAT.
- **Utilisation** : Permet d'accéder à des services internes depuis l'extérieur, comme un serveur web interne, en redirigeant le trafic du port externe vers l'adresse IP interne du serveur.
- **Exemple** : Rediriger tout le trafic destiné au port 80 vers le port 8080 de l'hôte interne 192.168.1.100.
  ```bash
  iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.100:8080
  ```

### REDIRECT
- **Description** : Spécialisation de DNAT pour rediriger le trafic destiné à l'hôte local vers un autre port de ce même hôte.
- **Utilisation** : Utile pour intercepter le trafic destiné à un port et le rediriger vers un autre port, par exemple, pour rediriger tout le trafic HTTP vers un proxy local.
- **Exemple** : Rediriger le trafic entrant sur le port 80 vers le port 8080 sur le même hôte.
  ```bash
  iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
  ```
  
Ces actions déterminent le comportement fondamental des règles d'`iptables` et permettent une grande flexibilité dans la gestion du trafic réseau. Elles peuvent être combinées de manière créative pour construire des politiques de sécurité complexes, contrôler l'accès au réseau, et réaliser des tâches de routage et de NAT.