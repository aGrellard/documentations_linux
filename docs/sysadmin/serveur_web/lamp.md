- [Installation de la pile LAMP sur Debian 12 "Bookworm"](#installation-de-la-pile-lamp-sur-debian-12-bookworm)
  - [Étape 1: Préparation du système](#étape-1-préparation-du-système)
  - [Étape 2: Installation d'Apache](#étape-2-installation-dapache)
  - [Étape 3: Installation de MariaDB](#étape-3-installation-de-mariadb)
  - [Étape 4: Installation de PHP](#étape-4-installation-de-php)
  - [Conclusion](#conclusion)


# Installation de la pile LAMP sur Debian 12 "Bookworm"

Une pile LAMP est un ensemble de logiciels open source souvent utilisé pour héberger des sites web et des applications web. LAMP est un acronyme pour Linux (le système d'exploitation), Apache (le serveur web), MySQL/MariaDB (le système de gestion de base de données), et PHP (le langage de programmation). Voici comment installer une pile LAMP sur Debian 12 "Bookworm".

## Étape 1: Préparation du système

Mettez à jour votre système pour vous assurer que tous les paquets existants sont à jour :

```bash
sudo apt update
sudo apt upgrade
```

## Étape 2: Installation d'Apache

Apache est un serveur web populaire pour servir des pages web.

1. **Installer Apache** :

   ```bash
   sudo apt install apache2
   ```

2. **Vérifier le fonctionnement d'Apache** en accédant à votre navigateur et en visitant `http://adresse_ip_de_votre_serveur`. Si Apache est correctement installé, vous devriez voir la page par défaut d'Apache.

## Étape 3: Installation de MariaDB

MariaDB est un système de gestion de base de données, fork de MySQL, qui est utilisé pour stocker les données des sites web.

1. **Installer MariaDB** :

   ```bash
   sudo apt install mariadb-server
   ```

2. **Sécuriser l'installation de MariaDB** :

   Exécutez le script de sécurisation. Il vous guidera à travers quelques questions pour sécuriser votre installation MariaDB.

   ```bash
   sudo mysql_secure_installation
   ```

   Suivez les instructions à l'écran pour définir un mot de passe root pour MariaDB, supprimer les bases de données anonymes, désactiver les connexions root à distance, et supprimer la base de données de test.

## Étape 4: Installation de PHP

PHP est un langage de programmation côté serveur utilisé pour développer le contenu dynamique des sites web.

1. **Installer PHP** et le module PHP pour Apache :

   ```bash
   sudo apt install php libapache2-mod-php php-mysql
   ```

   Cette commande installe PHP, le module PHP pour Apache qui permet à Apache de traiter les fichiers PHP, et le module PHP pour MariaDB qui permet à PHP de communiquer avec votre base de données MariaDB.

2. **Configurer Apache pour prioriser les fichiers PHP** :

   Par défaut, Apache devrait servir des fichiers PHP correctement. Toutefois, vous pouvez vous assurer que Apache cherche d'abord les fichiers index.php en modifiant la configuration.

   ```bash
   sudo nano /etc/apache2/mods-enabled/dir.conf
   ```

   Déplacez `index.php` à la première position :

   ```apacheconf
   <IfModule mod_dir.c>
       DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
   </IfModule>
   ```

3. **Redémarrer Apache** pour appliquer les modifications :

   ```bash
   sudo systemctl restart apache2
   ```

4. **Tester PHP** :

   Créez un fichier de test PHP dans le répertoire racine d'Apache :

   ```bash
   echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
   ```

   Accédez à `http://adresse_ip_de_votre_serveur/info.php`. Si PHP est correctement installé, vous devriez voir la page d'informations de PHP.

## Conclusion

Vous avez maintenant installé avec succès une pile LAMP sur votre serveur Debian 12 "Bookworm". Cela inclut le serveur web Apache, la base de données MariaDB, et le langage de programmation PHP. Cette pile LAMP peut servir de base pour héberger des sites web et des applications web. Pensez à sécuriser davantage chaque composant de votre pile LAMP selon les meilleures pratiques de sécurité pour les serveurs web.