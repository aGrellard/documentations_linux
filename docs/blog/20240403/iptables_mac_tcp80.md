UFW, ou Uncomplicated Firewall, est une interface pour iptables destinée à simplifier la configuration du pare-feu sous Linux. UFW gère les règles basées sur les adresses IP, les ports et les protocoles, mais ne gère pas directement les règles basées sur les adresses MAC, car cela relève plutôt de la couche liaison (Ethernet) que de la couche réseau (IP) dans le modèle OSI.

Cependant, vous pouvez contourner cette limitation en utilisant directement `iptables` pour créer une règle basée sur l'adresse MAC, puis en intégrant cette règle dans la configuration d'UFW. Voici comment vous pouvez faire :

1. **Ajouter une règle iptables pour autoriser le trafic basé sur l'adresse MAC :**

   Vous devez d'abord créer une règle `iptables` qui autorise le trafic d'une adresse MAC spécifique. Remplacez `xx:xx:xx:xx:xx:xx` par l'adresse MAC que vous souhaitez autoriser et `eth0` par le nom de l'interface réseau appropriée.

   ```
   sudo iptables -A INPUT -i eth0 -m mac --mac-source xx:xx:xx:xx:xx:xx -j ACCEPT
   ```

2. **Sauvegarder la règle iptables pour qu'elle persiste après le redémarrage :**

   La manière de sauvegarder les règles `iptables` peut varier selon la distribution Linux. Sur Ubuntu, par exemple, vous pouvez installer `iptables-persistent` pour sauvegarder automatiquement les règles.

   ```
   sudo apt-get install iptables-persistent
   ```

   Pendant l'installation, il vous sera demandé si vous voulez sauvegarder les règles en cours ; acceptez pour sauvegarder vos règles iptables actuelles. Sinon, vous pouvez sauvegarder manuellement les règles plus tard en utilisant :

   ```
   sudo netfilter-persistent save
   ```

3. **Vérifier que la règle fonctionne :**

   Après avoir ajouté la règle, vous pouvez vérifier que tout fonctionne correctement en listant les règles iptables avec la commande suivante :

   ```
   sudo iptables -L
   ```

   Vous devriez voir votre nouvelle règle dans la liste.

Rappelez-vous que cette approche contourne UFW pour une fonctionnalité spécifique non prise en charge directement par UFW. Il est important de comprendre que la gestion directe des règles iptables tout en utilisant UFW peut compliquer la gestion de votre pare-feu, car vous devrez gérer deux ensembles de règles. Assurez-vous de documenter vos changements pour éviter toute confusion future.


<hr>


Pour permettre une connexion entrante sur le port 80 à partir d'une adresse MAC spécifique, tout en ayant une règle UFW qui bloque par défaut les connexions entrantes sur ce port, vous pouvez procéder en deux étapes. D'abord, configurez `iptables` directement pour autoriser le trafic sur le port 80 depuis l'adresse MAC spécifiée, puis assurez-vous que votre configuration UFW bloque les autres connexions entrantes sur le port 80. Voici comment vous pourriez faire :

### 1. Configurer `iptables` pour autoriser une adresse MAC spécifique

Vous pouvez ajouter une règle `iptables` pour autoriser le trafic sur le port 80 pour une adresse MAC spécifique. Remplacez `xx:xx:xx:xx:xx:xx` par l'adresse MAC que vous souhaitez autoriser et assurez-vous que `eth0` est bien l'interface réseau correcte pour votre serveur.

```bash
sudo iptables -I INPUT -p tcp --dport 80 -m mac --mac-source xx:xx:xx:xx:xx:xx -j ACCEPT
```

Cette commande insère une règle au début de la chaîne `INPUT` pour accepter les paquets TCP destinés au port 80 qui proviennent de l'adresse MAC spécifiée.

### 2. Configurer UFW pour bloquer les connexions entrantes sur le port 80

Si ce n'est pas déjà fait, configurez UFW pour bloquer les connexions entrantes sur le port 80. Cela peut être réalisé avec la commande suivante, si la règle n'est pas déjà en place :

```bash
sudo ufw deny 80
```

Cette commande bloque les nouvelles connexions entrantes sur le port 80, mais la règle `iptables` que vous avez ajoutée en première étape permettra les connexions du périphérique avec l'adresse MAC spécifiée.

### 3. Sauvegarder vos règles `iptables`

Comme mentionné précédemment, il est important de sauvegarder vos règles `iptables` pour qu'elles persistent après un redémarrage. Si vous avez `iptables-persistent` installé, exécutez :

```bash
sudo netfilter-persistent save
```

Sinon, assurez-vous d'installer `iptables-persistent` ou de trouver une autre méthode pour sauvegarder vos règles en fonction de votre distribution Linux.

### Note importante

Cette configuration est quelque peu inhabituelle et peut compliquer la maintenance de votre système de pare-feu. L'utilisation conjointe d'UFW et d'`iptables` de cette manière requiert une bonne documentation et une compréhension claire de comment les règles sont appliquées pour éviter des problèmes de sécurité inattendus.