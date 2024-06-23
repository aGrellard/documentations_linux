Pour écouter les requêtes ping sur un serveur Debian, vous avez plusieurs options en fonction de ce que vous souhaitez accomplir. Les requêtes ping utilisent le protocole ICMP (Internet Control Message Protocol) pour tester la connectivité entre deux hôtes sur un réseau.

### 1. Utiliser `tcpdump`

`tcpdump` est un outil puissant qui permet d'écouter le trafic réseau sur une interface. Vous pouvez l'utiliser pour filtrer et afficher les paquets ICMP (y compris les pings) qui entrent et sortent de votre serveur.

Pour installer `tcpdump` sur Debian, utilisez la commande suivante :
```
sudo apt-get update && sudo apt-get install tcpdump
```

Ensuite, pour écouter les requêtes ping, exécutez :
```
sudo tcpdump -i eth0 'icmp and (icmp[icmptype]=icmp-echo or icmp[icmptype]=icmp-echoreply)'
```
Remplacez `eth0` par le nom de l'interface réseau que vous souhaitez surveiller. Cette commande affiche les paquets ICMP de type echo (requête ping) et echo reply (réponse ping).

### 2. Utiliser `iptables` pour logger les pings

Si vous voulez non seulement écouter mais aussi enregistrer les requêtes ping reçues par le serveur, vous pouvez utiliser `iptables` pour créer une règle qui logue ces requêtes.

D'abord, assurez-vous qu'`iptables` est installé. Sinon, installez-le avec :
```
sudo apt-get update && sudo apt-get install iptables
```

Ensuite, ajoutez une règle pour loguer les paquets ICMP :
```
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j LOG --log-prefix "PING RECEIVED: "
```

Cette commande ajoute une règle à la chaîne INPUT pour loguer tous les paquets ICMP de type echo-request (requêtes ping) avec un préfixe "PING RECEIVED: " pour faciliter leur identification dans les logs.

Les logs seront écrits dans le journal système, que vous pouvez consulter avec `dmesg` ou en regardant les fichiers de log appropriés dans `/var/log/`, généralement `/var/log/syslog` ou `/var/log/messages`.

### Note
- Ces méthodes peuvent nécessiter des privilèges de superutilisateur (utilisez `sudo`).
- Assurez-vous de comprendre l'impact de ces commandes sur la performance de votre système et la sécurité réseau, surtout en ce qui concerne les règles `iptables`.