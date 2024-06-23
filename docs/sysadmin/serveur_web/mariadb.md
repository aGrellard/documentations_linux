- [Installation et configuration de MariaDB sous Debian 12 (Bookworm)](#installation-et-configuration-de-mariadb-sous-debian-12-bookworm)
  - [Étape 1 : Installation de MariaDB](#étape-1--installation-de-mariadb)
  - [Étape 2 : Sécurisation de MariaDB](#étape-2--sécurisation-de-mariadb)
  - [Étape 3 : Connexion à MariaDB](#étape-3--connexion-à-mariadb)
  - [Étape 4 : Création d'une nouvelle base de données et d'un utilisateur](#étape-4--création-dune-nouvelle-base-de-données-et-dun-utilisateur)
  - [Conclusion](#conclusion)


# Installation et configuration de MariaDB sous Debian 12 (Bookworm)

MariaDB est un système de gestion de base de données relationnelles, fork de MySQL, qui offre des fonctionnalités de stockage de données, de récupération et de gestion. Voici comment installer et configurer MariaDB sur Debian 12 "Bookworm".

## Étape 1 : Installation de MariaDB

1. **Mettre à jour la liste des paquets** : Avant d'installer de nouveaux paquets, assurez-vous que vos listes de paquets Debian sont à jour.

   ```bash
   sudo apt update
   ```

2. **Installer MariaDB** : Installez le serveur MariaDB ainsi que le client MariaDB à l'aide de `apt`.

   ```bash
   sudo apt install mariadb-server mariadb-client
   ```

## Étape 2 : Sécurisation de MariaDB

Après l'installation, il est recommandé de sécuriser votre installation de MariaDB. MariaDB fournit un script simple pour cela.

1. **Exécutez le script de sécurisation** :

   ```bash
   sudo mysql_secure_installation
   ```

2. Vous serez invité à configurer les paramètres de sécurité, notamment :

   - Définir le mot de passe de l'utilisateur `root` de MariaDB.
   - Supprimer les utilisateurs anonymes.
   - Désactiver la connexion `root` à distance.
   - Supprimer la base de données de test et l'accès à celle-ci.
   - Recharger les tables de privilèges pour assurer que toutes les modifications prennent effet.

   Suivez les instructions à l'écran pour chaque étape. Il est généralement conseillé de répondre "Y" (oui) à toutes les questions pour une configuration sécurisée.

## Étape 3 : Connexion à MariaDB

Pour vous connecter à votre serveur MariaDB en tant qu'utilisateur `root`, utilisez la commande suivante :

```bash
sudo mysql -u root -p
```

Vous serez invité à entrer le mot de passe de l'utilisateur `root` que vous avez défini lors de l'exécution du script `mysql_secure_installation`.

## Étape 4 : Création d'une nouvelle base de données et d'un utilisateur

Il est recommandé de créer une base de données spécifique et un utilisateur pour chaque application.

1. **Connexion à MariaDB** :

   Si vous n'êtes pas déjà connecté, connectez-vous à MariaDB comme indiqué précédemment.

2. **Créer une nouvelle base de données** :

   Remplacez `nom_de_la_base` par le nom souhaité pour votre base de données.

   ```sql
   CREATE DATABASE nom_de_la_base;
   ```

3. **Créer un nouvel utilisateur** :

   Remplacez `nom_utilisateur` par le nom souhaité pour votre nouvel utilisateur et `mot_de_passe` par un mot de passe sécurisé.

   ```sql
   CREATE USER 'nom_utilisateur'@'localhost' IDENTIFIED BY 'mot_de_passe';
   ```

4. **Donner à l'utilisateur les privilèges sur la base de données** :

   ```sql
   GRANT ALL PRIVILEGES ON nom_de_la_base.* TO 'nom_utilisateur'@'localhost';
   ```

5. **Appliquer les changements de privilèges** :

   ```sql
   FLUSH PRIVILEGES;
   ```

6. **Quitter MariaDB** :

   ```sql
   EXIT;
   ```

## Conclusion

Vous avez maintenant installé et configuré MariaDB sur Debian 12 "Bookworm". Vous avez sécurisé votre installation de MariaDB, créé une base de données, et défini un utilisateur pour gérer cette base de données. Ces étapes vous fournissent une base solide pour héberger vos applications nécessitant une base de données MariaDB.