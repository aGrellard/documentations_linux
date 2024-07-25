# Tutoriel et Documentation Complète sur HSTR (HISTory ReSearch)

## Introduction

HSTR (HISTory ReSearch) est un outil de ligne de commande qui améliore la façon dont vous recherchez dans l'historique des commandes bash et zsh. Il permet une recherche facile et une gestion de l'historique des commandes, offrant une interface interactive pour trouver et exécuter rapidement des commandes précédentes.

## Installation

**Sur Ubuntu/Debian :**

```bash
sudo add-apt-repository ppa:ultradvorka/ppa
sudo apt-get update
sudo apt-get install hstr
```

**Sur Fedora :**

```bash
sudo dnf install hstr
```

**Sur Arch Linux :**

```bash
yay -S hstr
```

## Configuration

Pour configurer HSTR pour bash, ajoutez ceci à votre `~/.bashrc` :

```bash
export HSTR_CONFIG=hicolor         # optionnel: personnalisez la configuration
bind '"\C-r": "\C-a hstr -- \C-j"' # bind Ctrl-r pour lancer HSTR
```

Pour zsh, ajoutez ceci à votre `~/.zshrc` :

```bash
bindkey -s "\C-r" "\C-a hstr -- \C-j"
```

Après modification, rechargez votre shell :

```bash
source ~/.bashrc # ou ~/.zshrc
```

## Options et Paramètres

- `--show-configuration` ou `-s`: Affiche les instructions de configuration pour bash/zsh.
- `--help` ou `-h` : Affiche l'aide.
- `--version` ou `-V` : Affiche la version de HSTR.
- `--favorites` ou `-f` : Gère les commandes favorites.
- `--non-interactive` ou `-n`: Affiche l'historique sans entrer dans l'interface utilisateur interactive.

## Utilisation de Base

Appuyez sur `Ctrl-r` pour lancer HSTR. Tapez pour rechercher dans l'historique. Utilisez les flèches pour naviguer et `Enter` pour exécuter une commande.

## Exemples d'Utilisation

### Recherche et Exécution d'une Commande

1. **Lancer HSTR** : Appuyez sur `Ctrl-r`.
2. **Recherche** : Commencez à taper les premiers caractères de votre commande. HSTR filtre les résultats en temps réel.
3. **Navigation** : Utilisez les flèches haut/bas pour sélectionner une commande.
4. **Exécution** : Appuyez sur `Enter` pour exécuter la commande sélectionnée.

### Ajout aux Favoris

1. Sélectionnez une commande avec les flèches.
2. Appuyez sur `Ctrl-f` pour ajouter/retirer la commande des favoris.

### Affichage et Sélection à partir des Favoris

- Lancez HSTR et appuyez sur `Ctrl-f` pour basculer vers l'affichage des favoris. Sélectionnez et exécutez comme d'habitude.

### Filtrage Non-Interactif

Pour afficher les commandes contenant `git` sans entrer en mode interactif :

```bash
hstr --non-interactive git
```

## Personnalisation

HSTR peut être personnalisé via la variable d'environnement `HSTR_CONFIG`. Exemple :

```bash
export HSTR_CONFIG='hicolor,keywords'
```

- `hicolor` : Utilise des couleurs vives pour l'interface.
- `keywords` : Active le filtrage par mots-clés.

## Conclusion

HSTR est un outil puissant et flexible pour gérer l'historique de commande de manière efficace. Il offre une recherche rapide, la gestion des favoris, et une interface utilisateur intuitive pour retrouver et réexécuter des commandes. Sa personnalisation et ses options avancées le rendent inestimable pour tout utilisateur de terminal cherchant à optimiser son flux de travail.