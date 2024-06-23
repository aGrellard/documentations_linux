
# hostname.local sous Debian 12

```
rendre mon serveur Debian 12 joignable via son nom d'hôte en .local
```

Pour rendre votre serveur Debian 12 joignable via son nom d'hôte en `.local`, vous devez configurer le service Avahi, un implémentation du protocole Zeroconf qui permet la découverte de services sur un réseau local sans configuration. Avahi attribue automatiquement des adresses IP sans configuration manuelle et résout les noms d'hôte en `.local` à leurs adresses IP correspondantes. Voici comment configurer cela :

1. **Installez Avahi-daemon** : Avahi-daemon est le service qui permet à votre serveur d'annoncer son nom sur le réseau et de découvrir d'autres services.

   Ouvrez un terminal et exécutez la commande suivante pour installer Avahi-daemon :
   ```bash
   sudo apt update && sudo apt install avahi-daemon
   ```

2. **Configurez Avahi-daemon** : Généralement, Avahi fonctionne correctement avec la configuration par défaut. Toutefois, vous pouvez personnaliser la configuration en modifiant `/etc/avahi/avahi-daemon.conf`. Pour la plupart des utilisations, la configuration par défaut est suffisante.

3. **Activez et démarrez Avahi-daemon** : Assurez-vous que le service Avahi est activé et démarre avec le système.
   ```bash
   sudo systemctl enable avahi-daemon
   sudo systemctl start avahi-daemon
   ```

4. **Vérifiez le fonctionnement d'Avahi** : Pour vérifier que Avahi fonctionne correctement et que votre serveur est joignable via son nom d'hôte en `.local`, utilisez la commande `avahi-browse` sur un autre appareil du même réseau local.
   ```bash
   avahi-browse -at
   ```
   Cette commande liste tous les services disponibles sur le réseau local. Vous devriez voir votre serveur listé avec son nom d'hôte en `.local`.

5. **Configuration du pare-feu** : Si vous utilisez un pare-feu, assurez-vous que les ports utilisés par Avahi (généralement 5353/udp pour mDNS) sont ouverts pour permettre la communication sur votre réseau local.

C'est tout ! Votre serveur Debian devrait maintenant être joignable via son nom d'hôte en `.local` sur le réseau local, facilitant l'accès sans avoir à se souvenir de son adresse IP.