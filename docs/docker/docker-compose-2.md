### Documentation Docker Compose

#### 1. Introduction

Docker Compose est un outil puissant qui permet de définir et de gérer des applications multi-conteneurs Docker. Grâce à Docker Compose, vous pouvez utiliser un fichier YAML pour configurer vos services et, avec une seule commande, démarrer ou arrêter l'ensemble des services définis.

#### 2. Installation

Pour installer Docker Compose sur Debian 12, suivez ces étapes :

1. **Installer Docker** :
   ```bash
   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io
   ```
2. **Télécharger la version stable de Docker Compose** :
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   ```
3. **Appliquer les permissions d'exécution** :
   ```bash
   sudo chmod +x /usr/local/bin/docker-compose
   ```
4. **Vérifier l'installation** :
   ```bash
   docker-compose --version
   ```

#### 3. Fonctionnement de Docker Compose

Docker Compose permet de définir une application multi-conteneurs dans un fichier `docker-compose.yml` et de gérer l'ensemble des services avec des commandes simples comme `docker compose up` et `docker compose down`.

##### Syntaxe et Exemples

Un fichier `docker-compose.yml` typique ressemble à ceci :
```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "80:80"
  redis:
    image: "redis:alpine"
```

Pour démarrer les services définis, utilisez :
```bash
docker compose up
```

Pour arrêter et supprimer les conteneurs, les réseaux et les volumes définis, utilisez :
```bash
docker compose down
```

#### 4. Options de Docker Compose

Voici une liste complète des options disponibles pour Docker Compose :

- **`-f, --file FILE`** : Spécifie le fichier de configuration Compose à utiliser.
  ```bash
  docker compose -f docker-compose.yml -f docker-compose.override.yml up
  ```

- **`--project-name NAME`** : Définit un nom de projet.
  ```bash
  docker compose --project-name myproject up
  ```

- **`--env-file FILE`** : Spécifie un fichier d'environnement à utiliser.
  ```bash
  docker compose --env-file .env up
  ```

- **`--log-level LEVEL`** : Définit le niveau de journalisation (debug, info, warning, error, critical).
  ```bash
  docker compose --log-level debug up
  ```

- **`up`** : Crée et démarre les conteneurs.
  ```bash
  docker compose up
  ```

- **`down`** : Arrête et supprime les conteneurs, les réseaux et les volumes.
  ```bash
  docker compose down
  ```

- **`ps`** : Liste les conteneurs en cours d'exécution.
  ```bash
  docker compose ps
  ```

- **`logs`** : Affiche les journaux de sortie des services.
  ```bash
  docker compose logs
  ```

- **`exec`** : Exécute une commande dans un conteneur en cours d'exécution.
  ```bash
  docker compose exec web bash
  ```

- **`build`** : Construit ou reconstruit les services.
  ```bash
  docker compose build
  ```

- **`pull`** : Télécharge les images des services définis dans le fichier compose.
  ```bash
  docker compose pull
  ```

- **`start`** : Démarre les services spécifiés sans créer de nouveaux conteneurs.
  ```bash
  docker compose start
  ```

- **`stop`** : Arrête les services sans supprimer les conteneurs.
  ```bash
  docker compose stop
  ```

- **`restart`** : Redémarre les services.
  ```bash
  docker compose restart
  ```

- **`rm`** : Supprime les conteneurs arrêtés.
  ```bash
  docker compose rm
  ```

- **`images`** : Liste les images utilisées par les conteneurs créés.
  ```bash
  docker compose images
  ```

- **`events`** : Diffuse les événements des conteneurs pour chaque conteneur du projet.
  ```bash
  docker compose events
  ```

- **`config`** : Valide et affiche la configuration Compose.
  ```bash
  docker compose config
  ```

- **`top`** : Affiche les processus en cours d'exécution des conteneurs.
  ```bash
  docker compose top
  ```

- **`version`** : Affiche les informations sur la version.
  ```bash
  docker compose version
  ```

#### 5. Exemples Concrets

**Exemple 1 : Application Web avec Redis**

1. Créez un fichier `docker-compose.yml` :
   ```yaml
   version: '3'
   services:
     web:
       image: python:3.8
       volumes:
         - .:/code
       working_dir: /code
       command: python app.py
       ports:
         - "5000:5000"
     redis:
       image: "redis:alpine"
   ```

2. Créez un fichier `app.py` :
   ```python
   from flask import Flask
   import redis

   app = Flask(__name__)
   cache = redis.Redis(host='redis', port=6379)

   @app.route('/')
   def hello():
       return 'Hello, World!'

   if __name__ == "__main__":
       app.run(host="0.0.0.0", port=5000)
   ```

3. Démarrez l'application :
   ```bash
   docker compose up
   ```

Cet exemple configure une application Flask qui utilise Redis comme base de données.

#### 6. Conclusion

Docker Compose simplifie considérablement la gestion des applications multi-conteneurs. En définissant les services, les réseaux et les volumes dans un fichier YAML, vous pouvez facilement versionner et partager vos configurations. Pour plus de détails et d'exemples, consultez la [documentation officielle de Docker Compose](https://docs.docker.com/compose/overview) et la [référence des commandes](https://docs.docker.com/compose/reference/)【28†source】【29†source】【30†source】【31†source】【32†source】【33†source】【34†source】【35†source】【36†source】【37†source】.