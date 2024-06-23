L'installation d'une carte réseau sans fil, comme la GIGABYTE GC-WBAX1200, sur Debian 12 (connu sous le nom de "Bookworm" au moment de ma dernière mise à jour) nécessite généralement une combinaison de vérifications matérielles, l'installation de pilotes appropriés, et parfois la configuration de logiciels supplémentaires pour gérer les connexions sans fil. Voici un guide général pour vous aider à démarrer :

### 1. Vérifier la Reconnaissance du Matériel

1. **Insérez la carte Wi-Fi** dans un slot PCI-E disponible de votre ordinateur.
2. Redémarrez l'ordinateur.
3. Une fois Debian démarré, ouvrez un terminal et utilisez la commande `lspci` ou `lsusb` (selon si la carte est PCI-E ou USB) pour vérifier si le système détecte la carte. Vous devriez voir la GIGABYTE GC-WBAX1200 listée.

### 2. Installer les Pilotes Nécessaires

La carte GIGABYTE GC-WBAX1200 utilise généralement des chipsets Intel pour le Wi-Fi, ce qui signifie que les pilotes nécessaires peuvent déjà être inclus dans Debian ou disponibles via les dépôts de logiciels non-free (non libres).

1. **Ajoutez les dépôts non-free à votre liste de sources.** Ouvrez le fichier `/etc/apt/sources.list` avec un éditeur de texte en tant que root et ajoutez `non-free` à la fin des lignes des dépôts Debian. Cela pourrait ressembler à ceci :

    ```
    deb http://deb.debian.org/debian/ bookworm main contrib non-free
    deb-src http://deb.debian.org/debian/ bookworm main contrib non-free
    ```

2. **Mettez à jour la liste des paquets** avec `sudo apt update`.
3. **Installez les pilotes nécessaires.** Pour une carte basée sur un chipset Intel, vous aurez probablement besoin du paquet `firmware-iwlwifi`. Installez-le avec la commande :

    ```
    sudo apt install firmware-iwlwifi
    ```

4. **Redémarrez** votre ordinateur après l'installation du pilote.

### 3. Configurer la Connexion Wi-Fi

1. **Utilisez l'interface graphique** : Si vous utilisez un environnement de bureau comme GNOME, KDE, etc., vous pouvez configurer le Wi-Fi via l'interface graphique en sélectionnant le réseau Wi-Fi auquel vous souhaitez vous connecter et en entrant le mot de passe.

2. **Utilisez la ligne de commande** : Pour une configuration via la ligne de commande, `iw` et `wpa_supplicant` sont des outils utiles. Voici un exemple rapide pour se connecter à un réseau :

    - Trouvez votre interface Wi-Fi avec `ip link`.
    - Éditez le fichier `/etc/wpa_supplicant/wpa_supplicant.conf` et ajoutez votre réseau :

        ```
        network={
            ssid="NOM_DU_RESEAU"
            psk="MOT_DE_PASSE"
        }
        ```

    - Connectez-vous à l'aide de `wpa_supplicant` et `dhclient`.

### 4. Vérifier la Connexion

- Après la configuration, utilisez `ping` pour vérifier votre connexion à Internet :

    ```
    ping -c 4 google.com
    ```

Si vous rencontrez des problèmes, assurez-vous que le module de votre carte est bien chargé (`lsmod | grep iwlwifi` pour les chipsets Intel) et vérifiez les logs du système pour d'éventuelles erreurs (`dmesg | grep iwlwifi`).

Ce guide est basé sur les pratiques courantes et les informations disponibles jusqu'à avril 2023. Les étapes spécifiques peuvent varier légèrement en fonction des configurations système et des versions de logiciels.