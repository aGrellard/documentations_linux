# Support mDNS/Avahi/Bonjour

Utiliser mDNS (Multicast DNS) pour la résolution de noms dans un réseau local.

## Qu'est-ce que mDNS ?

mDNS est un protocole de résolution de noms qui permet de résoudre les noms de domaine en adresses IP sans avoir besoin d'un serveur DNS centralisé. Il fonctionne en envoyant des requêtes de résolution de noms à l'ensemble du réseau local, ce qui permet aux appareils de découvrir les services et les ressources disponibles sur le réseau sans configuration préalable.

mDNS est basé sur le protocole DNS standard, mais utilise des requêtes multicast UDP pour communiquer directement avec les autres appareils du réseau. Cela permet une découverte automatique des services et des appareils sans nécessiter de serveur DNS centralisé.

## Avantages de l'utilisation de mDNS

- **Facilité de configuration :** mDNS ne nécessite pas de configuration manuelle des serveurs DNS ou des enregistrements de noms. Les appareils peuvent se découvrir automatiquement sur le réseau local.
- **Découverte automatique des services :** Les appareils peuvent annoncer les services qu'ils offrent via mDNS, ce qui permet aux autres appareils de les découvrir et d'y accéder facilement.
- **Compatibilité multiplateforme :** mDNS est pris en charge par de nombreux systèmes d'exploitation et appareils, ce qui en fait une solution universelle pour la résolution de noms dans un réseau local.
- **Sécurité :** mDNS est conçu pour fonctionner en toute sécurité sur un réseau local, sans exposer les informations sensibles à l'extérieur du réseau.

## Installation d'Avahi sur Linux

Avahi est une implémentation open-source du protocole mDNS pour les systèmes Linux. Pour installer Avahi sur votre système, vous pouvez utiliser le gestionnaire de paquets de votre distribution Linux.

### Sur Debian/Ubuntu

```bash
sudo apt update
sudo apt install avahi-daemon avahi-utils
```

### Vérification de l'état d'Avahi

Après l'installation, vous pouvez vérifier l'état du service Avahi pour vous assurer qu'il est en cours d'exécution :

```bash
sudo systemctl status avahi-daemon
```

activez le service Avahi pour qu'il démarre automatiquement au démarrage du système :

```bash
sudo systemctl enable avahi-daemon
```

Redémarrez le service Avahi pour appliquer les modifications :

```bash
sudo systemctl restart avahi-daemon
```


Si le service est actif et en cours d'exécution, vous devriez voir un message indiquant que le service est actif et qu'il écoute sur le port 5353.

## Utilisation d'Avahi

Une fois Avahi installé et en cours d'exécution, vous pouvez commencer à utiliser mDNS pour résoudre les noms de domaine sur votre réseau local. Voici quelques commandes utiles pour travailler avec Avahi :

### Recherche de services

Pour rechercher les services disponibles sur le réseau local, vous pouvez utiliser la commande `avahi-browse`. Par exemple, pour rechercher tous les services HTTP disponibles :

```bash
avahi-browse -rt _http._tcp
```

### Résolution de noms

Pour résoudre un nom de domaine en adresse IP à l'aide d'Avahi, vous pouvez utiliser la commande `avahi-resolve-host-name`. Par exemple, pour résoudre l'adresse IP de `monserveur.local` :

```bash
avahi-resolve-host-name monserveur.local
```

### Annonces de services

Pour annoncer un service sur le réseau local, vous pouvez utiliser le fichier de configuration `avahi.service`. Voici un exemple de fichier de service pour annoncer un serveur web :

```ini
<?xml version="1.0"?>
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
  <name replace-wildcards="yes">%h</name>
  <service>
    <type>_http._tcp</type>
    <port>80</port>
  </service>
</service-group>
```

Enregistrez ce fichier sous `/etc/avahi/services/myservice.service` et redémarrez le service Avahi pour qu'il prenne effet.

## Conclusion

L'utilisation de mDNS avec Avahi peut simplifier la résolution de noms sur un réseau local et permettre une découverte automatique des services et des appareils. En installant Avahi sur votre système Linux, vous pouvez profiter des avantages de la résolution de noms sans serveur DNS centralisé.