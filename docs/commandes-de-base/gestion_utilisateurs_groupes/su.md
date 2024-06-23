# `su`

## Introduction

La commande `su` (substitute user) est un outil de ligne de commande sous Unix et Linux utilisé pour changer l'identité de l'utilisateur au sein d'une session de terminal. C'est un moyen efficace pour les administrateurs système de basculer entre différents comptes d'utilisateurs sans se déconnecter et se reconnecter.

## Syntaxe

La syntaxe générale de `su` est :

```bash
su [options] [nom_utilisateur [-c 'commande']]
```

## Options Principales

- `-`, `-l`, `--login` : Lance un shell de connexion pour l'utilisateur, ce qui signifie que l'environnement sera celui de l'utilisateur cible, comme si vous vous étiez connecté directement à cet utilisateur.
  
- `-c`, `--command commande` : Exécute une commande spécifiée comme l'utilisateur cible, puis retourne au shell original.

- `-m`, `-p`, `--preserve-environment` : Préserve l'environnement du shell actuel lors du passage à l'utilisateur cible.

- `-s`, `--shell SHELL` : Exécute le shell spécifié au lieu de celui par défaut de l'utilisateur cible.

- `-h`, `--help` : Affiche l'aide et quitte.

- `--version` : Affiche les informations de version et quitte.

## Comment Utiliser `su`

### Basculer vers un autre utilisateur

Pour changer d'utilisateur dans votre terminal, tapez simplement `su` suivi du nom de l'utilisateur vers lequel vous souhaitez basculer :

```bash
su nom_utilisateur
```

### Exécuter une commande en tant qu'autre utilisateur

Pour exécuter une commande unique en tant qu'un autre utilisateur et revenir immédiatement à votre shell d'origine :

```bash
su nom_utilisateur -c 'commande'
```

### Utiliser un shell de connexion

Pour charger l'environnement complet, y compris le répertoire personnel et les variables d'environnement de l'utilisateur cible :

```bash
su - nom_utilisateur
```

Ou :

```bash
su -l nom_utilisateur
```

### Préserver l'environnement

Si vous souhaitez garder votre environnement actuel et passer à un autre utilisateur :

```bash
su -m nom_utilisateur
```

### Changer de shell

Pour spécifier un shell différent lors du changement d'utilisateur :

```bash
su nom_utilisateur -s /bin/sh
```

## Exemples d'Utilisation de `su`

1. **Basculer vers l'utilisateur root** :

   ```bash
   su
   ```

2. **Exécuter une commande spécifique en tant qu'utilisateur root** :

   ```bash
   su -c 'apt update'
   ```

3. **Basculer vers l'utilisateur root et utiliser bash comme shell** :

   ```bash
   su -s /bin/bash
   ```

4. **Exécuter un script shell en tant qu'un autre utilisateur** :

   ```bash
   su nom_utilisateur -c '/chemin/vers/script.sh'
   ```

5. **Ouvrir un shell interactif pour un autre utilisateur sans charger son environnement** :

   ```bash
   su nom_utilisateur
   ```

6. **Ouvrir un shell interactif pour un autre utilisateur en chargeant son environnement complet** :

   ```bash
   su - nom_utilisateur
   ```

## Conclusion

La commande `su` est un outil puissant pour la gestion des sessions utilisateur sur des systèmes Unix et Linux. Elle offre une grande flexibilité pour les administrateurs système et les utilisateurs avancés, leur permettant de basculer entre les comptes, d'exécuter des commandes en tant que différents utilisateurs, et de gérer les environnements de travail de manière sécurisée et efficace. En maîtrisant `su`, vous pouvez facilement naviguer entre les différents utilisateurs de votre système, améliorant ainsi votre productivité et votre gestion du système.