### Étape 1: Créer un Dockerfile



```Dockerfile
FROM debian:latest

# Installe les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    npm install -g tldr

# Définit le point d'entrée pour le conteneur
ENTRYPOINT ["sleep", "infinity"]

```

### Étape 2: Construire l'image Docker

Ouvrez un terminal dans le répertoire où se trouve votre Dockerfile et exécutez la commande suivante pour construire l'image Docker :

```bash
docker build -t tldr-docker .
```

### Étape 3: Créer et lancer le conteneur

Lancez un conteneur basé sur l'image que vous venez de créer. Ce conteneur sera en cours d'exécution indéfiniment, prêt à être utilisé à tout moment.

```bash
docker run -d --name tldr-container tldr-docker
```

### Étape 4: Configurer un alias dans `zsh`

Modifiez votre fichier `.zshrc` pour ajouter un alias qui exécute `fx` dans le conteneur existant. Ouvrez le fichier `.zshrc` avec un éditeur de texte :

```bash
nano ~/.zshrc
```

Ajoutez la ligne suivante pour créer l'alias `fx` :

```zsh
alias fx='docker exec -i tldr-container tldr'
```

### Étape 5: Recharger le fichier `.zshrc`

Pour appliquer les modifications sans avoir à redémarrer votre terminal, exécutez la commande suivante :

```bash
source ~/.zshrc
```

### Points supplémentaires

- **Gestion du conteneur** : Si vous avez besoin d'interagir directement avec le conteneur, vous pouvez attacher un shell interactif en utilisant :

  ```bash
  docker exec -it tldr-container /bin/bash
  ```

- **Arrêter et supprimer le conteneur** : Si vous avez besoin de stopper et supprimer le conteneur à un moment donné, vous pouvez le faire avec les commandes suivantes :

  ```bash
  docker stop tldr-container
  docker rm tldr-container
  ```
