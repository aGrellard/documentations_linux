- [docker compose up -d / --build](#docker-compose-up--d----build)
- [commande docker-compose : image et conteneur](#commande-docker-compose--image-et-conteneur)
  - [commande de base](#commande-de-base)
  - [commande de base avec reconstruction de l'image](#commande-de-base-avec-reconstruction-de-limage)
  - [commande de base avec suppression des conteneurs](#commande-de-base-avec-suppression-des-conteneurs)
  - [commande de base avec suppression des conteneurs et reconstruction de l'image](#commande-de-base-avec-suppression-des-conteneurs-et-reconstruction-de-limage)
  - [commande de base avec suppression des conteneurs, volumes et reconstruction de l'image](#commande-de-base-avec-suppression-des-conteneurs-volumes-et-reconstruction-de-limage)
  - [commande de base avec suppression des conteneurs, volumes, images et reconstruction de l'image](#commande-de-base-avec-suppression-des-conteneurs-volumes-images-et-reconstruction-de-limage)
  - [commande de base avec suppression des conteneurs, volumes, images, réseaux et reconstruction de l'image](#commande-de-base-avec-suppression-des-conteneurs-volumes-images-réseaux-et-reconstruction-de-limage)
- [commande docker-compose : gestions](#commande-docker-compose--gestions)
  - [Lister les containers](#lister-les-containers)
  - [Voir les logs](#voir-les-logs)
  - [Arrêter les containers](#arrêter-les-containers)
  - [Redémarrer les containers](#redémarrer-les-containers)
  - [Supprimer les containers](#supprimer-les-containers)
  - [Exécuter une commande dans un container](#exécuter-une-commande-dans-un-container)
  - [Démarrer des services spécifiques](#démarrer-des-services-spécifiques)
  - [Reconstruire et redémarrer un service](#reconstruire-et-redémarrer-un-service)
  - [Voir les configurations](#voir-les-configurations)
- [commande docker](#commande-docker)
  - [commande de base : image et conteneur](#commande-de-base--image-et-conteneur)
    - [commande de base](#commande-de-base-1)
    - [commande de base avec suppression du conteneur](#commande-de-base-avec-suppression-du-conteneur)
  - [Démarrer et Arrêter](#démarrer-et-arrêter)
  - [Gestion et Inspection](#gestion-et-inspection)
  - [Exécution de Commandes](#exécution-de-commandes)
  - [Gestion des Images](#gestion-des-images)
  - [Nettoyage](#nettoyage)
  - [Réseaux](#réseaux)


# docker compose up -d / --build

[docker cheatsheet](https://dockercheatsheet.com/)


>docker-compose.yml

```yaml
version: '3.8'

services:
  mkdocs:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: mkdocs_container
    ports:
      - "8800:8000"
    volumes:
      - /media/usb_1T/Data/Programmation_code/_I1_LINUX/_B0_DOCU_LINUX/docs:/docs
      - /media/usb_1T/Data/Programmation_code/_I1_LINUX/_B0_DOCU_LINUX:/config
    command: serve --dev-addr=0.0.0.0:8000 --config-file /config/mkdocs.yml
```

>Dockerfile

```Dockerfile
# Utilisez l'image de base avec MkDocs et le thème Material
FROM squidfunk/mkdocs-material

# Installez les dépendances supplémentaires ici, si nécessaire
# RUN pip install --no-cache-dir package_name==version
```

# commande docker-compose : image et conteneur

## commande de base
    
```bash
docker compose up -d
```

## commande de base avec reconstruction de l'image

```bash
docker compose up -d --build
```

## commande de base avec suppression des conteneurs

```bash
docker compose down
```

## commande de base avec suppression des conteneurs et reconstruction de l'image

```bash
docker compose down --rmi all
```

## commande de base avec suppression des conteneurs, volumes et reconstruction de l'image

```bash
docker compose down --volumes --rmi all
```

## commande de base avec suppression des conteneurs, volumes, images et reconstruction de l'image

```bash
docker compose down --volumes --rmi all --remove-orphans
```

## commande de base avec suppression des conteneurs, volumes, images, réseaux et reconstruction de l'image

```bash
docker compose down --volumes --rmi all --remove-orphans --remove-networks
```

# commande docker-compose : gestions

## Lister les containers
   ```sh
   sudo docker compose ps
   ```
   Cette commande affiche la liste des containers gérés par le `docker-compose.yml` dans le répertoire courant.

## Voir les logs
   ```sh
   sudo docker compose logs
   ```
   Utilisez cette commande pour afficher les logs de vos containers. Ajoutez `-f` pour suivre les logs en continu.

## Arrêter les containers
   ```sh
   sudo docker compose stop
   ```
   Cette commande arrête les containers en cours d'exécution sans les supprimer. Vous pouvez les redémarrer avec `sudo docker compose start`.

## Redémarrer les containers
   ```sh
   sudo docker compose restart
   ```
   Utilisez cette commande pour redémarrer les containers.

## Supprimer les containers
   ```sh
   sudo docker compose down
   ```
   Cette commande arrête et supprime les containers, les réseaux, et, si spécifié avec les options `-v` ou `--volumes`, les volumes anonymes associés au projet.

## Exécuter une commande dans un container
   ```sh
   sudo docker compose exec nom_du_service commande
   ```
   Par exemple, pour ouvrir un shell interactif dans votre container `mkdocs`, vous pourriez utiliser :
   ```sh
   sudo docker compose exec mkdocs /bin/sh
   ```
   Notez que cette commande fonctionne avec les containers déjà démarrés.

## Démarrer des services spécifiques
   ```sh
   sudo docker compose up -d nom_du_service
   ```
   Si vous souhaitez démarrer un service spécifique défini dans votre fichier `docker-compose.yml`.

## Reconstruire et redémarrer un service
   Si vous avez modifié le Dockerfile ou besoin de reconstruire une image pour une autre raison :
   ```sh
   sudo docker compose up -d --no-deps --build nom_du_service
   ```
   Cette commande reconstruit l'image pour le service spécifié sans utiliser le cache et redémarre le service sans redémarrer les autres services.

## Voir les configurations
   ```sh
   sudo docker compose config
   ```
   Cette commande valide et affiche la configuration combinée des services, utile pour vérifier que vos fichiers `docker-compose.yml` et environnements sont configurés comme prévu.

# commande docker

## commande de base : image et conteneur

### commande de base 

```bash
docker run -d \
  -p 8800:8000 \
  -v /media/usb_1T/Data/Programmation_code/_I1_LINUX/_B0_DOCU_LINUX/docs:/docs \
  -v /media/usb_1T/Data/Programmation_code/_I1_LINUX/_B0_DOCU_LINUX:/config \
  squidfunk/mkdocs-material:latest \
  serve --dev-addr=0.0.0.0:8000 --config-file /config/mkdocs.yml
```

### commande de base avec suppression du conteneur

```bash
docker run -d \
  --rm \
  -p 8800:8000 \
  -v /media/usb_1T/Data/Programmation_code/_I1_LINUX/_B0_DOCU_LINUX/docs:/docs \
  -v /media/usb_1T/Data/Programmation_code/_I1_LINUX/_B0_DOCU_LINUX:/config \
  squidfunk/mkdocs-material:latest \
  serve --dev-addr=0.0.0.0:8000 --config-file /config/mkdocs.yml
```

## Démarrer et Arrêter

- **Démarrer un container** :
  ```bash
  docker start container_name_or_id
  ```

- **Arrêter un container** :
  ```bash
  docker stop container_name_or_id
  ```
  Cette commande arrête un container en cours d'exécution en envoyant un signal SIGTERM suivi d'un SIGKILL après un délai de grâce.

## Gestion et Inspection

- **Lister les containers** :
  ```bash
  docker ps
  ```
  Pour voir tous les containers, y compris ceux qui sont arrêtés, utilisez `docker ps -a`.

- **Inspecter un container** :
  ```bash
  docker inspect container_name_or_id
  ```
  Affiche des détails en format JSON sur un container spécifique, y compris la configuration, le réseau, l'état et bien plus.

- **Voir les logs d'un container** :
  ```bash
  docker logs container_name_or_id
  ```
  Affiche les logs stdout et stderr d'un container. Utilisez `-f` pour suivre le log en temps réel.

## Exécution de Commandes

- **Exécuter une commande dans un container en cours d'exécution** :
  ```bash
  docker exec -it container_name_or_id command
  ```
  Lance une commande dans un container actif. Utilise `-it` pour une interaction interactive, permettant par exemple d'ouvrir un shell.

## Gestion des Images

- **Construire une image à partir d'un Dockerfile** :
  ```bash
  docker build -t image_name:tag .
  ```
  Construit une image Docker à partir d'un Dockerfile dans le répertoire courant.

- **Supprimer une image** :
  ```bash
  docker rmi image_name:tag
  ```
  Supprime une image Docker spécifiée.

## Nettoyage

- **Supprimer tous les containers arrêtés, les réseaux non utilisés, les images sans containers, et le cache de build** :
  ```bash
  docker system prune
  ```
  Propose une manière rapide de libérer de l'espace disque.

- **Supprimer un container** :
  ```bash
  docker rm container_name_or_id
  ```
  Supprime un container spécifique. Utilisez `-f` pour forcer la suppression d'un container même s'il est en cours d'exécution.

## Réseaux

- **Créer un réseau** :
  ```bash
  docker network create network_name
  ```
  Crée un nouveau réseau Docker, permettant la communication entre les containers.

- **Lister les réseaux** :
  ```bash
  docker network ls
  ```
  Affiche tous les réseaux Docker disponibles.