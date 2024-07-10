Les fonctions intégrées dans `awk` offrent une gamme variée de fonctionnalités, permettant de manipuler des chaînes de caractères, des nombres, et d'exécuter des opérations sur des tableaux. Voici un approfondissement sur certaines des fonctions intégrées les plus couramment utilisées dans `awk`:

### Manipulation de chaînes de caractères

- `print` : AfficheAffiche des valeurs. Par défaut, imprime la ligne entière.
  
- `printf` : Affiche des valeurs selon un format spécifié.
  
- `length(string)` : Retourne la longueur de `string`. Si `string` n'est pas spécifié, retourne la longueur de la ligne entière.

- `substr(string, start [, length])` : Extrait et retourne une sous-chaîne de `string` commençant à la position `start` (base 1) et de longueur `length`. Si `length` n'est pas spécifié, retourne le reste de la chaîne.

- `index(string, substring)` : Retourne la position de la première occurrence de `substring` dans `string`, ou 0 si `substring` n'est pas trouvée.

- `match(string, regexp)` : Recherche `regexp` dans `string`. Retourne la position de la première occurrence, et définit les variables `RSTART` et `RLENGTH` à la position et à la longueur de la correspondance. Retourne 0 si aucune correspondance n'est trouvée.

- `gsub(regexp, replacement, target)` : Remplace globalement toutes les occurrences de `regexp` dans `target` par `replacement`. Si `target` n'est pas spécifié, la substitution est effectuée sur la ligne entière. Retourne le nombre de substitutions effectuées.

- `sub(regexp, replacement, target)` : Identique à `gsub`, mais remplace seulement la première occurrence de `regexp`.

- `split(string, array [, separator])` : Divise `string` en éléments séparés par `separator` et stocke les éléments dans `array`. Si `separator` n'est pas spécifié, utilise la valeur de `FS`. Retourne le nombre d'éléments.

- `toupper(string)` : Convertit tous les caractères de `string` en majuscules.
  
- `tolower(string)` : Convertit tous les caractères de `string` en minuscules.
  
- `sprintf(format, arguments...)` : Retourne une chaîne formatée selon `format`, similaire à `printf` mais retourne la chaîne au lieu de l'imprimer.

### Manipulation numérique

- `int(x)` : Retourne la partie entière de `x`, tronquant vers zéro.

- `sqrt(x)` : Retourne la racine carrée de `x`.

- `exp(x)` : Retourne l'exponentielle de `x`.

- `log(x)` : Retourne le logarithme naturel de `x`.

- `sin(x)`, `cos(x)`, `atan2(y, x)` : Fonctions trigonométriques.

### Opérations sur les tableaux

- `asort(source, dest [, how])` : Trie `source` et stocke le résultat dans `dest`. `how` peut spécifier la méthode de tri. Retourne le nombre d'éléments.

- `asorti(source, dest [, how])` : Trie les indices de `source` et stocke le résultat dans `dest`. Cela est utile pour trier les tableaux associatifs par leur clé. Retourne le nombre d'éléments.

### Autres fonctions utiles

- `systime()` : Retourne l'heure actuelle en tant que nombre de secondes depuis l'époque Unix (1er janvier 1970).

- `strftime(format [, timestamp])` : Formate `timestamp` selon `format`. Si `timestamp` n'est pas fourni, utilise l'heure actuelle.

Ces fonctions intégrées rendent `awk` extrêmement puissant pour le traitement de texte et l'analyse de données directement depuis la ligne de commande. Pour une utilisation avancée et des cas spécifiques, il est recommandé de consulter la documentation officielle de `awk` ou des tutoriels spécialisés pour explorer plus en détail les capacités et les applications de ces fonctions.