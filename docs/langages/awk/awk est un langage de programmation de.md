`awk` est un langage de programmation de manipulation de données et un outil en ligne de commande utilisé pour traiter et analyser des fichiers texte. Il est particulièrement puissant pour travailler sur des fichiers structurés en colonnes. Voici une liste non exhaustive des options et des commandes (patterns et actions) les plus couramment utilisées avec `awk`:

### Options de Ligne de Commande

- `-F` : Définit le séparateur de champs. Par exemple, `-F,` utilise la virgule comme séparateur.
- `-v` : Permet de définir une variable externe. Par exemple, `-v OFS=,` définit le séparateur de champs en sortie.
- `-f` : Permet de lire le script `awk` à partir d'un fichier.

### Patterns et Actions

- `BEGIN` : Bloc d'instructions exécuté avant la lecture des entrées.
- `END` : Bloc d'instructions exécuté après la lecture de toutes les entrées.
- `/pattern/` : Sélectionne les lignes qui correspondent à `pattern`.
- `{ action }` : Exécute `action` sur les lignes sélectionnées ou sur chaque ligne si aucun pattern n'est spécifié.

### Variables Intégrées

- `FS` : Séparateur de champs d'entrée.
- `OFS` : Séparateur de champs de sortie.
- `NR` : Numéro de l'enregistrement courant.
- `NF` : Nombre de champs dans l'enregistrement courant.
- `FILENAME` : Nom du fichier d'entrée en cours de traitement.

### Fonctions Intégrées

- `print` : AfficheAffiche des valeurs. Par défaut, imprime la ligne entière.
- `printf` : Affiche des valeurs selon un format spécifié.
- `split` : Divise une chaîne en un tableau selon un séparateur.
- `substr` : Extrait une sous-chaîne.
- `length` : Retourne la longueur d'une chaîne.
- `match` : Recherche une expression régulière dans une chaîne.

### Expressions Régulières

- Utilisées pour les motifs de sélection (`/pattern/`) et les fonctions comme `match`.
- Syntaxe typique des expressions régulières (caractères jokers, groupes, etc.).

### Opérateurs

- Opérateurs arithmétiques : `+`, `-`, `*`, `/`, `%` (modulo).
- Opérateurs de comparaison : `==`, `!=`, `>`, `<`, `>=`, `<=`.
- Opérateurs logiques : `&&` (ET), `||` (OU), `!` (NON).

### Exemple de Commande `awk`

```bash
awk -F, '{ if ($2 > 100) print $1 }' fichier.txt
```

Cette commande lit `fichier.txt`, utilise la virgule comme séparateur de champs, et affiche la première colonne de chaque ligne où la deuxième colonne a une valeur supérieure à 100.

`awk` est un outil très riche et flexible. Pour une liste complète des options, des commandes et des fonctionnalités, la consultation de la documentation officielle ou de manuels d'utilisation détaillés est recommandée.