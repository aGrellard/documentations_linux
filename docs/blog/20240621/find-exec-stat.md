Pour trier les résultats par date de modification, vous pouvez combiner la commande `find` avec `stat` et `sort`. Voici comment procéder :

### Utilisation de `-exec stat` et `sort`

1. Utilisez `find` pour lister les fichiers et afficher leurs dates de modification avec `stat`.
2. Utilisez `sort` pour trier les résultats par date.

Voici la commande complète :

```sh
find . -iname "*.code-profile" -exec stat --format '%Y %n' {} \; | sort -n | awk '{print $2}'
```

Explication :
- `find . -iname "*.code-profile" -exec stat --format '%Y %n' {} \;` : Trouve les fichiers avec l'extension `.code-profile` et affiche l'epoch time (nombre de secondes depuis le 1er janvier 1970) suivi du nom du fichier.
- `sort -n` : Trie les lignes par ordre numérique (donc par date).
- `awk '{print $2}'` : Extrait et affiche uniquement le nom du fichier après le tri.

### Utilisation de `-printf` et `sort`

Une autre méthode consiste à utiliser `-printf` de `find` et à trier les résultats :

```sh
find . -iname "*.code-profile" -printf '%T@ %p\n' | sort -n | awk '{print $2}'
```

Explication :
- `find . -iname "*.code-profile" -printf '%T@ %p\n'` : Trouve les fichiers avec l'extension `.code-profile` et affiche l'epoch time suivi du chemin du fichier.
- `sort -n` : Trie les lignes par ordre numérique (par date).
- `awk '{print $2}'` : Extrait et affiche uniquement le chemin du fichier après le tri.

### Affichage avec les dates triées

Si vous souhaitez afficher les fichiers avec leurs dates de modification triées, utilisez cette commande :

```sh
find . -iname "*.code-profile" -exec stat --format '%Y %y %n' {} \; | sort -n | awk '{print $3, $4, $5, $6, $7, $8}'
```

Explication :
- `find . -iname "*.code-profile" -exec stat --format '%Y %y %n' {} \;` : Affiche l'epoch time, la date de modification et le chemin du fichier.
- `sort -n` : Trie les lignes par ordre numérique (par date).
- `awk '{print $3, $4, $5, $6, $7, $8}'` : Extrait et affiche la date de modification et le chemin du fichier après le tri.

### Exemple pratique

Pour illustrer, voici un exemple pratique :

```sh
$ find . -iname "*.code-profile" -exec stat --format '%Y %y %n' {} \; | sort -n | awk '{print $3, $4, $5, $6, $7, $8}'
./example.code-profile 2023-06-20 15:23:42.123456789 +0000
./test/code-profile.sample.code-profile 2024-01-11 10:12:30.987654321 +0000
```

Cette commande liste les fichiers `.code-profile` triés par date de modification avec leurs dates affichées.