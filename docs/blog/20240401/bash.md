Pour obtenir un résultat similaire à ce que vous recherchez avec `ls -lshaR` mais en utilisant `find` et `stat` pour une meilleure fiabilité, vous pouvez combiner ces commandes pour extraire les permissions des fichiers et des répertoires, puis utiliser `awk` pour compter et classer les occurrences de chaque masque de permission.

La commande `find` peut être utilisée pour parcourir récursivement les répertoires et `stat` pour afficher les informations de statut des fichiers, y compris les permissions, de manière plus fiable que `ls`.

Voici comment vous pourriez faire :

```sh
find . -type f -exec stat --format '%A' {} + | awk '{a[$1]++}END{for(i in a){print a[i]" "i}}' | sort -nr
```

ou pour les fichiers **et** les répertoires :

```sh
find . \( -type f -o -type d \) -exec stat --format '%A' {} + | awk '{a[$1]++}END{for(i in a){print a[i]" "i}}' | sort -nr
```

Détails de la commande :

- `find .` : Cherche récursivement dans le répertoire courant (`.`).
- `\( -type f -o -type d \)` : Cherche les fichiers (`-type f`) et les dossiers (`-type d`).
- `-exec stat --format '%A' {} +` : Pour chaque fichier ou dossier trouvé, exécute `stat` avec le format `%A` qui affiche les permissions de fichier en format lisible (par exemple, `drwxr-xr-x`). L'accolade `{}` est remplacée par le nom du fichier courant, et `+` à la fin exécute `stat` avec autant de noms de fichiers que possible par invocation, ce qui améliore l'efficacité par rapport à l'utilisation de `\;`.
- `awk '{a[$1]++}END{for(i in a){print a[i]" "i}}'` : `awk` est utilisé pour compter les occurrences de chaque masque de permission unique trouvé par `stat` et imprimer le compte à la fin.
- `sort -nr` : Trie les résultats numériquement en ordre décroissant pour montrer les masques de permissions les plus fréquents en haut.

Cette approche vous donne un décompte des permissions de fichier/dossier dans le répertoire courant et tous ses sous-répertoires, en utilisant des outils qui sont généralement plus fiables pour ce genre de tâche que `ls`, surtout lorsque vous avez affaire à des noms de fichiers complexes.