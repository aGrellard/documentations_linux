// Documentation sur Network Manager sous Debian et dérivés

- [Network manager](#network-manager)
  - [Installation](#installation)
  - [Utilisation](#utilisation)
  - [Utilisation en Ligne de Commande](#utilisation-en-ligne-de-commande)
    - [Liste des Connexions](#liste-des-connexions)
    - [Activer/Désactiver une Connexion](#activerdésactiver-une-connexion)
    - [Ajouter une Connexion](#ajouter-une-connexion)
    - [modifier une connexion](#modifier-une-connexion)
    - [Supprimer une Connexion](#supprimer-une-connexion)
    - [lister les interfaces réseau](#lister-les-interfaces-réseau)
    - [lister les réseaux disponibles](#lister-les-réseaux-disponibles)
    - [Se connecter à un réseau Wi-Fi](#se-connecter-à-un-réseau-wi-fi)
    - [Se connecter à un réseau Wi-Fi caché](#se-connecter-à-un-réseau-wi-fi-caché)
    - [Se connecter à un réseau Wi-Fi avec une adresse IP statique](#se-connecter-à-un-réseau-wi-fi-avec-une-adresse-ip-statique)
    - [Se connecter à un réseau Wi-Fi avec un proxy](#se-connecter-à-un-réseau-wi-fi-avec-un-proxy)
    - [Supprimer un réseau Wi-Fi](#supprimer-un-réseau-wi-fi)
    - [Lister les Connexions Actives](#lister-les-connexions-actives)
    - [Lister les réseaux Wi-Fi enregistrés](#lister-les-réseaux-wi-fi-enregistrés)
    - [Se deconnecter d'un réseau Wi-Fi](#se-deconnecter-dun-réseau-wi-fi)
    - [Se deconnecter d'un réseau Ethernet](#se-deconnecter-dun-réseau-ethernet)
    - [Se connecter à un réseau Ethernet](#se-connecter-à-un-réseau-ethernet)
    - [se deconnecter de tous les réseaux](#se-deconnecter-de-tous-les-réseaux)
    - [configuration d'une adresse IP statique](#configuration-dune-adresse-ip-statique)
    - [configuration d'une adresse IP dynamique](#configuration-dune-adresse-ip-dynamique)
    - [configuration automatique de l'adresse IP](#configuration-automatique-de-ladresse-ip)
    - [configuration d'un serveur DNS](#configuration-dun-serveur-dns)


# Network manager

Network Manager est un outil de gestion de réseau qui permet de configurer facilement les connexions réseau sur les systèmes Linux. Il est installé par défaut sur la plupart des distributions Linux modernes.

## Installation

Sur Debian et ses dérivés, Network Manager peut être installé via le gestionnaire de paquets `apt`. Ouvrez un terminal et exécutez les commandes suivantes :

```bash
sudo apt update
sudo apt install network-manager
```

Démarrez le service Network Manager :

```bash
sudo systemctl start NetworkManager
```

Pour activer le service au démarrage :

```bash
sudo systemctl enable NetworkManager
```

## Utilisation

Network Manager peut être utilisé en ligne de commande ou via une interface graphique. Pour lancer l'interface graphique, exécutez la commande suivante :

```bash
nm-connection-editor
```

## Utilisation en Ligne de Commande


### Liste des Connexions

Pour afficher la liste des connexions réseau :

```bash
nmcli connection show
```

### Activer/Désactiver une Connexion

Pour activer une connexion :

```bash
nmcli connection up <nom_connexion>
```

Pour désactiver une connexion :

```bash
nmcli connection down <nom_connexion>
```

### Ajouter une Connexion

Pour ajouter une connexion, vous pouvez utiliser la commande `nmcli` ou l'interface graphique `nm-connection-editor`.

Voici un exemple pour ajouter une connexion Ethernet statique :

```bash
sudo nmcli connection add con-name "eth0" ifname eth0 type ethernet ip4
```

exemple :

```bash
nmcli connection add con-name "eth0" ifname eth0 type ethernet ip4  
```

ajouter une connexion Wi-Fi :

```bash
nmcli connection add con-name <nom_connexion> type wifi ifname <interface> ssid <SSID> password <password>
```

exemple :

```bash
nmcli connection add con-name "MyWifi" type wifi ifname wlp3s0 ssid "MyWifi" password "password"
```

### modifier une connexion

```bash
nmcli connection modify <nom_connexion> <paramètres>
```

exemple :

```bash
nmcli connection modify "MyWifi" ipv4.method auto
```



### Supprimer une Connexion

Pour supprimer une connexion :

```bash
nmcli connection delete <nom_connexion>
```

### lister les interfaces réseau

```bash
nmcli device status
```

### lister les réseaux disponibles

```bash
nmcli device wifi list
```

### Se connecter à un réseau Wi-Fi

```bash
nmcli device wifi connect <SSID> password <password>
```

### Se connecter à un réseau Wi-Fi caché

```bash
nmcli device wifi connect <SSID> password <password> hidden yes
```

### Se connecter à un réseau Wi-Fi avec une adresse IP statique

```bash
nmcli device wifi connect <SSID> password <password> ip4 <IP> gw4 <Gateway>
```

### Se connecter à un réseau Wi-Fi avec un proxy

```bash
nmcli device wifi connect <SSID> password <password> ip4 <IP> gw4 <Gateway> ipv4.dns <DNS> ipv4.method auto 802-1x.eap peap 802-1x.phase2-auth mschapv2 802-1x.identity <Identity> 802-1x.password <Password>
```

### Supprimer un réseau Wi-Fi

```bash
nmcli connection delete <SSID>
```

### Lister les Connexions Actives

Pour afficher les connexions actives :

```bash
nmcli connection show --active
```

### Lister les réseaux Wi-Fi enregistrés

Pour afficher les réseaux Wi-Fi enregistrés :

```bash
nmcli connection show
```

### Se deconnecter d'un réseau Wi-Fi

```bash
nmcli connection down <SSID>
```

### Se deconnecter d'un réseau Ethernet

```bash
nmcli connection down <ethernet>
```

### Se connecter à un réseau Ethernet

```bash
nmcli connection up <ethernet>
```

### se deconnecter de tous les réseaux

```bash
nmcli connection down --all
```

### configuration d'une adresse IP statique

```bash
nmcli connection modify <nom_connexion> ipv4.method manual ipv4.address <IP> ipv4.gateway <Gateway> ipv4.dns <DNS>
```

### configuration d'une adresse IP dynamique

```bash
nmcli connection modify <nom_connexion> ipv4.method auto
```

### configuration automatique de l'adresse IP

```bash
nmcli connection modify <nom_connexion> ipv4.method auto
```

### configuration d'un serveur DNS

```bash
nmcli connection modify <nom_connexion> ipv4.dns <DNS>
```

ajouter un serveur DNS supplémentaire

```bash
nmcli connection modify <nom_connexion> +ipv4.dns <DNS>
```



