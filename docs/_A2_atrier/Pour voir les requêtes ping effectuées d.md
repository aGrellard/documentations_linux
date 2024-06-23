Pour voir les requêtes ping effectuées d'un ordinateur distant vers votre machine sous Debian (ou tout autre système d'exploitation basé sur Linux), vous pouvez utiliser des outils de surveillance du réseau. L'un des moyens les plus directs est d'utiliser `tcpdump`, un puissant outil en ligne de commande pour capturer et analyser les paquets réseau.

### Étapes pour utiliser `tcpdump` :

1. **Ouvrir un terminal.** Vous devrez peut-être l'ouvrir avec des droits d'administrateur (root) pour permettre à `tcpdump` de capturer des paquets.

2. **Installer `tcpdump` si ce n'est pas déjà fait.** Vous pouvez l'installer en utilisant le gestionnaire de paquets `apt` :
   ```
   sudo apt update
   sudo apt install tcpdump
   ```

3. **Exécuter `tcpdump` pour filtrer les paquets ICMP (le protocole utilisé par les commandes ping).** Vous pouvez lancer la commande suivante pour capturer uniquement les paquets ICMP :
   ```
   sudo tcpdump -i any icmp and icmp[icmptype]=icmp-echo
   ```
   - `-i any` indique à `tcpdump` d'écouter sur toutes les interfaces réseau.
   - `icmp` spécifie de filtrer les paquets utilisant le protocole ICMP.
   - `icmp[icmptype]=icmp-echo` filtre les paquets de type "echo request", qui sont utilisés par la commande ping.

### Comprendre la sortie

La sortie de `tcpdump` pour une requête ping pourrait ressembler à ceci :

```
12:34:56.789012 IP (tos 0x0, ttl 64, id 12345, offset 0, flags [none], proto ICMP (1), length 84)
    192.168.1.2 > 192.168.1.1: ICMP echo request, id 54321, seq 1, length 64
```

- **192.168.1.2** est l'adresse IP de l'ordinateur distant qui envoie la requête ping.
- **192.168.1.1** est l'adresse IP de votre machine qui reçoit la requête ping.
- **ICMP echo request** indique qu'il s'agit d'une requête ping.

### Sécurité et permission

Utiliser `tcpdump` nécessite des permissions d'administrateur car il accède directement aux paquets réseau. Assurez-vous de l'utiliser de manière responsable et d'avoir la permission sur le réseau sur lequel vous l'exécutez.

### Alternatives

- **Wireshark** : Pour une analyse plus détaillée et une interface graphique, Wireshark est une alternative puissante. Il nécessite cependant plus de ressources et d'expertise pour être utilisé efficacement.
- **iptables** : Si vous souhaitez non seulement voir mais aussi répondre ou bloquer des requêtes ping, vous pourriez configurer des règles iptables pour enregistrer ou contrôler ce type de trafic.