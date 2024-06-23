

- [Options de Base](#options-de-base)
- [Options d'Affichage et de Tri](#options-daffichage-et-de-tri)
- [Options de Filtrage](#options-de-filtrage)
- [Options de Format](#options-de-format)
- [Options Avancées](#options-avancées)
- [Exemples](#exemples)
  - [Pour afficher l'arborescence des dossiers et fichiers](#pour-afficher-larborescence-des-dossiers-et-fichiers)
  - [Pour afficher uniquement les dossiers](#pour-afficher-uniquement-les-dossiers)
  - [Pour limiter la profondeur de l'arborescence](#pour-limiter-la-profondeur-de-larborescence)
  - [Pour inclure la taille des fichiers](#pour-inclure-la-taille-des-fichiers)
  - [Pour ignorer un certain type de fichiers](#pour-ignorer-un-certain-type-de-fichiers)
  - [Pour sauvegarder la sortie de `tree` dans un fichier](#pour-sauvegarder-la-sortie-de-tree-dans-un-fichier)
  - [Afficher les Fichiers et Dossiers avec Permissions et Propriétaires](#afficher-les-fichiers-et-dossiers-avec-permissions-et-propriétaires)
  - [Filtrer l'Affichage par Type de Fichier](#filtrer-laffichage-par-type-de-fichier)
  - [Exclure des Fichiers ou Dossiers Spécifiques](#exclure-des-fichiers-ou-dossiers-spécifiques)
  - [Afficher un Résumé à la Fin](#afficher-un-résumé-à-la-fin)
  - [Colorer la Sortie](#colorer-la-sortie)
  - [Enregistrer la Sortie dans un Fichier tout en Affichant les Erreurs](#enregistrer-la-sortie-dans-un-fichier-tout-en-affichant-les-erreurs)
  - [Utiliser `tree` pour Générer un Arbre en HTML](#utiliser-tree-pour-générer-un-arbre-en-html)


```bash
sudo apt-get install tree
```

La commande `tree` est un outil puissant sous Linux et UNIX pour afficher le contenu des répertoires sous forme d'arborescence graphique. Voici les paramètres (options) les plus courants et leur signification :

## Options de Base

- **`-a`** : Affiche tous les fichiers, y compris les fichiers cachés (ceux commençant par un point).
- **`-d`** : Liste uniquement les répertoires.
- **`-l`** : Suit les liens symboliques comme s'ils étaient des répertoires.
- **`-f`** : Affiche le chemin complet de chaque fichier.
- **`-i`** : N'affiche pas l'indentation des lignes et les caractères de branchement, créant une sortie plus sobre.
- **`-q`** : Remplace les caractères non imprimables par des points d'interrogation.
- **`-N`** : N'échappe pas les caractères spéciaux (l'effet inverse de `-q`).

## Options d'Affichage et de Tri

- **`-r`** : Inverse l'ordre du tri, affichant les résultats en ordre décroissant.
- **`-t`** : Trie les fichiers par date de dernière modification, les plus récents d'abord.
- **`-X`** : Trie les fichiers par extension.
- **`-v`** : Trie les fichiers alphanumériquement, ce qui est utile pour trier les noms de fichiers avec des numéros.

## Options de Filtrage

- **`-P pattern`** : N'affiche que les fichiers correspondant au motif (pattern) spécifié.
- **`-I pattern`** : Exclut les fichiers correspondant au motif spécifié de l'affichage.
- **`--matchdirs`** : Inclut les noms de dossiers dans les recherches de motifs avec `-P` ou `-I`.

## Options de Format

- **`-C`** : Colore la sortie. Les couleurs indiquent différents types de fichiers (par exemple, dossier, lien symbolique).
- **`-h`** : Affiche la taille des fichiers en format lisible par l'homme (par exemple, en KB, MB).
- **`--charset charset`** : Utilise un jeu de caractères spécifique pour l'affichage.

## Options Avancées

- **`-s`** : Affiche la taille cumulée de chaque répertoire.
- **`--du`** : Affiche la taille du répertoire uniquement pour les répertoires listés, similaire à `du` sous Unix.
- **`-H`** : Génère une sortie en HTML.
- **`-o filename`** : Redirige la sortie de `tree` vers un fichier spécifié.
- **`-n`** : N'affiche pas les lignes d'indentation, rendant la sortie plus propre pour être lue par des machines ou pour le traitement de texte.
- **`-L level`** : Limite la récursion à un nombre spécifié de niveaux de sous-répertoires.

Pour afficher les fichiers et dossiers en utilisant un affichage de type "arbre" (`tree`), vous pouvez utiliser la commande `tree` si elle est disponible sur votre système Linux. La commande `tree` affiche de manière récursive le contenu d'un répertoire sous forme d'arborescence graphique.

Si `tree` n'est pas installé sur votre système, vous pouvez généralement l'installer via le gestionnaire de paquets de votre distribution Linux. Par exemple, sur les systèmes basés sur Debian (comme Ubuntu), vous pouvez l'installer avec :

## Exemples

### Pour afficher l'arborescence des dossiers et fichiers
- :

  ```bash
  tree /chemin/du/dossier
  ```

  Remplacez `/chemin/du/dossier` par le chemin du dossier que vous souhaitez explorer.

### Pour afficher uniquement les dossiers
- :

  ```bash
  tree -d /chemin/du/dossier
  ```

  L'option `-d` indique à `tree` de lister uniquement les répertoires.

### Pour limiter la profondeur de l'arborescence
- :

  ```bash
  tree -L N /chemin/du/dossier
  ```

  Remplacez `N` par le niveau de profondeur souhaité. Par exemple, `tree -L 2` affichera l'arborescence jusqu'à deux niveaux de profondeur.

### Pour inclure la taille des fichiers
- :

  ```bash
  tree -h /chemin/du/dossier
  ```

    L'option `-h` rend la taille des fichiers lisible par un humain (affichée en K, M, G, etc.).

### Pour ignorer un certain type de fichiers
- :

  ```bash
  tree -I 'pattern' /chemin/du/dossier
  ```

  Remplacez `'pattern'` par le motif des fichiers à ignorer. Par exemple, `tree -I '*.txt'` ignorera tous les fichiers `.txt`.

### Pour sauvegarder la sortie de `tree` dans un fichier
- :

  ```bash
  tree /chemin/du/dossier > sortie_tree.txt
  ```

### Afficher les Fichiers et Dossiers avec Permissions et Propriétaires

- **Afficher les permissions, les groupes et les propriétaires :**

  ```bash
  tree -pug /chemin/du/dossier
  ```
  
  - `-p` affiche les permissions (par exemple, `drwxr-xr-x`).
  - `-u` affiche le propriétaire du fichier.
  - `-g` affiche le groupe du fichier.

### Filtrer l'Affichage par Type de Fichier

- **Afficher uniquement un certain type de fichier :**

  ```bash
  tree -P '*.txt' /chemin/du/dossier
  ```
  
  Cet exemple liste tous les fichiers `.txt`. L'option `-P` permet de spécifier un motif pour les noms de fichier à inclure.

### Exclure des Fichiers ou Dossiers Spécifiques

- **Exclure des fichiers ou dossiers par nom :**

  ```bash
  tree -I 'node_modules|target|.git' /chemin/du/dossier
  ```
  
  Cela exclut les dossiers `node_modules`, `target`, et `.git` de l'affichage. Très utile pour ignorer les répertoires volumineux ou non pertinents.

### Afficher un Résumé à la Fin

- **Inclure un résumé à la fin de l'arborescence :**

  ```bash
  tree -a /chemin/du/dossier --du -h
  ```
  
  - `-a` inclut tous les fichiers (même les cachés).
  - `--du` affiche la taille des répertoires.
  - `-h` affiche la taille des fichiers et répertoires de manière lisible (en K, M, G, etc.).
  
  Cette commande fournit un aperçu du total de l'espace disque utilisé par chaque répertoire.

### Colorer la Sortie

- **Colorer la sortie de `tree` :**

  ```bash
  tree -C /chemin/du/dossier
  ```
  
  L'option `-C` active la coloration de la sortie, rendant l'affichage plus lisible, avec des couleurs différentes pour les dossiers, fichiers, liens symboliques, etc.

### Enregistrer la Sortie dans un Fichier tout en Affichant les Erreurs

- **Sauvegarder la sortie dans un fichier et afficher les erreurs :**

  ```bash
  tree /chemin/du/dossier > sortie_tree.txt 2> erreurs_tree.txt
  ```
  
  Cette commande redirige la sortie standard vers `sortie_tree.txt` et les erreurs vers `erreurs_tree.txt`, permettant une analyse plus facile des problèmes potentiels.

### Utiliser `tree` pour Générer un Arbre en HTML

- **Générer une vue en HTML de l'arborescence :**

  ```bash
  tree -H 'http://example.com/' -o output.html /chemin/du/dossier
  ```
  
  - `-H` spécifie l'URL de base pour les liens hypertextes.
  - `-o` spécifie le fichier de sortie.
  
  Cette commande crée un fichier HTML (`output.html`) représentant l'arborescence du dossier spécifié, avec des liens permettant une navigation facile.

Ces exemples montrent que `tree` peut être adapté à une grande variété de besoins, allant de l'analyse simple de structure de dossiers à des rapports détaillés et personnalisés.