---
title: Exécution de commandes avec find
date: 2024-07-27
tags:
  - ressource
  - projet
status:
  - En cours
  - Complété
type de note:
  - ressource
  - projet
date de modification: 2024-07-27
timestamp: 19:21
référence:
  - "[[02_RESSOURCES/Linux/programme/find]]"
auteur: aGrellard
source:
  - chatgpt
---

# Exécution de commandes avec find

L'option `-exec` de **`find`** permet d'exécuter une commande sur chaque fichier trouvé. En utilisant **`sh -c`**, nous pouvons écrire des **commandes shell** ou inclure des **scripts** grâce aux capacités du shell. 

### Syntaxe

```bash
find [point_de_départ] [critères] -exec sh -c 'commande' {} \;
```

- `{}` : Place-holder pour le nom du fichier trouvé.
- `\;` : Termine la commande `-exec`.

### Utilisation de `{}`et `_`

Lorsqu'on utilise `-exec sh -c`, le **shell** invoqué ne sait pas automatiquement que `{}` doit être remplacé par le résulta de **find**. Pour éviter cela, utilisons `_` comme un argument supplémentaire, qui sera **ignoré** par sh, mais requis par `find`.

```bash
find . -name "*.txt" -exec sh -c 'mv "$1" "${1%.txt}.bak"' _ {} \;
```

### Combiner plusieurs commandes

Pour exécuter plusieurs commandes sur chaque fichier trouvé, nous pouvons les combiner en utilisant `;` dans la chîne de commandes passée à `sh -c`.

```bash
find . -name "*.log" -exec sh -c 'gzip "$1"; mv "$1.gz" /backup/' _ {} \;
```

## Exemples concrets

### Exemple 1 : Suppression de fichiers avec confirmation

Supposons que vous souhaitiez trouver et supprimer des fichiers avec confirmation :

```bash
find . -type f -name "*.tmp" -exec sh -c 'echo "Supprimer le fichier : $1 ? (y/n)"; read reponse; [ "$reponse" = "y" ] && rm "$1"' _ {} \;
```

**Explication :**

- `find . -type f -name "*.tmp"` : Recherche tous les fichiers avec l'extension `.tmp`.
- `sh -c 'echo "Supprimer le fichier : $1 ? (y/n)"; read reponse; [ "$reponse" = "y" ] && rm "$1"' _ {}` : Demande confirmation avant de supprimer chaque fichier.

### Exemple 2 : Renommage de fichiers

Renommer tous les fichiers `.txt` en `.bak` :

```bash
find . -type f -name "*.txt" -exec sh -c 'mv "$1" "${1%.txt}.bak"' _ {} \;
```

**Explication :**

- `mv "$1" "${1%.txt}.bak"` : Renomme chaque fichier `.txt` en `.bak`.
- **`${1%.txt}`** :
    - **`${...}`** : C'est la syntaxe pour l'expansion des paramètres dans le shell. Cela permet d'accéder et de manipuler la valeur des variables.
    - **`1`** : Référence au premier argument passé au script ou à la commande (le même que `$1`).
    - **`%`** : C'est un opérateur de suppression de suffixe dans les expansions de paramètres du shell.
        - **`${1%.txt}`** : Supprime le plus court suffixe correspondant au motif `.txt` de la valeur de `1`.
        - Par exemple, si `$1` est `file.txt`, `${1%.txt}` devient `file`.
- **`${1%.txt}.bak`** :
    - Après avoir supprimé `.txt` de la valeur de `$1`, ajoute `.bak` à la fin du nom de fichier résultant.
    - Par exemple, si `$1` est `file.txt`, `${1%.txt}.bak` devient `file.bak`.
### Exemple 3 : Copie de fichiers vers un autre répertoire

Copier tous les fichiers `.log` vers `/backup` :

```bash
find . -type f -name "*.log" -exec sh -c 'cp "$1" /backup/' _ {} \;
```

**Explication :**

- `cp "$1" /backup/` : Copie chaque fichier `.log` vers le répertoire `/backup`.

### Exemple 4 : Ajout d'une ligne de texte à chaque fichier trouvé

Ajouter une ligne de texte à la fin de chaque fichier `.txt` :

```bash
find . -type f -name "*.txt" -exec sh -c 'echo "Ligne ajoutée" >> "$1"' _ {} \;
```

**Explication :**

- `echo "Ligne ajoutée" >> "$1"` : Ajoute la ligne "Ligne ajoutée" à la fin de chaque fichier `.txt`.

### Exemple 5 : Compression de fichiers trouvés

Compresser tous les fichiers `.log` en utilisant `gzip` :

```bash
find . -type f -name "*.log" -exec sh -c 'gzip "$1"' _ {} \;
```

**Explication :**

- `gzip "$1"` : Compresse chaque fichier `.log` trouvé.

### Exemple 6 : Exécution de plusieurs commandes sur chaque fichier

Supposons que vous vouliez compresser les fichiers et ensuite les déplacer vers un répertoire spécifique :

```bash
find . -type f -name "*.log" -exec sh -c 'gzip "$1"; mv "$1.gz" /backup/' _ {} \;
```

**Explication :**

- `gzip "$1"` : Compresse chaque fichier `.log`.
- `mv "$1.gz" /backup/` : Déplace chaque fichier compressé vers `/backup`.













