
# Utiliser iptables pour logger les pings

Pour logger les requêtes ICMP (ping) entrantes et sortantes, vous pouvez utiliser `iptables` pour ajouter des règles de journalisation. Cela vous permet de suivre les requêtes ping et de surveiller le trafic réseau sur votre serveur.

## Activer le Log des Requêtes ICMP

Pour activer le log des requêtes ICMP entrantes et sortantes, vous pouvez ajouter des règles `iptables` pour les paquets ICMP. Voici comment faire :

1. Ouvrez un terminal et connectez-vous à votre serveur en tant qu'utilisateur `root`.

2. Pour activer le log des requêtes ICMP entrantes, utilisez la commande suivante :

    ```bash
    iptables -A INPUT -p icmp -j LOG --log-prefix "ICMP IN: "
    ```

    déscription de la commande :

    - `-A INPUT` : Ajoute une règle à la chaîne `INPUT` pour les paquets entrants.
    - `-p icmp` : Spécifie le protocole ICMP.
    - `-j LOG` : Redirige les paquets vers le journal système.
    - `--log-prefix "ICMP IN: "` : Ajoute un préfixe au message de journalisation.

3. Pour activer le log des requêtes ICMP sortantes, utilisez la commande suivante :

    ```bash
    iptables -A OUTPUT -p icmp -j LOG --log-prefix "ICMP OUT: "
    ```

    déscription de la commande :

    - `-A OUTPUT` : Ajoute une règle à la chaîne `OUTPUT` pour les paquets sortants.
    - `-p icmp` : Spécifie le protocole ICMP.
    - `-j LOG` : Redirige les paquets vers le journal système.
    - `--log-prefix "ICMP OUT: "` : Ajoute un préfixe au message de journalisation.

4. Pour enregistrer les modifications, utilisez la commande suivante :

    ```bash
    iptables-save > /etc/iptables/rules.v4
    ```

## ecouter avec tcpdump

Pour écouter les requêtes ICMP entrantes et sortantes, vous pouvez utiliser `tcpdump` pour capturer et afficher le trafic réseau en temps réel. Voici comment faire :

1. Ouvrez un terminal et connectez-vous à votre serveur en tant qu'utilisateur `root`.
2. Utilisez la commande suivante pour écouter les requêtes ICMP entrantes :

    ```bash
    tcpdump -i eth0 -n icmp
    ```

    description de la commande :

    - `-i eth0` : Spécifie l'interface réseau à écouter.
    - `-n` : Désactive la résolution DNS.
    - `icmp` : Filtre les paquets ICMP.

3. Utilisez la commande suivante pour écouter les requêtes ICMP sortantes :

    ```bash
    tcpdump -i eth0 -n icmp
    ```

4. ecouter les requêtes ICMP entrantes et sortantes sur l'interface `eth0` :

    ```bash
    sudo tcpdump -i eth0 'icmp and (icmp[icmptype]=icmp-echo or icmp[icmptype]=icmp-echoreply)'
    ```

    déscription de la commande :

    - `-i eth0` : Spécifie l'interface réseau à écouter.
    - `icmp` : Filtre les paquets ICMP.
    - `icmp[icmptype]=icmp-echo` : Filtre les requêtes ICMP (ping) entrantes.
    - `icmp[icmptype]` : Spécifie le type de requête ICMP.
    - `icmp-echo` : Filtre les requêtes ICMP de type `echo`.
    - `icmp[icmptype]=icmp-echoreply` : Filtre les réponses ICMP (pong) sortantes.
    - `icmp-echoreply` : Filtre les réponses ICMP de type `echoreply`.

