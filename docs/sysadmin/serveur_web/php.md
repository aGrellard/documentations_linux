- [Installation et configuration de PHP sous Debian 12 "Bookworm"](#installation-et-configuration-de-php-sous-debian-12-bookworm)
  - [Étape 1 : Mise à jour du système](#étape-1--mise-à-jour-du-système)
  - [Étape 2 : Installation de PHP](#étape-2--installation-de-php)
  - [Étape 3 : Vérification de l'installation de PHP](#étape-3--vérification-de-linstallation-de-php)
  - [Étape 4 : Configuration de PHP](#étape-4--configuration-de-php)
    - [Configuration de PHP avec Apache](#configuration-de-php-avec-apache)
    - [Configuration de PHP avec Nginx](#configuration-de-php-avec-nginx)
  - [Conclusion](#conclusion)


# Installation et configuration de PHP sous Debian 12 "Bookworm"

PHP est un langage de script côté serveur largement utilisé pour le développement web. L'installation de PHP sur Debian permet de créer et de servir des applications web dynamiques. Voici comment installer et configurer PHP sur un système Debian 12 "Bookworm".

## Étape 1 : Mise à jour du système

Avant toute installation, assurez-vous que votre système est à jour :

```bash
sudo apt update
sudo apt upgrade
```

## Étape 2 : Installation de PHP

Debian 12 inclut généralement la version PHP la plus récente dans ses dépôts officiels. Pour installer PHP ainsi que le module PHP pour Apache (si vous utilisez Apache comme serveur web), exécutez :

```bash
sudo apt install php libapache2-mod-php
```

Si vous utilisez Nginx, PHP fonctionnera en mode FPM (FastCGI Process Manager). Installez PHP-FPM avec :

```bash
sudo apt install php-fpm
```

Pour les applications nécessitant des extensions PHP spécifiques, vous pouvez les installer en utilisant `apt`. Par exemple, pour installer les extensions courantes MySQL, GD (bibliothèque graphique), et XML, exécutez :

```bash
sudo apt install php-mysql php-gd php-xml
```

## Étape 3 : Vérification de l'installation de PHP

Pour vérifier que PHP est correctement installé, créez un fichier de test PHP :

1. Créez un nouveau fichier nommé `info.php` dans le répertoire racine du serveur web. Si vous utilisez Apache, ce répertoire est généralement `/var/www/html/`.

   ```bash
   echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
   ```

2. Ouvrez votre navigateur web et accédez à `http://votre_adresse_ip/info.php`. Vous devriez voir la page de configuration PHP, indiquant que PHP est correctement installé et configuré.

## Étape 4 : Configuration de PHP

### Configuration de PHP avec Apache

Si vous utilisez Apache, le module PHP est activé par défaut après l'installation. Vous pouvez ajuster la configuration PHP en éditant le fichier `php.ini` :

```bash
sudo nano /etc/php/7.4/apache2/php.ini
```

Remplacez `7.4` par la version spécifique de PHP installée sur votre système.

Après avoir effectué les modifications, redémarrez Apache pour appliquer les changements :

```bash
sudo systemctl restart apache2
```

### Configuration de PHP avec Nginx

Pour Nginx, assurez-vous que PHP-FPM est configuré pour écouter sur un socket ou un port spécifique. Éditez le fichier de configuration PHP-FPM :

```bash
sudo nano /etc/php/7.4/fpm/pool.d/www.conf
```

Vérifiez la ligne `listen = /run/php/php7.4-fpm.sock` et ajustez la version de PHP au besoin.

Ensuite, configurez votre serveur Nginx pour passer les requêtes PHP à PHP-FPM en éditant le fichier de configuration de votre site :

```bash
sudo nano /etc/nginx/sites-available/votre_site
```

Assurez-vous que la configuration inclut une directive `location` pour traiter les fichiers `.php` :

```nginx
location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
}
```

Redémarrez Nginx pour appliquer les modifications :

```bash
sudo systemctl restart nginx
```

## Conclusion

Vous avez maintenant installé et configuré PHP sur votre serveur Debian 12 "Bookworm". PHP est prêt à servir vos applications web, et vous pouvez commencer à développer ou déployer vos projets PHP. N'oubliez pas de sécuriser votre configuration PHP et de la maintenir à jour.