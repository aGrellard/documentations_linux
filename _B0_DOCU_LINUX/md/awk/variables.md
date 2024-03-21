`awk` offre un ensemble de variables intégrées qui permettent d'accéder à des informations sur les données en cours de traitement, de configurer le comportement du programme, et d'effectuer des tâches de manipulation de texte et de données plus efficacement. Voici une liste détaillée de ces variables intégrées, avec des explications, des exemples de syntaxe, et des informations sur leur utilisation.

### Variables de Contrôle de Champ

- **FS** : Le "Field Separator" (Séparateur de champs) est utilisé pour définir le caractère ou l'expression régulière qui sépare les champs dans un enregistrement (ligne) d'entrée. Par défaut, il est défini sur l'espace blanc (espaces et tabulations).
  - `FS=","` : Sépare les champs par des virgules.
- **OFS** : L'"Output Field Separator" (Séparateur de champs en sortie) définit le caractère à utiliser pour séparer les champs lors de l'utilisation de `print`.
  - `OFS=","` : Utilise la virgule comme séparateur de champs en sortie.
- **RS** : Le "Record Separator" (Séparateur d'enregistrements) est utilisé pour définir le caractère qui sépare les enregistrements dans l'entrée. Par défaut, il s'agit du saut de ligne, ce qui signifie que chaque ligne est traitée comme un enregistrement séparé.
  - `RS="\n\n"` : Utilise des paragraphes séparés par des lignes vides comme enregistrements.
- **ORS** : L'"Output Record Separator" (Séparateur d'enregistrements en sortie) définit le caractère à utiliser pour séparer les enregistrements lors de l'utilisation de `print`.
  - `ORS="\n\n"` : Sépare les enregistrements en sortie par des lignes vides.

### Variables de Données d'Enregistrement

- **NR** : Le "Number of Records" (Nombre d'enregistrements) indique le nombre total d'enregistrements traités jusqu'à présent.
- **NF** : Le "Number of Fields" (Nombre de champs) dans l'enregistrement courant. Utile pour itérer sur tous les champs d'un enregistrement.
- **FNR** : Similaire à NR, mais réinitialisé à 1 pour chaque fichier d'entrée traité. Utile lorsque plusieurs fichiers sont passés à `awk`.

### Variables de Noms de Fichiers

- **FILENAME** : Le nom du fichier d'entrée en cours de traitement.

### Variables pour la Modification des Données

- **$0** : Représente l'enregistrement entier (la ligne entière). Peut être modifié pour changer l'enregistrement avant qu'il soit traité ou imprimé.
- **$1, $2, ..., $n** : Représentent les champs individuels d'un enregistrement, où `$1` est le premier champ, `$2` le deuxième, et ainsi de suite.

### Variables de Manipulation de Chaînes

- **SUBSEP** : Le "Subscript Separator" (Séparateur d'indice) utilisé dans les tableaux multidimensionnels. Par défaut, il est défini sur "\034".
  - `a[i,j]` crée en interne une clé de chaîne utilisant SUBSEP entre `i` et `j`.

### Variables liées au Traitement de Texte

- **CONVFMT** : Le "Conversion Format" (Format de conversion) pour les nombres lors de la conversion en chaînes, par défaut à "%.6g".
- **OFMT** : Le format de sortie pour les nombres, similaire à CONVFMT mais utilisé par `print` et `printf`. Par défaut à "%.6g".

### Variables liées au Temps et au Hasard

- **RSTART** et **RLENGTH** : Après un appel réussi à la fonction `match()`, `RSTART` contient la position du début de la correspondance, et `RLENGTH` sa longueur.
- **RANDMAX** : La plus grande valeur pouvant être retournée par la fonction `rand()`. Cela varie selon les implémentations d'`awk`.

### Exemples d'Utilisation

**FS et OFS** :

```awk
awk 'BEGIN { FS=":"; OFS=" - " } { print $1, $2 }' /etc/passwd
```

Cette commande lit `/etc/passwd