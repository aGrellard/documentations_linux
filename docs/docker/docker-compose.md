### Docker Compose sous Debian 12

#### Introduction

Docker Compose est un outil pour définir et gérer des applications multi-conteneurs Docker. Grâce à un fichier YAML, il permet de configurer les services de votre application et de les déployer en une seule commande. Cette documentation fournit une vue d'ensemble sur l'installation, le fonctionnement, la syntaxe, les options et des exemples d'utilisation de Docker Compose.

### Installation

#### Pré-requis

Avant d'installer Docker Compose, assurez-vous que Docker est installé sur votre système. Vous pouvez vérifier cela avec :

```bash
docker --version
```

Si Docker n'est pas installé, vous pouvez l'installer en suivant ces étapes :

1. Mettre à jour la liste des paquets :

   ```bash
   sudo apt update
   ```

2. Installer les paquets nécessaires pour utiliser le dépôt Docker :

   ```bash
   sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
   ```

3. Ajouter la clé GPG officielle de Docker :

   ```bash
   curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. Ajouter le dépôt Docker :

   ```bash
   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. Installer Docker Engine :

   ```bash
   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

#### Installer Docker Compose

Pour installer Docker Compose, suivez ces étapes :

1. Télécharger la version actuelle de Docker Compose :

   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   ```

2. Appliquer les permissions d'exécution :

   ```bash
   sudo chmod +x /usr/local/bin/docker-compose
   ```

3. Vérifier l'installation :

   ```bash
   docker-compose --version
   ```

### Fonctionnement de Docker Compose

Docker Compose utilise un fichier YAML pour configurer les services, les réseaux et les volumes de votre application. Avec ce fichier, vous pouvez démarrer, arrêter et reconstruire vos services avec une seule commande.

### Syntaxe de Docker Compose

Le fichier de configuration de Docker Compose s'appelle `docker-compose.yml`. Voici un exemple de syntaxe de base :

```yaml
version: '3.8'
services:
  web:
    image: nginx:latest
    ports:
      - "80:80"
  db:
    image: postgres:latest
    environment:
      POSTGRES_PASSWORD: example
```

### Exemples Concrets

#### Exemple 1 : Démarrer un Service Web et une Base de Données

1. Créez un fichier `docker-compose.yml` avec le contenu suivant :

   ```yaml
   version: '3.8'
   services:
     web:
       image: nginx:latest
       ports:
         - "80:80"
     db:
       image: postgres:latest
       environment:
         POSTGRES_PASSWORD: example
   ```

2. Démarrez les services avec :

   ```bash
   docker-compose up
   ```

   - `up` : Démarre les conteneurs définis dans le fichier `docker-compose.yml`.

3. Accédez à votre application web via `http://localhost`.

#### Exemple 2 : Construire une Image Personnalisée

1. Créez un fichier `Dockerfile` pour votre service web :

   ```Dockerfile
   FROM nginx:latest
   COPY ./html /usr/share/nginx/html
   ```

2. Modifiez le fichier `docker-compose.yml` :

   ```yaml
   version: '3.8'
   services:
     web:
       build: .
       ports:
         - "80:80"
     db:
       image: postgres:latest
       environment:
         POSTGRES_PASSWORD: example
   ```

3. Démarrez les services avec :

   ```bash
   docker-compose up --build
   ```

   - `--build` : Force la reconstruction des images.

### Liste Complète des Options et Explications

1. `up` : Démarre les conteneurs.
   - Exemple : `docker-compose up`
   - Options :
     - `-d` : Démarre les conteneurs en arrière-plan.
       - Exemple : `docker-compose up -d`
     - `--build` : Reconstruit les images avant de démarrer les conteneurs.
       - Exemple : `docker-compose up --build`

2. `down` : Arrête et supprime les conteneurs, réseaux et volumes créés par `up`.
   - Exemple : `docker-compose down`
   - Options :
     - `-v` : Supprime les volumes associés.
       - Exemple : `docker-compose down -v`

3. `build` : Construit ou reconstruit les services.
   - Exemple : `docker-compose build`
   - Options :
     - `--no-cache` : Ne pas utiliser le cache lors de la construction de l'image.
       - Exemple : `docker-compose build --no-cache`

4. `ps` : Affiche l'état des conteneurs.
   - Exemple : `docker-compose ps`

5. `logs` : Affiche les logs des conteneurs.
   - Exemple : `docker-compose logs`
   - Options :
     - `-f` : Affiche les logs en temps réel.
       - Exemple : `docker-compose logs -f`

6. `exec` : Exécute une commande dans un conteneur en cours d'exécution.
   - Exemple : `docker-compose exec web sh`
   - Options :
     - `-d` : Détache après l'exécution de la commande.
       - Exemple : `docker-compose exec -d web sh`

7. `stop` : Arrête les conteneurs sans les supprimer.
   - Exemple : `docker-compose stop`

8. `start` : Démarre les conteneurs arrêtés.
   - Exemple : `docker-compose start`

### Conclusion

Docker Compose est un outil essentiel pour la gestion des applications multi-conteneurs. Avec cette documentation, vous devriez être capable d'installer, configurer et utiliser Docker Compose efficacement sur Debian 12. Pour plus de détails, consultez la [documentation officielle de Docker Compose](https://docs.docker.com/compose).