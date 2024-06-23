Pour filtrer et voir les requêtes ping (ICMP echo requests) vers votre machine en utilisant `journalctl`, vous devez d'abord savoir que, par défaut, les requêtes ping individuelles ne sont pas enregistrées dans les journaux système par `systemd-journald`. Cela signifie que vous ne pouvez pas directement utiliser `journalctl` pour voir les requêtes ping comme vous le feriez avec des logs de connexion SSH ou des événements réseau de haut niveau.

Cependant, il existe quelques approches alternatives pour surveiller ou loguer ces requêtes ping :

### 1. **Utiliser `auditd` pour surveiller les requêtes ICMP**

`auditd` est un système d'audit utilisateur espace qui vous permet de surveiller et de loguer divers événements de sécurité, y compris les activités réseau à bas niveau. Vous pouvez configurer des règles `auditd` pour enregistrer les paquets ICMP. Notez que cette méthode peut nécessiter une certaine familiarité avec `auditd` et pourrait ne pas être la solution la plus simple ou directe.

### 2. **Créer une règle `iptables` ou `nftables` pour loguer les requêtes ping**

Vous pouvez utiliser `iptables` (ou `nftables`, le successeur de `iptables` sur les systèmes Linux récents) pour créer une règle qui enregistre les paquets ICMP echo request entrants dans le journal système.

Voici un exemple de commande `iptables` qui ajoute une règle pour loguer les requêtes ping :

```bash
sudo iptables -I INPUT -p icmp --icmp-type echo-request -j LOG --log-prefix "ICMP Echo Request: "
```

Cette commande insère (`-I`) une règle dans la chaîne `INPUT` pour les paquets ICMP (`-p icmp`) de type "echo request". Les paquets correspondants sont envoyés à l'action `LOG` avec un préfixe spécifié pour faciliter la recherche dans les logs.

Après avoir ajouté cette règle, vous pouvez utiliser `journalctl` pour filtrer et afficher les logs correspondants :

```bash
sudo journalctl | grep 'ICMP Echo Request'
```

Cette méthode vous permet de capturer et de consulter les requêtes ping à l'aide de `journalctl`.

### Important

- **Performance** : Soyez prudent lorsque vous loguez le trafic réseau à l'aide de `iptables` ou `auditd`, car cela peut potentiellement générer un grand volume de données de journalisation, ce qui pourrait affecter les performances de votre système.
- **Persistances des règles `iptables`** : Les règles `iptables` ajoutées via la ligne de commande ne sont pas persistantes par défaut à travers les redémarrages du système. Pour rendre les règles persistantes sur Debian et ses dérivés, vous pouvez installer le paquet `iptables-persistent`.
- **Sécurité** : Assurez-vous de comprendre les implications de sécurité de l'ajout de règles de journalisation, surtout si elles sont appliquées sur un serveur en production.

Ces approches devraient vous permettre de loguer et de consulter les requêtes ping vers votre machine à l'aide de `journalctl`.