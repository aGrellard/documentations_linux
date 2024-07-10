Pour écouter les requêtes ping et les suivre via `journalctl` sur un système Linux, vous devez d'abord vous assurer que ces événements sont enregistrés par le système. Habituellement, les pings (envois de paquets ICMP Echo Request et leurs réponses Echo Reply) ne sont pas directement enregistrés dans les journaux système par défaut. Cependant, vous pouvez configurer certaines règles de journalisation avec `iptables` ou `nftables` pour enregistrer ces événements.

Voici un exemple de comment configurer `iptables` pour journaliser les requêtes ping :

1. **Ajouter une règle pour journaliser les requêtes ICMP :**
   Vous pouvez ajouter une règle dans `iptables` pour journaliser les paquets ICMP (les requêtes ping utilisent ICMP type 8, code 0). La commande suivante ajoute une règle qui journalise ces paquets :

   ```bash
   sudo iptables -I INPUT -p icmp --icmp-type echo-request -j LOG --log-prefix "PING_REQUEST: "
   ```

   Cette commande insère une règle au début de la chaîne `INPUT` qui sélectionne les paquets ICMP de type "echo-request" (requêtes ping) et les envoie au cible `LOG` de `iptables`, avec un préfixe "PING_REQUEST: " pour faciliter leur identification dans les journaux.

2. **Vérifier les journaux avec `journalctl` :**
   Une fois que vous avez configuré la journalisation, vous pouvez utiliser `journalctl` pour voir les entrées de journal correspondantes. Par exemple, pour suivre les logs de ping en temps réel, vous pouvez utiliser :

   ```bash
   sudo journalctl -f | grep 'PING_REQUEST'
   ```

   `-f` est utilisé pour suivre le journal en temps réel, et `grep` filtre les lignes contenant 'PING_REQUEST'.

3. **Assurer la persistance des règles :**
   Si vous voulez que les règles persistent après un redémarrage, vous devrez les sauvegarder et les restaurer au démarrage. Cela peut varier selon la distribution que vous utilisez (par exemple, en utilisant `iptables-persistent` sur Debian et Ubuntu).

Notez que cette configuration peut avoir des implications de performance si votre serveur reçoit un grand nombre de requêtes ICMP, car la journalisation de chaque paquet peut être coûteuse en termes de traitement. Assurez-vous d'évaluer l'impact avant de déployer cette configuration en production.