- [Installation de `tmux` sur Debian](#installation-de-tmux-sur-debian)
- [Démarrage avec `tmux`](#démarrage-avec-tmux)
- [Commandes de base](#commandes-de-base)
- [Gestion des fenêtres](#gestion-des-fenêtres)
- [Division en panneaux](#division-en-panneaux)
- [Personnalisation de `tmux`](#personnalisation-de-tmux)
  - [Changement du Préfixe](#changement-du-préfixe)
  - [Amélioration de l'Apparence](#amélioration-de-lapparence)
  - [Gestion des fenêtres et des panneaux](#gestion-des-fenêtres-et-des-panneaux)
  - [Raccourcis Clavier](#raccourcis-clavier)
  - [Autres fonctionnalités](#autres-fonctionnalités)
- [Listes de raccourcis](#listes-de-raccourcis)
  - [Gestion des sessions](#gestion-des-sessions)
  - [Gestion des fenêtres](#gestion-des-fenêtres-1)
  - [Gestion des panneaux](#gestion-des-panneaux)
  - [Autres commandes utiles](#autres-commandes-utiles)

### Installation de `tmux` sur Debian

1. **Ouvrez un terminal**.
2. Mettez à jour la liste des paquets de votre système avec la commande :
   ```
   sudo apt update
   ```
3. Installez `tmux` en exécutant :
   ```
   sudo apt install tmux
   ```

### Démarrage avec `tmux`

Pour démarrer une nouvelle session `tmux`, ouvrez un terminal et tapez :
```
tmux
```
Vous entrerez dans une nouvelle session `tmux`. Par défaut, vous ne verrez pas beaucoup de différence, mais vous êtes maintenant à l'intérieur d'une session `tmux`.

### Commandes de base

- **Démarrer une nouvelle session** : `tmux new -s nom_session`
- **Lister les sessions actives** : `tmux ls`
- **Attacher à une session existante** : `tmux attach -t nom_session`
- **Détacher de la session actuelle** : `Ctrl+b d`

### Gestion des fenêtres

Dans `tmux`, les fenêtres fonctionnent comme des onglets dans un navigateur.

- **Créer une nouvelle fenêtre** : `Ctrl+b c`
- **Changer de fenêtre** : `Ctrl+b numéro_fenêtre`
- **Renommer la fenêtre actuelle** : `Ctrl+b ,`

### Division en panneaux

`tmux` permet également de diviser une fenêtre en plusieurs panneaux.

- **Diviser verticalement** : `Ctrl+b %`
- **Diviser horizontalement** : `Ctrl+b "`
- **Naviguer entre les panneaux** : `Ctrl+b flèche_directionnelle`

### Personnalisation de `tmux`

Vous pouvez personnaliser `tmux` en modifiant le fichier de configuration `~/.tmux.conf`. Par exemple, pour changer le raccourci préfixe de `Ctrl+b` à `Ctrl+a`, ajoutez la ligne suivante à votre fichier `~/.tmux.conf` :

```
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```

Redémarrez `tmux` ou rechargez la configuration pour que les changements prennent effet.

La personnalisation de `tmux` se fait principalement à travers le fichier de configuration `~/.tmux.conf`. Vous pouvez modifier ce fichier pour ajuster l'apparence, le comportement des sessions, fenêtres, et panneaux, ainsi que pour redéfinir ou créer des raccourcis clavier. Voici une liste de personnalisation populaire que vous pouvez appliquer à `tmux` :

#### Changement du Préfixe

Modifier la touche préfixe (par défaut `Ctrl+b`) pour quelque chose de plus facile à atteindre, comme `Ctrl+a` :

```tmux
set -g prefix C-a
unbind C-b
bind C-a send-prefix
```

#### Amélioration de l'Apparence

- **Définir le thème des barres de statut** : Changer la couleur ou le format de la barre de statut.

    ```tmux
    set -g status-bg cyan
    set -g status-fg black
    set -g status-interval 60
    set -g status-left '#[fg=green](#S) '
    set -g status-right '#[fg=yellow]#(uptime | cut -d "," -f 1-2)'
    ```

- **Personnaliser le panneau de sélection de fenêtres** : Modifier l'apparence de la liste des fenêtres lors de l'utilisation de `Ctrl+b w`.

    ```tmux
    setw -g window-status-current-bg red
    ```

#### Gestion des fenêtres et des panneaux

- **Définir la réindexation automatique des fenêtres** : Pour que les numéros de fenêtres soient toujours consécutifs sans aucun trou.

    ```tmux
    set -g renumber-windows on
    ```

- **Configurer le découpage automatique des panneaux** : Pour définir le comportement par défaut lors de la création de nouveaux panneaux.

    ```tmux
    bind | split-window -h
    bind - split-window -v
    setw -g automatic-rename on
    ```

#### Raccourcis Clavier

- **Créer des raccourcis pour redimensionner les panneaux** :

    ```tmux
    bind -r H resize-pane -L 5
    bind -r J resize-pane -D 5
    bind -r K resize-pane -U 5
    bind -r L resize-pane -R 5
    ```

- **Définir des raccourcis pour naviguer entre les panneaux avec Vim keybindings** :

    ```tmux
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R
    ```

#### Autres fonctionnalités

- **Augmenter l'historique du tampon de défilement** :

    ```tmux
    set -g history-limit 10000
    ```

- **Utiliser des couleurs 256 couleurs** :

    ```tmux
    set -g default-terminal "screen-256color"
    ```

- **Démarrage automatique de sessions et de fenêtres** : Vous pouvez configurer `tmux` pour démarrer automatiquement avec plusieurs sessions, fenêtres, et même exécuter des commandes dans ces fenêtres.

```tmux
new-session -d -s 'Session1'
new-window -t 'Session1:1' -n 'Window1'
new-window -t 'Session1:2' -n 'Window2'
send-keys -t 'Session1:1' 'cd /mon/dossier/projet && clear' C-m
```

Ces personnalisations ne sont que la pointe de l'iceberg en termes de ce que vous pouvez réaliser avec `tmux`. En explorant la documentation et les ressources communautaires, vous découvrirez une richesse d'options pour rendre votre expérience `tmux` aussi efficace et agréable que possible.


### Listes de raccourcis

Les raccourcis clavier jouent un rôle crucial dans la manipulation efficace de `tmux`, permettant de contrôler les sessions, les fenêtres, et les panneaux rapidement. Voici une liste exhaustive des raccourcis `tmux` les plus couramment utilisés, en supposant que le préfixe par défaut `Ctrl+b` est conservé. Pour activer un raccourci, vous devez d'abord appuyer sur `Ctrl+b`, puis relâcher ces touches, et enfin presser la touche du raccourci.

#### Gestion des sessions

- **Démarrer une nouvelle session** : `tmux new -s nom_session`
- **Lister toutes les sessions** : `tmux ls`
- **Attacher à une session nommée/détachée** : `tmux attach -t nom_session`
- **Détacher de la session actuelle** : `Ctrl+b d`
- **Passer à la session suivante** : `Ctrl+b )`
- **Passer à la session précédente** : `Ctrl+b (`
- **Renommer la session actuelle** : `Ctrl+b $`

#### Gestion des fenêtres

- **Créer une nouvelle fenêtre** : `Ctrl+b c`
- **Fermer la fenêtre actuelle** : `Ctrl+b &`
- **Passer à la fenêtre suivante** : `Ctrl+b n`
- **Passer à la fenêtre précédente** : `Ctrl+b p`
- **Sélectionner une fenêtre par son numéro** : `Ctrl+b numéro`
- **Renommer la fenêtre actuelle** : `Ctrl+b ,`
- **Trouver une fenêtre** : `Ctrl+b f`

#### Gestion des panneaux

- **Diviser le panneau actuel horizontalement** : `Ctrl+b "`
- **Diviser le panneau actuel verticalement** : `Ctrl+b %`
- **Fermer le panneau actuel** : `Ctrl+b x`
- **Passer au panneau suivant** : `Ctrl+b o`
- **Échanger le panneau actuel avec le suivant** : `Ctrl+b ;`
- **Sélectionner un panneau spécifique** : `Ctrl+b q` (puis appuyez sur le numéro du panneau)
- **Redimensionner le panneau** : `Ctrl+b` suivi de l'une des flèches directionnelles
- **Passer en mode de redimensionnement** : `Ctrl+b :` puis tapez `resize-pane` suivi de `-D`, `-U`, `-L`, `-R` pour déplacer les bordures du panneau vers le bas, le haut, la gauche ou la droite respectivement.

#### Autres commandes utiles

- **Lister toutes les commandes** : `Ctrl+b ?`
- **Passer en mode copie** : `Ctrl+b [`
- **Coller le tampon** : `Ctrl+b ]`
- **Capturer le contenu d'un panneau** : `Ctrl+b :` puis tapez `capture-pane`
- **Sauvegarder le contenu capturé** : `Ctrl+b :` puis tapez `save-buffer fichier.txt`
- **Recharger la configuration tmux** : `tmux source-file ~/.tmux.conf`

Ces raccourcis et commandes offrent un point de départ solide pour naviguer et manipuler efficacement `tmux`. La personnalisation de ces raccourcis via le fichier `~/.tmux.conf` peut encore améliorer votre productivité et adapter l'outil à vos préférences spécifiques.