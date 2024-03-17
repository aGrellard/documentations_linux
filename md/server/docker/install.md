# Installation et configuration de Docker sous Debian 12 "Bookworm"

Docker est une plateforme de conteneurisation qui permet de développer, expédier et exécuter des applications dans des conteneurs. Voici comment installer et configurer Docker sur Debian 12 "Bookworm".

## Prérequis

Avant de commencer, assurez-vous que votre système est à jour :

```bash
sudo apt update
sudo apt upgrade
```

## Étape 1 : Installation des paquets prérequis

Installez les paquets nécessaires pour que `apt` puisse utiliser un dépôt sur HTTPS :

```bash
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
```

## Étape 2 : Ajout du dépôt officiel Docker

1. **Ajoutez la clé GPG officielle de Docker** :

    ```bash
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    ```

2. **Configurez le dépôt Docker** :

    ```bash
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

    Remarque : Si vous êtes sur une architecture différente (par exemple, armhf, arm64), remplacez `arch=amd64` par votre architecture.

## Étape 3 : Installation de Docker Engine

1. **Mettez à jour l'index des paquets `apt`** :

    ```bash
    sudo apt update
    ```

2. **Installez Docker Engine** :

    ```bash
    sudo apt install docker-ce docker-ce-cli containerd.io
    ```

3. **Vérifiez que Docker est installé correctement** en exécutant la commande suivante, qui téléchargera une image de test et la lancera dans un conteneur :

    ```bash
    sudo docker run hello-world
    ```

    Si l'installation est correcte, vous verrez un message de bienvenue de Docker.

## Étape 4 : Exécuter Docker en tant qu'utilisateur non-root (Optionnel)

Par défaut, la commande Docker nécessite des privilèges d'administrateur. Pour exécuter Docker en tant qu'utilisateur non-root :

1. **Créez le groupe Docker** s'il n'existe pas déjà :

    ```bash
    sudo groupadd docker
    ```

2. **Ajoutez votre utilisateur au groupe Docker** :

    ```bash
    sudo usermod -aG docker $USER
    ```

3. **Activez les changements** en vous déconnectant puis en vous reconnectant, ou en redémarrant votre système.

4. **Vérifiez que vous pouvez exécuter Docker sans `sudo`** :

    ```bash
    docker run hello-world
    ```

## Étape 5 : Configuration de Docker pour démarrer au boot

Docker devrait être configuré pour démarrer automatiquement au démarrage du système. Si ce n'est pas le cas, activez-le avec :

```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

## Conclusion

Vous avez maintenant installé et configuré Docker sur Debian 12 "Bookworm". Vous pouvez commencer à utiliser Docker pour conteneuriser et gérer vos applications. Docker simplifie le déploiement d'applications en encapsulant l'application et ses dépendances dans un conteneur isolé, ce qui facilite la portabilité et l'échelle.