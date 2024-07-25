---
title: multipass-installation-deb
date: 2024-07-12
tags:
  - ressource
  - programmes
  - linux
  - virtualisations
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
référence:
  - "[[multipass-installation-snap]]"
---
# Comment installer Multipass via paquet `.deb` :

1. **Télécharger le paquet Multipass** : Rendez-vous sur la [page des téléchargements de Multipass](https://multipass.run/download) et téléchargez le paquet `.deb` pour Linux.

    Ou utilisez la commande `wget` pour télécharger directement le fichier :

    ```bash
    wget https://github.com/canonical/multipass/releases/download/v<version>/multipass_<version>+<build>_amd64.deb
    ```

    Remplacez `<version>` et `<build>` par les valeurs appropriées de la dernière version disponible. Par exemple, pour la version 1.9.1, la commande serait :

    ```bash
    wget https://github.com/canonical/multipass/releases/download/v1.9.1/multipass_1.9.1+mac2.dmg_amd64.deb
    ```

2. **Installer le paquet avec dpkg** :

    ```bash
    sudo dpkg -i multipass_<version>+<build>_amd64.deb
    ```

3. **Installer les dépendances manquantes** : Si l'installation échoue à cause des dépendances manquantes, utilisez la commande suivante pour les installer :

    ```bash
    sudo apt-get install -f
    ```

4. **Vérifier l'installation** : Après l'installation, vous pouvez vérifier que Multipass fonctionne en exécutant la commande suivante :

    ```bash
    multipass version
    ```

Si vous avez besoin de l'URL exacte pour la dernière version ou d'une aide supplémentaire pour l'installation, n'hésitez pas à demander !